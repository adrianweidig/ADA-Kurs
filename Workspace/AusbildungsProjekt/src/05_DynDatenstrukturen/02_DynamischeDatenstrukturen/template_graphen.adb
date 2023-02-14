with Ada.Text_IO;
with Ada.Unchecked_Deallocation;

procedure Template_Graphen is

   -- Weitere Vereinbarungen
   type STRING_REF is access STRING;

   -- Die DS Graph-------------------
   type KNOTEN_TR;
   type KNOTEN_REF is access KNOTEN_TR;

   type KANTEN_TR;
   type KANTEN_REF is access KANTEN_TR;


   type KNOTEN_TR is record
      Nummer           : NATURAL;
      Info_Ptr         : STRING_REF;
      Markierung       : NATURAL;
      Kanten_Liste_Ptr : KANTEN_REF;
      Next_Knoten_Ptr  : KNOTEN_REF;
   end record;

   type KANTEN_TR is record
      Info            : NATURAL;
      Markierung      : NATURAL;
      Ziel_Knoten_Ptr : KNOTEN_REF;
      Next_Kanten_Ptr : KANTEN_REF;
   end record;
   -----------------------------------

   Das_Wegenetz : KNOTEN_REF;

   -- Moegliche Fehler
   Nummer_Bereits_Vorhanden : exception;
   Knoten_nicht_vorhanden   : exception;
   Kante_bereits_vorhanden  : exception;
   Kante_nicht_vorhanden    : exception;


   --------------------------------------------------------
   --  Prozeduren zu Deallokation von Speicher
   --------------------------------------------------------
   procedure Freigabe_Kante is new Ada.Unchecked_Deallocation (
                                                               KANTEN_TR,
                                                               KANTEN_REF);
   procedure Freigabe_Knoten is new Ada.Unchecked_Deallocation (
                                                                KNOTEN_TR,
                                                                KNOTEN_REF);

   pragma Controlled(KNOTEN_REF);
   pragma Controlled(KANTEN_REF);


   -- Spezifikationen
   procedure Knoten_Einfuegen (Graph_Ptr : in out KNOTEN_REF; Info : in STRING_REF; Knoten_Nummer : in NATURAL);
   procedure Kanten_Einfuegen (Graph_Ptr : in KNOTEN_REF; Info : in NATURAL; Start,Ziel : in NATURAL);
   procedure Kanten_Ausfuegen (Graph_Ptr : in KNOTEN_REF; Start_Knoten_Nummer, End_Knoten_Nummer  : in NATURAL);
   procedure Alle_Kanten_Loeschen(Kanten_Listen_Ptr : in out KANTEN_REF);
   procedure Knoten_Ausfuegen(Graph_Ptr : in out KNOTEN_REF; Nummer : in NATURAL);
   procedure Ausgabe_Knoten( Knoten_Ptr : in KNOTEN_REF);
   procedure Ausgabe_Kante(Kanten_Ptr : in KANTEN_REF);
   procedure Ausgabe_Aller_Kanten(Kanten_Ptr : in KANTEN_REF);
   procedure Ausgabe_Wegenetz(Graph_Ptr : in KNOTEN_REF);
   procedure Markierung_Kanten_Zurueck_Setzen(Kanten_Ptr : in KANTEN_REF);
   procedure Alle_Markierungen_Kanten_Zurueck_Setzen(Kanten_Ptr : in KANTEN_REF);
   procedure Markierung_Knoten_Zurueck_Setzen(Knoten_Ptr : in KNOTEN_REF);
   procedure Alle_Markierungen_Zurueck_Setzen(Graph_Ptr : in KNOTEN_REF);
   procedure Markierung_Knoten_Erhoehen(Kanten_Ptr : in KANTEN_REF);
   procedure Alle_Kanten_Eines_Knoten_Besuchen(Kanten_Ptr : in KANTEN_REF);
   procedure Ermittle_Ankommende_Kanten(Knoten_Ptr : in KNOTEN_REF);
   function Gebe_Anzahl_Knoten_Markierungen(Knoten_Ptr : in KNOTEN_REF) return NATURAL;
   function Meisten_Ankommende_Kanten(Graph_Ptr : in KNOTEN_REF) return STRING_REF;


   ------------  Bodies -----------------------------------
   --------------------------------------------------------
   -- Knoten Einfuegen
   --------------------------------------------------------
   procedure Knoten_Einfuegen (Graph_Ptr : in out KNOTEN_REF; Info : in STRING_REF; Knoten_Nummer : in NATURAL) is
      Hilf_Ptr : KNOTEN_REF := Graph_Ptr;
   begin

      -- Knoten schon vorhanden?
      while Hilf_Ptr /= null loop
         if Hilf_Ptr.Nummer = Knoten_Nummer then
            raise Nummer_bereits_Vorhanden;
         end if;
         Hilf_Ptr := Hilf_Ptr.Next_Knoten_Ptr;
      end loop;

      -- Vorne in die Knotenliste einhaengen
      Graph_Ptr := new KNOTEN_TR'(Nummer               => Knoten_Nummer,
                                  Info_Ptr             => Info,
                                  Markierung           => 0,
                                  Kanten_Liste_Ptr     => null,
                                  Next_Knoten_Ptr      => Graph_Ptr);
   end Knoten_Einfuegen;
   --------------------------------------------------------

   --------------------------------------------------------
   -- Kanten Einfuegen
   --------------------------------------------------------
   procedure Kanten_Einfuegen (Graph_Ptr : in KNOTEN_REF; Info : in NATURAL; Start,Ziel : in NATURAL) is

      Start_Ptr, Ziel_Ptr : KNOTEN_REF;
      Hilf_Kno_Ptr : KNOTEN_REF := Graph_Ptr;
      Hilf_Kan_Ptr : KANTEN_REF;

   begin

      -- Start und Zielzeiger richtig setzen
      while Hilf_Kno_Ptr /= null loop
         if Start = Hilf_Kno_Ptr.Nummer then
            Start_Ptr := Hilf_Kno_Ptr;
         end if;

         if Ziel = Hilf_Kno_Ptr.Nummer then
            Ziel_Ptr := Hilf_Kno_Ptr;
         end if;

         Hilf_Kno_Ptr := Hilf_Kno_Ptr.Next_Knoten_Ptr;
      end loop;

      -- Start und Ziel vorhanden?
      if Start_Ptr = null or Ziel_Ptr = null then
         raise Knoten_nicht_vorhanden;
      end if;

      -- Ist die Verbindung bereits vorhanden?
      Hilf_Kan_Ptr := Start_Ptr.Kanten_Liste_Ptr;

      while Hilf_Kan_Ptr /= null loop

         if Hilf_Kan_Ptr.Ziel_Knoten_Ptr = Ziel_Ptr then
            raise Kante_bereits_vorhanden;
         end if;

         Hilf_Kan_Ptr := Hilf_Kan_Ptr.Next_Kanten_Ptr;
      end loop;

      -- Kante einfuegen
      Start_Ptr.Kanten_Liste_Ptr := new KANTEN_TR'(Info => Info,
                                                   Markierung => 0,
                                                   Ziel_Knoten_Ptr => Ziel_Ptr,
                                                   Next_Kanten_Ptr => Start_Ptr.Kanten_Liste_Ptr);

   end Kanten_Einfuegen;

   procedure Kanten_Ausfuegen (Graph_Ptr : in KNOTEN_REF;
                               Start_Knoten_Nummer,
                               End_Knoten_Nummer   : in     NATURAL) is

      Aktueller_Knoten_Ptr : KNOTEN_REF := Graph_Ptr;
      Ausfuege_Kante_Ptr,
      Vorgaenger_Kante_Ptr : KANTEN_REF;

   begin -- Ausfuegen

      -- Startknoten suchen:
      while Aktueller_Knoten_Ptr /= null and then
        Aktueller_Knoten_Ptr.Nummer /= Start_Knoten_Nummer loop

         Aktueller_Knoten_Ptr := Aktueller_Knoten_Ptr.Next_Knoten_Ptr;
      end loop;

      if Aktueller_Knoten_Ptr = null then
         raise Kante_Nicht_Vorhanden;
      end if;
      -- Endknoten in der Kantenliste des Startknotens suchen:
      Ausfuege_Kante_Ptr   := Aktueller_Knoten_Ptr.Kanten_Liste_Ptr;
      Vorgaenger_Kante_Ptr := Aktueller_Knoten_Ptr.Kanten_Liste_Ptr;

      while Ausfuege_Kante_Ptr /= null and then
        Ausfuege_Kante_Ptr.Ziel_Knoten_Ptr.Nummer /=
          End_Knoten_Nummer loop
         Vorgaenger_Kante_Ptr := Ausfuege_Kante_Ptr;
         Ausfuege_Kante_Ptr   := Ausfuege_Kante_Ptr.Next_Kanten_Ptr;
      end loop;

      -- Kante ausfuegen, aber nur, falls vorhanden:

      if Ausfuege_Kante_Ptr = null then
         raise Kante_Nicht_Vorhanden;

      elsif Ausfuege_Kante_Ptr = Vorgaenger_Kante_Ptr then -- 1. Kante
         Aktueller_Knoten_Ptr.Kanten_Liste_Ptr :=
           Aktueller_Knoten_Ptr.Kanten_Liste_Ptr.Next_Kanten_Ptr;

      else
         Vorgaenger_Kante_Ptr.Next_Kanten_Ptr := Ausfuege_Kante_Ptr.Next_Kanten_Ptr;

      end if;
      Freigabe_Kante(Ausfuege_Kante_Ptr);

   end Kanten_Ausfuegen;

   procedure Alle_Kanten_Loeschen(Kanten_Listen_Ptr : in out KANTEN_REF) is
   	Hilfs_Ptr : KANTEN_REF;
   begin
      while Kanten_Listen_Ptr /= null loop
      	 Hilfs_Ptr := Kanten_Listen_Ptr;
         Kanten_Listen_Ptr := Kanten_Listen_Ptr.Next_Kanten_Ptr;
         -- Kante wird geloescht
         Freigabe_Kante(Hilfs_Ptr);
      end loop;

   end Alle_Kanten_Loeschen;

   procedure Knoten_Ausfuegen (Graph_Ptr : in out KNOTEN_REF;
                               Nummer   : in     NATURAL) is

      Ausfuege_Knoten_Ptr,
      Vorgaenger_Knoten_Ptr : KNOTEN_REF := Graph_Ptr;
      Aktueller_Knoten_Ptr  : KNOTEN_REF;
      Ausfuege_Kante_Ptr,
      Vorgaenger_Kante_Ptr  : KANTEN_REF;

   begin -- Ausfuegen

      -- Knoten suchen:
      while Ausfuege_Knoten_Ptr /= null
        and then Ausfuege_Knoten_Ptr.Nummer /= Nummer loop
         Vorgaenger_Knoten_Ptr := Ausfuege_Knoten_Ptr;
         Ausfuege_Knoten_Ptr   := Ausfuege_Knoten_Ptr.Next_Knoten_Ptr;
      end loop;

      if Ausfuege_Knoten_Ptr = null then
         raise Knoten_Nicht_Vorhanden;
      end if;

      -- Knoten ausketten; damit sind auch alle Kanten entfernt,
      -- die diesen Knoten als Startknoten haben:
      if Ausfuege_Knoten_Ptr = Vorgaenger_Knoten_Ptr then
         Graph_Ptr := Graph_Ptr.Next_Knoten_Ptr;
      else
         Vorgaenger_Knoten_Ptr.Next_Knoten_Ptr:= Ausfuege_Knoten_Ptr.Next_Knoten_Ptr;
      end if;

      -- Alle Kanten aus Ausfuege-Knoten ausfuegen und loeschen
      Alle_Kanten_Loeschen(Kanten_Listen_Ptr => Ausfuege_Knoten_Ptr.Kanten_Liste_Ptr);

      -- in allen Kantenlisten die Kanten ausfuegen, die den
      -- Knoten als Endknoten haben:
      Aktueller_Knoten_Ptr := Graph_Ptr;
      while Aktueller_Knoten_Ptr /= null loop -- alle Knoten
         -- abarbeiten
         -- fuer jeden Knoten die Kantenliste pruefen:
         Ausfuege_Kante_Ptr   := Aktueller_Knoten_Ptr.Kanten_Liste_Ptr;
         Vorgaenger_Kante_Ptr := Aktueller_Knoten_Ptr.Kanten_Liste_Ptr;

         -- Suche nach Kanten, die den auszufuegenden Knoten als
         -- Endknoten haben:
         while Ausfuege_Kante_Ptr /= null loop

            if Ausfuege_Kante_Ptr.Ziel_Knoten_Ptr = Ausfuege_Knoten_Ptr then
               -- Kante ausfuegen
               if Vorgaenger_Kante_Ptr = Ausfuege_Kante_Ptr then
                  Aktueller_Knoten_Ptr.Kanten_Liste_Ptr :=
                    Aktueller_Knoten_Ptr.Kanten_Liste_Ptr.Next_Kanten_Ptr;
               else
                  Vorgaenger_Kante_Ptr.Next_Kanten_Ptr :=
                  	Ausfuege_Kante_Ptr.Next_Kanten_Ptr;
               end if;
               -- Kante wird geloescht
               Freigabe_Kante(Ausfuege_Kante_Ptr);

               Ausfuege_Kante_Ptr   := Vorgaenger_Kante_Ptr.Next_Kanten_Ptr;

            else
               Vorgaenger_Kante_Ptr := Ausfuege_Kante_Ptr;
               Ausfuege_Kante_Ptr   := Ausfuege_Kante_Ptr.Next_Kanten_Ptr;
            end if;

         end loop;

         Aktueller_Knoten_Ptr := Aktueller_Knoten_Ptr.Next_Knoten_Ptr;
      end loop;

      -- Knoten wird geloescht
      Freigabe_Knoten(Ausfuege_Knoten_Ptr);

   end Knoten_Ausfuegen;


   procedure Ausgabe_Knoten( Knoten_Ptr : in KNOTEN_REF) is
   begin
      -- Aktion ausgabe Konten Nummer und Info
      Ada.Text_IO.Put("Nummer: " & NATURAL'Image(Knoten_Ptr.All.Nummer) &
                        " Info: "  & Knoten_Ptr.All.Info_Ptr.All);

   end Ausgabe_Knoten;


   procedure Ausgabe_Kante(Kanten_Ptr : in KANTEN_REF) is

   begin
      Ada.Text_IO.Put("        Kanten Info: " & NATURAL'Image(Kanten_Ptr.All.Info) & " km ");
      Ada.Text_IO.Put("   Ziel-Knoten: " );
      Ausgabe_Knoten(Kanten_Ptr.All.Ziel_Knoten_Ptr);
      Ada.Text_IO.New_Line;
   end Ausgabe_Kante;


   procedure Ausgabe_Aller_Kanten(Kanten_Ptr : in KANTEN_REF) is
      Hilf_Kan_Ptr : KANTEN_REF := Kanten_Ptr;
   begin
      if Hilf_Kan_Ptr = null then
         Ada.Text_IO.Put_Line("        Ausgabe keine Kanten vorhanden!");
      else
         Ada.Text_IO.Put_Line("        Ausgabe aller Kanten eines Knotens:");
      end if;
      while Hilf_Kan_Ptr /= null loop
         -- Aktion Ausgabe: Kanten Info
         Ausgabe_Kante(Hilf_Kan_Ptr);
         -- weiterschalten zurnaechsten Kante (Listenelement)
         Hilf_Kan_Ptr := Hilf_Kan_Ptr.Next_Kanten_Ptr;
      end loop;

   end Ausgabe_Aller_Kanten;


   procedure Ausgabe_Wegenetz(Graph_Ptr : in KNOTEN_REF) is

      Hilf_Kno_Ptr : KNOTEN_REF := Graph_Ptr;
   begin
      Ada.Text_IO.Put_Line("Ausgabe aller Knoten:");
      -- alle Knoten besuchen
      while Hilf_Kno_Ptr /= null loop
         -- Aktion Ausgabe: Konten Nummer und Info
         Ausgabe_Knoten(Hilf_Kno_Ptr);
         Ada.Text_IO.New_Line;
         Ausgabe_Aller_Kanten(Hilf_Kno_Ptr.Kanten_Liste_Ptr);
         -- weiterschalten zum naechsten Knoten (Listenelement)
         Hilf_Kno_Ptr := Hilf_Kno_Ptr.Next_Knoten_Ptr;
      end loop;

   end Ausgabe_Wegenetz;

   ---------------------------------------------------------------------------

   procedure Markierung_Kanten_Zurueck_Setzen(Kanten_Ptr : in KANTEN_REF) is
   begin
      if Kanten_Ptr /= null then
         Kanten_Ptr.All.Markierung := 0;
      end if;
   end Markierung_Kanten_Zurueck_Setzen;

   procedure Alle_Markierungen_Kanten_Zurueck_Setzen(Kanten_Ptr : in KANTEN_REF) is
      Hilf_Kan_Ptr : KANTEN_REF := Kanten_Ptr;
   begin
      if Hilf_Kan_Ptr = null then
         Ada.Text_IO.Put_Line("        Ausgabe keine Kanten vorhanden!");
      else
         Ada.Text_IO.Put_Line("        Ausgabe aller Kanten-Markierungen eines Knotens zuruecksetzen:");
      end if;

      while Hilf_Kan_Ptr /= null loop
         -- Aktion ausgabe Knaten Info
         Markierung_Kanten_Zurueck_Setzen(Hilf_Kan_Ptr);
         -- weiterschalten zum naechsten Listenelement
         Hilf_Kan_Ptr := Hilf_Kan_Ptr.Next_Kanten_Ptr;
      end loop;
   end Alle_Markierungen_Kanten_Zurueck_Setzen;

   procedure Markierung_Knoten_Zurueck_Setzen(Knoten_Ptr : in KNOTEN_REF) is
   begin
      if Knoten_Ptr /= null then
         Knoten_Ptr.All.Markierung := 0;
      end if;
   end Markierung_Knoten_Zurueck_Setzen;

   procedure Alle_Markierungen_Zurueck_Setzen(Graph_Ptr : in KNOTEN_REF) is
      Hilf_Kno_Ptr : KNOTEN_REF := Graph_Ptr;
   begin
      Ada.Text_IO.Put_Line("Zuruecksetzen aller Knoten-Markierungen");
      -- alle Knoten besuchen
      while Hilf_Kno_Ptr /= null loop
         -- Aktion ausgabe Konten Nummer und Info
         Markierung_Knoten_Zurueck_Setzen(Hilf_Kno_Ptr);
         Alle_Markierungen_Kanten_Zurueck_Setzen(Hilf_Kno_Ptr.Kanten_Liste_Ptr);
         -- weiterschalten zum naechsten Listenelement
         Hilf_Kno_Ptr := Hilf_Kno_Ptr.Next_Knoten_Ptr;
      end loop;
   end Alle_Markierungen_Zurueck_Setzen;

   -------------------------------------------------------------------------------

   procedure Markierung_Knoten_Erhoehen(Kanten_Ptr : in KANTEN_REF) is
   begin
      if Kanten_Ptr /= null and then Kanten_Ptr.All.Ziel_Knoten_Ptr /= null then
         Kanten_Ptr.All.Ziel_Knoten_Ptr.Markierung := Kanten_Ptr.All.Ziel_Knoten_Ptr.Markierung + 1;
      end if;
   end Markierung_Knoten_Erhoehen;

   procedure Alle_Kanten_Eines_Knoten_Besuchen(Kanten_Ptr : in KANTEN_REF) is
      Hilf_Kan_Ptr : KANTEN_REF := Kanten_Ptr;
   begin

      while Hilf_Kan_Ptr /= null loop
         -- Aktion ausgabe Knaten Info
         Markierung_Knoten_Erhoehen(Hilf_Kan_Ptr);
         -- weiterschalten zum naechsten Listenelement
         Hilf_Kan_Ptr := Hilf_Kan_Ptr.Next_Kanten_Ptr;
      end loop;
   end Alle_Kanten_Eines_Knoten_Besuchen;

   procedure Ermittle_Ankommende_Kanten(Knoten_Ptr : in KNOTEN_REF) is
      Hilf_Kno_Ptr : KNOTEN_REF := Knoten_Ptr;
   begin

      Alle_Markierungen_Zurueck_Setzen(Hilf_Kno_Ptr);
      -- alle Knoten besuchen
      while Hilf_Kno_Ptr /= null loop

         Alle_Kanten_Eines_Knoten_Besuchen(Hilf_Kno_Ptr.Kanten_Liste_Ptr);
         -- weiterschalten zum naechsten Listenelement
         Hilf_Kno_Ptr := Hilf_Kno_Ptr.Next_Knoten_Ptr;
      end loop;

   end Ermittle_Ankommende_Kanten;

   function Gebe_Anzahl_Knoten_Markierungen(Knoten_Ptr : in KNOTEN_REF) return NATURAL is
      Ergebnis : NATURAL := 0;
   begin
      if Knoten_Ptr /= null then
         Ergebnis := Knoten_Ptr.All.Markierung;
      end if;
      return Ergebnis;

   end Gebe_Anzahl_Knoten_Markierungen;

   function Meisten_Ankommende_Kanten(Graph_Ptr : in KNOTEN_REF) return STRING_REF is
      Hilf_Kno_Ptr : KNOTEN_REF := Graph_Ptr;
      Ergebnis, Einzel_Erg : NATURAL:= 0;
      Info_Ptr : STRING_REF;
   begin

      -- alle Knoten besuchen
      while Hilf_Kno_Ptr /= null loop

         Einzel_Erg := Gebe_Anzahl_Knoten_Markierungen(Hilf_Kno_Ptr);

         if ( Einzel_Erg >= Ergebnis ) then
            Ergebnis := Einzel_Erg;
            Info_Ptr := Hilf_Kno_Ptr.All.Info_Ptr;
         end if;

         -- weiterschalten zum naechsten Listenelement
         Hilf_Kno_Ptr := Hilf_Kno_Ptr.Next_Knoten_Ptr;
      end loop;

      return Info_Ptr;

   end Meisten_Ankommende_Kanten;

begin

   Knoten_Einfuegen(Das_Wegenetz, new STRING'("Hamburg"), 1);
   Knoten_Einfuegen(Das_Wegenetz, new STRING'("Berlin"), 2);
   Knoten_Einfuegen(Das_Wegenetz, new STRING'("Stuttgart"), 3);
   Knoten_Einfuegen(Das_Wegenetz, new STRING'("Muenchen"), 4);

   Kanten_Einfuegen(Das_Wegenetz, 290, 1, 2);
   Kanten_Einfuegen(Das_Wegenetz, 634, 2, 3);
   Kanten_Einfuegen(Das_Wegenetz, 697, 2, 4);
   Kanten_Einfuegen(Das_Wegenetz, 650, 4, 2);

   Ausgabe_Wegenetz(Das_Wegenetz);

   Ermittle_Ankommende_Kanten(Das_Wegenetz);
   Ada.Text_IO.Put("Meist ankommende Kanten: ");
   Ada.Text_IO.Put_Line(Meisten_Ankommende_Kanten(Das_Wegenetz).All);

   Ada.Text_IO.Put_Line("Kante 2 -> 3 entfernt ");
   Kanten_Ausfuegen(Graph_Ptr           => Das_Wegenetz,
                    Start_Knoten_Nummer => 2 ,
                    End_Knoten_Nummer   => 3);

   Ausgabe_Wegenetz(Das_Wegenetz);

   Ada.Text_IO.Put_Line("Knoten 4 entfernt ");
   Knoten_Ausfuegen(Graph_Ptr => Das_Wegenetz ,
                    Nummer    => 4);

   Ausgabe_Wegenetz(Das_Wegenetz);

end Template_Graphen;

with ada.Text_IO;
with Ada.Unchecked_Deallocation;

procedure Template_Baeume is

   -- Die DS Baum (geordnet gem. Schl, binaer)
   type KNOTEN_TR;
   type KNOTEN_REF is access KNOTEN_TR;
   Pragma Controlled(KNOTEN_REF);

   type KNOTEN_TR is record
      Schl       : INTEGER;
      Info       : CHARACTER;
      Links_Ptr  : KNOTEN_REF;
      Rechts_Ptr : KNOTEN_REF;
   end record;

   package Blatt_IO is new Ada.Text_IO.Integer_IO(INTEGER);

   procedure Freigabe_Blatt is new Ada.Unchecked_Deallocation(KNOTEN_TR, KNOTEN_REF);

   -- Der Baum
   Mein_Baum_Ptr : KNOTEN_REF;
   Neuer_Baum_Ptr : KNOTEN_REF;

   Schluessel_Bereits_Vorhanden : exception;
   Schluessel_Nicht_Vorhanden   : exception;
   Leerer_Baum   		: exception;

   -- Spezifikationen
   -- Schnittstelle zum Einfuegen
   procedure Einfuegen (Wurzel_Ptr : in out KNOTEN_REF; Schl : in INTEGER; Info : in CHARACTER);
   procedure Ausgabe(Wurzel_Ptr : in KNOTEN_REF);
   procedure Ausgabe_Post_Order(Wurzel_Ptr : in KNOTEN_REF);
   procedure Ausgabe_Pre_Order(Wurzel_Ptr : in KNOTEN_REF);
   -----------------------------------------------------------
   -- Die Schluessel werden in aufsteigender Reihenfolge    --
   -- ausgegeben. Wird der Aufruf von Links_Ptr und         --
   -- Rechts_Ptr vertauscht, wird eine absteigende Reihen-  --
   -- folge erzielt.                                        --
   -----------------------------------------------------------
   procedure Ausgabe_In_Order(Wurzel_Ptr : in KNOTEN_REF);
   ----------------------------------------------------------
   -- gibt die Anzahl der Blaetter zurück  Aufgabe 9
   ----------------------------------------------------------
   function Anzahl_Blaetter ( Wurzel_Ptr : in  KNOTEN_REF ) return NATURAL;
   ----------------------------------------------------------
   -- Gibt die Tiefe des Baums zurueck   Aufgabe 10
   ----------------------------------------------------------
   function Hoehe ( Wurzel_Ptr : in  KNOTEN_REF ) return NATURAL;
   ----------------------------------------------------------
   -- Gibt die Anzahl der Elemente (Knoten) des Baumes aus
   ----------------------------------------------------------
   function Anzahl_Knoten(Wurzel_Ptr : in KNOTEN_REF ) return NATURAL;
   --------------------------------------------------------------
   -- 			Pre-Order Durchlauf
   -- Ausgabe der Knoten nach Hierarchie
   --------------------------------------------------------------
   procedure Ausgabe_Info(Wurzel_Ptr : in KNOTEN_REF; Hierarchie : NATURAL := 0);
   -----------------------------------------------------------------------------
   -- 			Post-Order Durchlauf
   -- Gesamten Baum auf Blatt-Basis loeschen
   -----------------------------------------------------------------------------
   procedure Gesamten_Baum_Loeschen(Wurzel_Ptr : in out KNOTEN_REF);
   -----------------------------------------------------------------------------
   --  				Pre-Order-Durchlauf
   -- Eine tiefe Kopie eines Baumes erstellen 1 : 1
   -----------------------------------------------------------------------------
   procedure Baum_Kopieren(Von_Wurzel_Ptr : in KNOTEN_REF; Nach_Wurzel_Ptr : in out KNOTEN_REF);
   --------------------------------------------------------------------------
   -- Kleinsten Schluessel im Baum suchen  und zurueckgeben
   --------------------------------------------------------------------------
   function KleinsterWert(Wurzel_Ptr : in KNOTEN_REF) return INTEGER;
   --------------------------------------------------------------------------
   -- Groesster Schluessel im Baum suchen  und zurueckgeben
   --------------------------------------------------------------------------
   function GroessterWert(Wurzel_Ptr : in KNOTEN_REF) return INTEGER;

   ------------------------- Bodies -----------------

   procedure Einfuegen (Wurzel_Ptr : in out KNOTEN_REF; Schl : in INTEGER; Info : in CHARACTER) is
   begin
      if Wurzel_Ptr = null then -- Einfuegestelle gefunden
         Wurzel_Ptr := new KNOTEN_TR'(Schl => Schl, Info => Info, Links_Ptr => null, Rechts_Ptr => null);
      else -- Weitersuchen

         if Schl < Wurzel_Ptr.all.Schl then -- Links weitersuchen
            Einfuegen(Wurzel_Ptr => Wurzel_Ptr.all.Links_Ptr, Schl => Schl, Info => Info);
         elsif Schl > Wurzel_Ptr.all.Schl then -- Rechts weitersuchen
            Einfuegen(Wurzel_Ptr => Wurzel_Ptr.all.Rechts_Ptr, Schl => Schl, Info => Info);
         else
            raise Schluessel_Bereits_Vorhanden;
         end if;

      end if;
   end Einfuegen;

   procedure Ausgabe(Wurzel_Ptr : in KNOTEN_REF) is
      package I_IO is new Ada.Text_IO.Integer_IO(INTEGER);
      package E_IO is new Ada.Text_IO.Enumeration_IO(CHARACTER);
   begin
       Ada.Text_IO.Put("Schluessel:  ");
      I_IO.Put(Wurzel_Ptr.All.Schl, 4);
      Ada.Text_IO.Put("  Info: ");
      E_IO.Put(Wurzel_Ptr.All.Info);
      Ada.Text_IO.New_Line;

   end Ausgabe;

   procedure Ausgabe_Post_Order(Wurzel_Ptr : in KNOTEN_REF) is
   begin

      if Wurzel_Ptr /= null then
         Ausgabe_Post_Order(Wurzel_Ptr.All.Links_Ptr);
         Ausgabe_Post_Order(Wurzel_Ptr.All.Rechts_Ptr);
         -- Aktion am Ende
         Ausgabe(Wurzel_Ptr);
      end if;
   end Ausgabe_Post_Order;

   procedure Ausgabe_Pre_Order(Wurzel_Ptr : in KNOTEN_REF) is
   begin

      if Wurzel_Ptr /= null then
         -- Aktion am Anfang
         Ausgabe(Wurzel_Ptr);

         Ausgabe_Pre_Order(Wurzel_Ptr.All.Links_Ptr);
         Ausgabe_Pre_Order(Wurzel_Ptr.All.Rechts_Ptr);
      end if;
   end Ausgabe_Pre_Order;

   procedure Ausgabe_In_Order(Wurzel_Ptr : in KNOTEN_REF) is
   begin

      if Wurzel_Ptr /= null then
         Ausgabe_In_Order(Wurzel_Ptr.All.Links_Ptr);
         -- Aktion in der Mitte
         Ausgabe(Wurzel_Ptr);

         Ausgabe_In_Order(Wurzel_Ptr.All.Rechts_Ptr);
      end if;
   end Ausgabe_In_Order;

   function Anzahl_Blaetter ( Wurzel_Ptr : in  KNOTEN_REF ) return NATURAL is
   	Ergebnis : NATURAL := 0;
   begin

      if Wurzel_Ptr /= null then

         if (Wurzel_Ptr.all.Links_Ptr = null) and (Wurzel_Ptr.All.Rechts_Ptr = null) then
            Ergebnis := 1;
         else
            Ergebnis := Anzahl_Blaetter(Wurzel_Ptr.All.Links_Ptr)
                        + Anzahl_Blaetter(Wurzel_Ptr.All.Rechts_Ptr);
         end if;

      end if;

      return Ergebnis;
   end Anzahl_Blaetter;

   function Hoehe ( Wurzel_Ptr : in  KNOTEN_REF ) return NATURAL is
      Ergebnis : NATURAL := 0;
   begin
      if Wurzel_Ptr /= null then
         if (Wurzel_Ptr.All.Links_Ptr = null) and (Wurzel_Ptr.All.Rechts_Ptr = null) then
            Ergebnis := 1;
         elsif (Wurzel_Ptr.All.Links_Ptr /= null) and (Wurzel_Ptr.All.Rechts_Ptr = null) then
            Ergebnis := 1 + Hoehe(Wurzel_Ptr.all.Links_Ptr);
         elsif (Wurzel_Ptr.All.Links_Ptr = null) and (Wurzel_Ptr.All.Rechts_Ptr /= null)  then
            Ergebnis := 1 + Hoehe(Wurzel_Ptr.All.Rechts_Ptr);
         else
            Ergebnis := 1 + NATURAL'Max(Hoehe(Wurzel_Ptr.All.Links_Ptr),
                                      Hoehe(Wurzel_Ptr.All.Rechts_Ptr));
         end if;
      end if;
      return Ergebnis;
   end Hoehe;

   function Anzahl_Knoten(Wurzel_Ptr : in KNOTEN_REF ) return NATURAL is
   	Ergebnis : NATURAL := 0;
   begin
      if  Wurzel_Ptr /= null then
	 Ergebnis := Anzahl_Knoten(Wurzel_Ptr => Wurzel_Ptr.All.Links_Ptr);
	 Ergebnis := Ergebnis + Anzahl_Knoten(Wurzel_Ptr => Wurzel_Ptr.All.Rechts_Ptr);
	 Ergebnis := Ergebnis + 1; -- eigener Knoten zaehlen
      end if;

      return Ergebnis;
   end Anzahl_Knoten;

   procedure Ausgabe_Info(Wurzel_Ptr : in KNOTEN_REF; Hierarchie : NATURAL := 0) is
   begin

      if Wurzel_Ptr /= null then
         ----------------------- Aktion ---------------------------
	   if Hierarchie /= 0 then
	       Ada.Text_IO.Put_Line((1..Hierarchie-1 => ' ') & "|");
	       Ada.Text_IO.Put((1..Hierarchie => ' ') & (1..Hierarchie => '-') & '>' & Wurzel_Ptr.All.Info);
	   else
	       Ada.Text_IO.Put(Wurzel_Ptr.All.Info);
         end if;

         -- Blatt mit Stern kennzeichnen
         if Wurzel_Ptr.All.Links_Ptr = null and Wurzel_Ptr.All.Rechts_Ptr = null then
            Ada.Text_IO.Put("*");
         end if;

         Ada.Text_IO.New_Line;
         ----------------------------------------------------------

         Ausgabe_Info(Wurzel_Ptr.All.Links_Ptr, Hierarchie + 1);
         Ausgabe_Info(Wurzel_Ptr.All.Rechts_Ptr, Hierarchie + 1);
      end if;


   end Ausgabe_Info;

   procedure Gesamten_Baum_Loeschen(Wurzel_Ptr : in out KNOTEN_REF) is
   begin

      if Wurzel_Ptr /= null then
	 Gesamten_Baum_Loeschen(Wurzel_Ptr => Wurzel_Ptr.All.Links_Ptr);
	 Gesamten_Baum_Loeschen(Wurzel_Ptr => Wurzel_Ptr.All.Rechts_Ptr);
	 --    Aktion am Ende -----------------
  	 -- Knoten (Blatt) wird geloescht
  	 --------------------------------------
	 Ausgabe(Wurzel_Ptr);
	 Freigabe_Blatt(Wurzel_Ptr);
      end if;

   end Gesamten_Baum_Loeschen;

   procedure Baum_Kopieren(Von_Wurzel_Ptr : in KNOTEN_REF; Nach_Wurzel_Ptr : in out KNOTEN_REF) is
   begin

      if Von_Wurzel_Ptr /= null then
	 -- Aktion am Anfang------------------
  	 -- Aktion neuen Knoten einfuegen
  	 -------------------------------------
	 Einfuegen(Wurzel_Ptr => Nach_Wurzel_Ptr,
	    Schl       => Von_Wurzel_Ptr.All.Schl,
	    Info       => Von_Wurzel_Ptr.All.Info);

	 Baum_Kopieren(Von_Wurzel_Ptr.All.Links_Ptr, Nach_Wurzel_Ptr);
	 Baum_Kopieren(Von_Wurzel_Ptr.All.Rechts_Ptr, Nach_Wurzel_Ptr);
      end if;


   end Baum_Kopieren;

   function KleinsterWert(Wurzel_Ptr : in KNOTEN_REF) return INTEGER is
      Erg : INTEGER := 0;
      Hilfs_Ptr : KNOTEN_REF := Wurzel_Ptr;
   begin

      if Hilfs_Ptr /= null then

         while Hilfs_Ptr.All.Links_Ptr /= null loop
            Hilfs_Ptr := Hilfs_Ptr.All.Links_Ptr;
         end loop;

         Erg := Hilfs_Ptr.All.Schl;
      else
         raise Leerer_Baum;
      end if;

      return Erg;
   end KleinsterWert;

   function GroessterWert(Wurzel_Ptr : in KNOTEN_REF) return INTEGER is
      Erg : INTEGER := 0;
   begin

      if Wurzel_Ptr /= null then

         if Wurzel_Ptr.All.Rechts_Ptr = null then
            Erg := Wurzel_Ptr.All.Schl;
         else
            erg := GroessterWert(Wurzel_Ptr.All.Rechts_Ptr);
         end if;

      else
         raise Leerer_Baum;
      end if;

      return Erg;
   end GroessterWert;

begin

   begin
      Einfuegen(Mein_Baum_Ptr, 38, 'A');
      Einfuegen(Mein_Baum_Ptr, 14, 'B');
      Einfuegen(Mein_Baum_Ptr, 23, 'C');
      Einfuegen(Mein_Baum_Ptr, 8, 'D');
      Einfuegen(Mein_Baum_Ptr, 18, 'F');
      Einfuegen(Mein_Baum_Ptr, 56, 'G');
      Einfuegen(Mein_Baum_Ptr, 45, 'H');
      Einfuegen(Mein_Baum_Ptr, 82, 'I');
      Einfuegen(Mein_Baum_Ptr, 70, 'J');
   exception
      when Schluessel_Bereits_Vorhanden =>
         Ada.Text_IO.Put_Line("Der Schluesel ist bereit vorhanden!");
   end;

   Ada.Text_IO.Put_Line("Ausgabe In Order:");
   Ausgabe_In_Order(Mein_Baum_Ptr);

   Ada.Text_IO.Put_Line("Ausgabe Pre Order:");
   Ausgabe_Pre_Order(Mein_Baum_Ptr);

   Ada.Text_IO.Put_Line("Ausgabe Post Order:");
   Ausgabe_Post_Order(Mein_Baum_Ptr);

   Ada.Text_IO.Put("Ausgabe Anzahl der Blaetter: ");
   BLATT_IO.Put(Anzahl_Blaetter(Mein_Baum_Ptr),1);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("Ausgabe Tiefe des Baums: ");
   BLATT_IO.Put(Hoehe(Mein_Baum_Ptr), 1);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put("Anzahl Knoten des Baums: ");
   BLATT_IO.Put(Anzahl_Knoten(Mein_Baum_Ptr), 1);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put_Line("Ausgabe: kleinster Schluessel von Mein_Baum ist: " & INTEGER'Image(KleinsterWert(Wurzel_Ptr => Mein_Baum_Ptr)));
   Ada.Text_IO.Put_Line("Ausgabe: groesster Schluessel von Mein_Baum ist: " & INTEGER'Image(GroessterWert(Wurzel_Ptr => Mein_Baum_Ptr)));

   Ada.Text_IO.Put_Line("Ausgabe: Mein_Baum_Ptr");
   Ausgabe_Info(Mein_Baum_Ptr);

   Ada.Text_IO.Put_Line("Baums kopieren:");
   Baum_Kopieren(Von_Wurzel_Ptr  => Mein_Baum_Ptr,
		 Nach_Wurzel_Ptr => Neuer_Baum_Ptr);

   Ada.Text_IO.Put_Line("Ausgabe: Neuer_Baum_Ptr");
   Ausgabe_Info(Neuer_Baum_Ptr);

   Ada.Text_IO.Put_Line("Löschen des gesamten Baums: Mein_Baum_Ptr");
   Gesamten_Baum_Loeschen(Mein_Baum_Ptr);

   Ada.Text_IO.Put_Line("Löschen des gesamten Baums: Neuer_Baum_Ptr");
   Gesamten_Baum_Loeschen(Neuer_Baum_Ptr);

end Template_Baeume;

package body A_13_Verwaltung is

   --------------
   -- Aufnahme --
   --------------

   procedure Aufnahme (Schl : in SCHLUESSEL_T; Info : in INFO_T) is
      Index,
      Einfuege_Index	      : Nat_T   := Speicher'First;
      Einfuegestelle_Gefunden : Boolean := False;
   begin

      if Anzahl_Elemente < Speicher'Last then
         -- Einfuegestelle suchen
         while not Einfuegestelle_Gefunden  and (Index <= Anzahl_Elemente) loop

            if  Schl <= Speicher(Index).Schluessel then
               -- Einfuegestelle merken, vorne oder in der Mitte
               Einfuege_Index := Index;
               --  Einfuegestelle gefunden (Abbruchbedingung)
               Einfuegestelle_Gefunden := True;
            end if;
            -- Index hochzaehlen
            Index := Index + 1;
         end loop;

         -- Anzahl der Element hochzaehlen, neues Element wird aufgenommen
         Anzahl_Elemente := Anzahl_Elemente + 1;

         -- groesster Schluessel in der Reihe
         -- bei leere Reihe vorne eingefuegen oder hinten angefuegen.
         if not Einfuegestelle_Gefunden then

            Speicher(Anzahl_Elemente).Schluessel := Schl;
            -- Info ist limited private! Zuweisungsoperator n i c h t  erlaubt!
            Zuweisung (Speicher(Anzahl_Elemente).Info, Info);

         else  -- in der Mitte einzufuegen

            -- Reihung nach rechts verschieben
            for I in reverse (Einfuege_Index + 1) .. Anzahl_Elemente loop

               Speicher(I).Schluessel := Speicher(I-1).Schluessel;
               -- Info ist limited private! Zuweisungsoperator n i c h t  erlaubt!
               Zuweisung (Speicher(I).Info, Speicher(I-1).Info);

            end loop;

            -- Element einfuegen
            Speicher(Einfuege_Index).Schluessel := Schl;
            -- Info ist limited private! Zuweisungsoperator n i c h t  erlaubt!
            Zuweisung (Speicher(Einfuege_Index).Info, Info);
         end if;

      end if;
   end Aufnahme;

   -------------
   -- Loesche --
   -------------

   procedure Loesche (Schl : in SCHLUESSEL_T) is
      Schluessel_Gefunden : BOOLEAN := False;
      Index,
      Loesch_Index	  : Nat_T   := Speicher'First;
      Element_Entfernt    : BOOLEAN := False;
   begin
      --
      while (Index <= Anzahl_Elemente) and (not Schluessel_Gefunden) loop

         if Schl = Speicher (Index).Schluessel then
            Schluessel_Gefunden := True;
            Loesch_Index  := Index;
         end if;
         -- Index hoechzaehlen
         Index := Index + 1;
      end loop;

      if Schluessel_Gefunden then
      	-- Reihe nach links verschieben
         for I in Loesch_Index .. Anzahl_Elemente loop
            Speicher(I).Schluessel := Speicher(I+1).Schluessel;
            -- Info ist limited private! Zuweisungsoperator n i c h t  erlaubt!
            Zuweisung (Speicher(I).Info, Speicher(I+1).Info);
         end loop;

        Anzahl_Elemente := Anzahl_Elemente - 1;
      end if;

   end Loesche;

   --------------------------------
   -- Fuer_Ausgewaehlte_Elemente --
   --------------------------------

   procedure Fuer_Ausgewaehlte_Elemente (Schl : SCHLUESSEL_T) is
   begin
      for I in Speicher'First .. Anzahl_Elemente loop
         if Schl = Speicher (I).Schluessel then
            Aktion (Speicher (I).Info);
         end if;
      end loop;
   end Fuer_Ausgewaehlte_Elemente;

end A_13_Verwaltung;

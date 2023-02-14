with Ada.Text_IO;

package body Sortier_Algorithmen is

   ----------------
   -- InsertSort --
   ----------------

   procedure InsertSort (Reihe : in out MESSREIHE_TA) is
      Einzufuegendes_Element : MESSWERTE_T := MESSWERTE_T'First;
      Einfuege_Index         : INDEX_T     := INDEX_T'FIRST;

   begin
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line("==> InsertSort ...");
      Ada.Text_IO.New_Line;

      -- vom 2. Element bis zum letzten Element der Reihe
      for Naechster_Index in INDEX_T'Succ(Reihe'First) .. Reihe'Last loop
         -- Die Reihe ist bis Naechster_Index - 1 sortiert;
         -- Naechster_Index wird als naechstes eingefuegt
         Einzufuegendes_Element := Reihe(Naechster_Index);

         -- Einfügeindex bestimmen:
         Einfuege_Index := Naechster_Index;
         while Einfuege_Index /= Reihe'First and then -- vorne einfuegen
         Reihe(INDEX_T'Pred(Einfuege_Index)) > Einzufuegendes_Element loop

            Einfuege_Index := INDEX_T'Pred(Einfuege_Index);
         end loop;

         -- die anderen Elemente nach rechts schieben
         Reihe (INDEX_T'Succ(Einfuege_Index) .. Naechster_Index) :=
           Reihe (Einfuege_Index .. INDEX_T'Pred(Naechster_Index));

         -- Element einfügen
         Reihe(Einfuege_Index) := Einzufuegendes_Element;

      end loop;
   end InsertSort;

   ----------------
   -- BubbleSort --
   ----------------

   procedure BubbleSort (Reihe : in out MESSREIHE_TA) is
      Hilfs_Element : MESSWERTE_T := MESSWERTE_T'First;
      Getauscht     : Boolean := True;
      ReihungsEnde  : INDEX_T := Reihe'Last;
   begin
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line("==> BubbleSort ...");
      Ada.Text_IO.New_Line;

      if Reihe'Length > 1 then
         -- vom letzten Element bis zum 2. Element der Reihe
         while ReihungsEnde in INDEX_T'Succ(Reihe'First) .. Reihe'Last  and Getauscht loop

            Getauscht := False;

            -- vom ersten Element bis zum vorletzten Element bezogen auf I
            -- ueberpruefende Reihe wird immer kuerzer
            for J in Reihe'First .. INDEX_T'Pred(ReihungsEnde) loop
               -- vergleicht immer aktuellen Index (J) mit dem nachfolgendem
               -- Index INDEX_T'Succ(J). Nach dem letzten Durchlauf von
               -- dieser Schleife steht hinten das groesste Element
               if Reihe(J) > Reihe(INDEX_T'Succ(J)) then
                  Getauscht := True;

                  -- Dreieckstausch
                  Hilfs_Element 	 := Reihe(J);
                  Reihe(J)      	 := Reihe(INDEX_T'Succ(J));
                  Reihe(INDEX_T'Succ(J)) :=  Hilfs_Element;
               end if;
            end loop;

            ReihungsEnde := INDEX_T'Pred(ReihungsEnde);
         end loop;
      end if;

   end BubbleSort;

   -------------------
   -- SelectionSort --
   -------------------

   procedure SelectionSort (Reihe : in out MESSREIHE_TA) is
      Hilfs_Element : MESSWERTE_T := MESSWERTE_T'First;
   begin
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line("==> SelectionSort ...");
      Ada.Text_IO.New_Line;

      if Reihe'Length > 1 then
         -- vom ersten bis zum vorletzten Element
         for Linke_Grenze in Reihe'First .. INDEX_T'Pred(Reihe'Last) loop
            -- vom naechsten Element der linken Grenze bis zum letzten Element
            for Vergleich in INDEX_T'Succ(Linke_Grenze) .. Reihe'Last loop
               -- vergleicht immer den aktuellen Index(Linke_Grenze) mit allen
               -- nachstehenden Elemente der Reihe
               if  Reihe(Linke_Grenze) > Reihe(Vergleich) then
                  -- Dreieckstausch
                  Hilfs_Element    := Reihe(Vergleich);
                  Reihe(Vergleich) := Reihe(Linke_Grenze);
                  Reihe(Linke_Grenze) := Hilfs_Element;

               end if;
            end loop;
         end loop;
      end if;

   end SelectionSort;

end Sortier_Algorithmen;

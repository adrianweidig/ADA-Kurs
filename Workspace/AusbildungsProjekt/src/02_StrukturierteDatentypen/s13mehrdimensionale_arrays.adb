with Ada.Text_IO; use Ada.Text_IO;

-- Am Beispiel eines klassischen Schachbrettes

procedure s13Mehrdimensionale_Arrays is
   
   -- Fuer die jeweiligen Feldfarben
   type FARBE_T is (S, W);
   
   type ZEILE_T is range 1..8;
   type SPALTE_T is range 1..8;
   
   -- Mehrdimensionales Array:
   -- Der erste Parameter kann man sich als Zeile,
   -- den zweiten als Spalte vorstellen. (Nur Bildlich)
   
   -- Erster Index : ZEILE_T
   -- Zweiter Index: SPALTE_T
   -- Feldinhalt   : FARBE_T
   
   -- Wobei somit 8x8 Felder zur Verfuegung stehen die 
   -- befuellt werden koennen mit dem angegebenen Typen.
   
   --   | 1 2 3 4 5 6 7 8 --> SPALTE_T
   -- __|________________
   -- 1 | S W S W S W S W
   -- 2 | W S W S W S W S
   -- 3 | S W S W S W S W
   -- 4 | W S W S W S W S
   -- 5 | S W S W S W S W --> FARBE_T
   -- 6 | W S W S W S W S
   -- 7 | S W S W S W S W
   -- 8 | W S W S W S W S
   -- ^
   -- |
   -- |_ ZEILE_T 
   
   -- Range Angaben sind wie gewohnt moeglich.
   type SCHACHBRETT_TA is array (ZEILE_T range 1..8, SPALTE_T range 1..8) of FARBE_T;
   
   -- unbeschraenkte range - Angaben sind zulaessig. Jedoch muessen diese dann bei
   -- beiden genutzten Arrays genutzt werden und entsprechend bei der Zuweisung
   -- zu einer Variable auch mit initialisiert werden.
   type SCHACHBRETT_UNB_TA is array (ZEILE_T range <>, SPALTE_T range <>) of FARBE_T;
   
   -- nicht zulaessig
   --  type SCHACHBRETT_UNB_TA is array (ZEILE_T range 1..8, SPALTE_T range <>) of FARBE_T;
   
   
   -- Initialisiert mit komplett S
   Schachbrett     : SCHACHBRETT_TA := (others => (others => S));
   
   -- Muss initialisiert werden wie bei normalen unbeschraenkten Arrays.
   -- Die Reichweiten werden wie gewohnt angegeben. 
   -- ACHTUNG:
   -- Auch die einzelnen Feldinhalte (Elemente) muessen initialisiert werden.
   -- Z.B. Ueber Aggregation wie bei normalen Arrays
   --                                                Zeile => (Spalte => Wert
   Schachbrett_Unb : SCHACHBRETT_UNB_TA (1..8, 1..8) := (1 => (1 => S,
                                                               2 => W,
                                                               3 => S,
                                                               4 => W,
                                                               5 => S,
                                                               6 => W,
                                                               7 => S,
                                                               8 => W),
                                                         -- Zeile 2: 1-4 = W, Rest = S
                                                         2 => (1..4 => W,
                                                               others     => S),
                                                         -- Weist den restlichen Zeilen und 
                                                         -- deren restlichen (also allen) Spalten 
                                                         -- den Wert S zu
                                                         others => (others => S));
                                                         
   Zaehlervariable : Integer := 0;                                 
   
begin
   
   -- Zugriff / Iteration 
   -- Laesst sowohl Auslesen als auch Bearbeiten auf die gleiche Weise zu]
   Put_Line(FARBE_T'Image(Schachbrett(1,1)));     -- Enthaelt den Wert S vom Typ FARBE_T an Stelle 1 1 
   Put_Line(FARBE_T'Image(Schachbrett_Unb(1,2))); -- Enthaelt den Wert W vom Typ FARBE_T an Stelle 1 2
   
   -- Moeglichkeit via Zaehlerschleife
   -- ACHTUNG:
   -- Iterator = Integer
   for Zeile in 1..8 loop
      for Spalte in 1..8 loop
         Put_Line("Zeile: " & Integer'Image(Zeile) & " Spalte: " & Integer'Image(Spalte) & " Wert: " & FARBE_T'Image(Schachbrett_Unb(ZEILE_T(Zeile),SPALTE_T(Spalte))));
      end loop;
   end loop;
 
   -- Moeglichkeit via For-Each Schleife ueber das gesamte Mehrdimensionale Array zu iterieren
   for Element of Schachbrett loop
      Put(FARBE_T'Image(Element));
   end loop;
   
   New_Line;
   
   -- Attribute:
   
   -- Length (Zur Veranschaulichung die Laenge anpassen)
   -- Schachbrett
   Put_Line("Reichweite von ZEILE_T: "   & Integer'Image(Schachbrett'Length));
   Put_Line("Reichweite von ZEILE_T: "   & Integer'Image(Schachbrett'Length(1)));
   Put_Line("Reichweite von SPALTE_T: "  & Integer'Image(Schachbrett'Length(2)));
   
   -- Schachbrett_Unb(eschraenkt)
   Put_Line("Reichweite von ZEILE_T: "   & Integer'Image(Schachbrett_Unb'Length));
   Put_Line("Reichweite von ZEILE_T: "   & Integer'Image(Schachbrett_Unb'Length(1)));
   Put_Line("Reichweite von SPALTE_T: "  & Integer'Image(Schachbrett_Unb'Length(2)));
   
   -- Range
   -- ACHTUNG:
   -- Iterator = Abhaengig von der Range --> ZEILE_T bzw. SPALTE_T
   for Zeile in Schachbrett_Unb'Range(1) loop
      for Spalte in Schachbrett_Unb'Range(2) loop
         Put_Line("Zeile: " & ZEILE_T'Image(Zeile) & " Spalte: " & SPALTE_T'Image(Spalte) & " Wert: " & FARBE_T'Image(Schachbrett_Unb(Zeile,Spalte)));
      end loop;
   end loop;
   
   -- First und Last gibt die Grenzen des N'ten Indexbereiches an
   Put_Line("Array: Schachbrett     - Index: Zeile  - Linke Grenze: " & ZEILE_T'Image(Schachbrett'First(1)) & " - Rechte Grenze: " & ZEILE_T'Image(Schachbrett'Last(1)));
   Put_Line("Array: Schachbrett     - Index: Spalte - Linke Grenze: " & SPALTE_T'Image(Schachbrett'First(2)) & " - Rechte Grenze: " & SPALTE_T'Image(Schachbrett'Last(2)));
   
   Put_Line("Array: Schachbrett_Unb - Index: Zeile  - Linke Grenze: " & ZEILE_T'Image(Schachbrett_Unb'First(1)) & " - Rechte Grenze: " & ZEILE_T'Image(Schachbrett_Unb'Last(1)));
   Put_Line("Array: Schachbrett_Unb - Index: Spalte - Linke Grenze: " & SPALTE_T'Image(Schachbrett_Unb'First(2)) & " - Rechte Grenze: " & SPALTE_T'Image(Schachbrett_Unb'Last(2)));
   
   
   -- Beispiel: Echtes Schachbrett initialisieren
   
   -- Schritt 1 Zaehlervariable festlegen [siehe oben]
   -- Schritt 2 Ueber das Array Iterieren
   -- Schritt 3:
   -- Wenn Zaehlervariable = 0 --> S einsetzen und Zaehlervariable +1
   -- Ansonsten W einsetzen und Zaehlervariable -1
   -- Zusaetzlich in der aeuﬂeren Schleife Zaehlervariable abhaengig
   -- vom letzten Wert um 1 erhoehen oder senken. (Damit bei z.B. 
   -- 1 | 8 (= W) bei 2 | 1 ebenfalls W rauskommt)
   
   -- Initialisierung
   
   for Zeile in Schachbrett'Range(1) loop
      for Spalte in Schachbrett'Range(2) loop
         if Zaehlervariable = 0 then
            Schachbrett(Zeile,Spalte) := S;
            Zaehlervariable := Zaehlervariable +1;
         else
            Schachbrett(Zeile,Spalte) := W;
            Zaehlervariable := Zaehlervariable -1;
         end if;
         
      end loop;
      Zaehlervariable := (if Zaehlervariable = 0 then Zaehlervariable +1 else Zaehlervariable -1);
   end loop;
   
   -- Ausgabe
   for Zeile in Schachbrett'Range(1) loop
      for Spalte in Schachbrett'Range(2) loop
         Put(FARBE_T'Image(Schachbrett(Zeile,Spalte)) &  " ");
      end loop;
      New_Line;
   end loop;
   
   
end s13Mehrdimensionale_Arrays;

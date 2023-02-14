with Ada.Text_IO; use Ada.Text_IO;

-- Inhalte:
-- Deklaration, Initialisierung, Zuweisung und Iteration von/ueber Array-TYPEN 

procedure s11ArrayTypen is
   
   -- Erzeugt einen neuen ARRAY TYP < (Reihung / TA: Type Array)
   -- Indexuntertyp	: POSITIVE (Positive Ganzzahlen)
   -- Indextyp		: Integer (1 .. 8 ist ein Integerbereich)
   -- Indexbereich	: 1 .. 8 (1 2 3 4 5 6 7 8)
   -- Komponententyp	: Boolean 

   -- Ausgesprochen:
   -- Eine Reihung / Ein Array. Mit dem Bereich positiver
   -- Ganzzahlen von 1 bis 8. Im jeweiligen Feld des Arrays
   -- koennen boolsche Werte gespeichert werden.
   
   -- Es ist egal ob Positive, Integer, Natural etc. es wird niemals
   -- der komplette Speicher anhand eines Datentyps reserviert.
   type ARRAY_TA        is array (Positive range 1 .. 8) of Boolean;
   
   -- Weiteres Beispiel:
   -- Indexuntertyp	       : TAG_T
   -- Indextyp		       : Enumeration 
   -- Indexbereich	       : Freitag bis Sonntag
   -- Komponentenuntertyp	: BOOLEAN_INT_T
   -- Komponententyp	       : Integer
   -- Komponentenbereich    : 0 bis 1 (0 oder 1)

   type BOOLEAN_INT_T   is range 0 .. 1;
   type TAG_T           is (Montag, Dienstag, Mittwoch, Donnerstag, Freitag, Samstag, Sonntag);
   type ENUM_ARRAY_TA   is array (TAG_T range Mittwoch .. Sonntag) of BOOLEAN_INT_T;
   
   -- ACHTUNG:
   -- Boolean_Array1 : ARRAY_TA (4..6);
   -- Ist falsch. Reihungen duerfen nicht zusaetzlich
   -- beschraenkt werden.
   Boolean_Array1         : ARRAY_TA;
   
   
   -- AGGREGATION 
   -- Dieses Array ist deklariert UND direkt initialisiert)
   -- Positionelle Aggregation
   --                                     1      2      3     4      5     6      7     8
   Init_Bool_Array        : ARRAY_TA := (True, False, True, False, True, False, True, False);
   
   -- Namentliche Aggregation (=> wird Tupel genannt)
   -- Dieses Array ebenfalls, wobei die entsprechenden Bereiche und deren
   -- Zuweisung definiert sind. Die Reihenfolge der Zuweisung ist dabei irrelevant.
   -- Die Zuweisung zu einem Index darf jedoch nur 1 Mal passieren.
   Init_Bool_Array2       : ARRAY_TA := (1..3 | 5 => True , 6..8 => False , 4 => False);
   --                        Elemente: [True, True, True, False, True, False, False, False]
   --                        Index:       1      2    3      4     5     6       7      8  
   
   Enum_Boolean_Int_Array1: ENUM_ARRAY_TA := (Mittwoch .. Freitag => 1, others => 0);
   --                        Elemente: [  1 ,  1  , 1  ,  0  ,  0  ]
   --                 Index Abgekuerzt:   Mi , Do  , Fr , Sa  , So  
   
   -- --> Aggregation funktioniert bei der Zuweisung wie bei der Initialisierung.
   
   -- ACHTUNG:
   -- Bei der Verwendung von others bei der ZUWEISUNG ist die Qualifikation des
   -- Aggregats notwendig (ARRAY_TA' - XX_TA(Tick)(Werte)):
   -- Beispiel_Array := ARRAY_TA'(Wert1 => 1, others => 2);
   
   -- Unbeschraenktes Array 
   -- Übernimmt die volle Range des angegebenen Komponententypes (TAG_T)
   type UNB_ARRAY_TA is array (TAG_T range <>) of BOOLEAN_INT_T;
   
   -- Initialisiert alle Werte mit 0
   -- Auf unbeschraenkte Arrays ist others nicht zulaessig
   -- Je nachdem wie die Zuweisung stattfindet so ist die Laenge
   -- des unbeschraenkten Arrays. 
   -- ACHTUNG:
   -- Wird das unbeschraenkte Array nicht initialisiert so muss
   -- auf andere Art und Weise die range beschraenkt werden.
   -- Z.B. Subtype mit range oder explizite range Angabe.
   
   -- Mgl 1 - Initialisierung
   Unb_Array : UNB_ARRAY_TA  := (Montag .. Sonntag => 0);
   --                        Elemente: [ 0   ,   0  ,  0   ,   0  ,  0   ,   0  ,   0]
   --                 Index Abgekuerzt:   Mo  ,  Di  ,  Mi  ,  Do  ,  Fr  ,  Sa  ,  So  
   
   
   -- Mgl 2 - ohne Initialisierung aber explizite range Angabe
   -- Unb_Array : UNB_ARRAY_TA (Montag .. Sonntag);
   -- Mgl 3 - subtype mit range
   -- subtype UNB_ARRAY_SUB_T is UNB_ARRAY_TA (Mittwoch .. Sonntag);
  
   -- Anonymes Array
   -- Elemente: [ 0  0  0  0  0 ]
   -- Index   :   1  2  3  4  5
   
   -- ACHTUNG:
   -- Wenn Integer nicht vorinitialisiert sind
   -- werden in Ada teilweise seltsame Werte
   -- zugeordnet.

   Anon_Array : array(1..5) of Integer := (others => 0);

   
begin
   -- Initialisierung / Zuweisung einzeln
   Boolean_Array1(1) := True;
   Boolean_Array1(2) := False;
   Boolean_Array1(3) := True;
   Boolean_Array1(4) := False;
   Boolean_Array1(5) := True;
   Boolean_Array1(6) := False;
   Boolean_Array1(7) := True;
   Boolean_Array1(8) := False;
   
   -- Sogenannte for-each Schleife (Erst ab Ada 2012):
   -- for "Variable vom Typ der Elemente des Arrays" of "Array mit Elementen" loop ...
   -- HIER:
   -- for BooleanVariable (Boolsche Variable) of Boolean_Array1 (Array mit boolschen Elementen) loop ...
   
   -- Vorteile:
   -- Die Iteration von Anfang zu Ende ist fehlerfrei, da der Iterator (Variable) 
   -- vom Typ der Elemente des Arrays ist.
   --
   -- Nachteil:
   -- Ein Einstieg in der Mitte oder fuer einen beschraenkten Bereich ist so nicht moeglich.
   -- Die Ausgabe der entsprechenden Stelle ist nicht moeglich, da nicht genutzt.
   for BooleanVariable of Boolean_Array1 loop
      Put_Line("Wert: " & Boolean'Image(BooleanVariable));
   end loop;
   
   New_Line;
   
   for Zahl of Anon_Array loop
      Put_Line(Integer'Image(Zahl));
   end loop;
   
   New_Line;
   
   for B of Init_Bool_Array loop
      Put_Line("Wert: " & Boolean'Image(B));
   end loop;
   
   New_Line;
   
   for B of Init_Bool_Array2 loop
      Put_Line("Wert: " & Boolean'Image(B));
   end loop;
   
   New_Line;
   
   -- Klassische Index-Iteration:
   -- Das selbe wie oben als Index-Iteration
   for I in Boolean_Array1'First .. Boolean_Array1'Last loop
      Put_Line("Wert " & Boolean'Image(Boolean_Array1(I)) & " ist an Stelle " & Integer'Image(I));
   end loop;
   
   New_Line;
   
   -- Ist das gleiche wie:
   for I in Boolean_Array1'Range loop
      Put_Line("Wert " & Boolean'Image(Boolean_Array1(I)) & " ist an Stelle " & Integer'Image(I));
   end loop;
   
   New_Line;
   
   -- Ist das gleiche wie:
   for I in 1 .. 8 loop
      Put_Line("Wert " & Boolean'Image(Boolean_Array1(I)) & " ist an Stelle " & Integer'Image(I));
   end loop;
   
   New_Line;
   
   -- Ausgabe des unbeschraenkten Arrays
   for Tag in Unb_Array'Range loop
      Put_Line("Wert " & BOOLEAN_INT_T'Image(Unb_Array(Tag)) & " ist an Stelle " & TAG_T'Image(Tag));
   end loop;
      

   -- Array Zusatz:
   New_Line;
   
   Put_Line("Anzahl an Stellen von Boolean_Array1: " & Integer'Image(Boolean_Array1'Length));
   
   -- Hier zum ausprobieren die range von Unb_Array anpassen
   Put_Line("Anzahl an Stellen von Unb_Array: " & Integer'Image(Unb_Array'Length));
   
end s11ArrayTypen;

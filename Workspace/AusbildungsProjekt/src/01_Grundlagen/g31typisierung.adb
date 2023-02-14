with Ada.Text_IO; use Ada.Text_IO;

procedure g31Typisierung is
   
   -- Eigene Integertypen deren Bereich vorgegeben ist
   type EIGENES_INTEGER_T is range -100 .. 100;
   
   -- Macht das gleiche wie 0 .. 31 (2 hoch 5 = 31, aber 1. Position = 0 daher 0 bis 31 --> 32 Stellen)
   type EIGENES_MOD_INTEGER_T is mod 2 ** 5; 
   
   -- Nutzung der eigenen Integertypen
   -- Sollten die eigenen Integertypen nicht im festgelegten Bereich
   -- sein wird ein Fehler zur Compilezeit ausgegeben.  (CONSTRAINT_ERROR)
   
   Integer_1      : EIGENES_INTEGER_T := 80;                                     --Wert in den Bereich und auﬂerhalb legen und zeigen zum Veranschaulichen
   Integer_2      : EIGENES_INTEGER_T := 40;
   
   -- Enumerationstypen
   type ENUM_TYP_T is (Wert1, Wert2, Wert3, Wert4, Wert5);
   
   -- Nutzung der Enumerationstypen
   EnumWert1      : ENUM_TYP_T := Wert1;
   EnumWert2      : ENUM_TYP_T := Wert2;
   
   -- Aufzaehlungstypen (Literale)
   type LITERAL_TYP_T is ('0', '1', 'A', 'B'); -- '10' ist nicht zulaessig --> 2 Zeichen entspricht keinem Literal
   Literal1       : LITERAL_TYP_T := '0'; -- Beispielhaft ein nicht definiertes Literal zeigen
   Literal2       : LITERAL_TYP_T := 'A';

   
begin
   
   -- Die Image Funktion kann auch bei eigenen Typen genutzt werden.
   Put_Line(EIGENES_INTEGER_T'Image(Integer_1));
   Put_Line(ENUM_TYP_T'Image(EnumWert1));
   Put_Line(LITERAL_TYP_T'Image(Literal1));
   
   
   -- Nutzung weiter vorimplementierter Funktionen im Bezug auf eigene Typen
   Put_Line(EIGENES_INTEGER_T'Image(EIGENES_INTEGER_T'First));                     -- Gibt -100 aus da 1. moegliche Stelle
   Put_Line(EIGENES_INTEGER_T'Image(EIGENES_INTEGER_T'Last));                      -- Gibt 100 aus da letzt moegliche Stelle
   Put_Line(EIGENES_INTEGER_T'Image(EIGENES_INTEGER_T'Max(Integer_1,Integer_2)));  -- Vergleich die beiden Typen und gibt den groeﬂeren zurueck
   Put_Line(EIGENES_INTEGER_T'Image(EIGENES_INTEGER_T'Min(Integer_1,Integer_2)));  -- Vergleich die beiden Typen und gibt den kleineren zurueck
   Put_Line(EIGENES_INTEGER_T'Image(EIGENES_INTEGER_T'Succ(50)));                  -- Gibt den Nachfolger zur Angabe 
   Put_Line(EIGENES_INTEGER_T'Image(EIGENES_INTEGER_T'Pred(80)));                  -- Gibt den Vorgaenger zur Angabe
   
   -- Vorimplementierte Funktionen fuer Enumerationstypen
   Put_Line(ENUM_TYP_T'Image(ENUM_TYP_T'First));                     -- Gibt Wert1 aus da 1. moegliche Stelle
   Put_Line(ENUM_TYP_T'Image(ENUM_TYP_T'Last));                      -- Gibt Wert5 aus da letzt moegliche Stelle
   Put_Line(ENUM_TYP_T'Image(ENUM_TYP_T'Succ(Wert3)));               -- Gibt Wert4 Nachfolger zur Angabe 
   Put_Line(ENUM_TYP_T'Image(ENUM_TYP_T'Pred(Wert3)));               -- Gibt Wert2 Vorgaenger zur Angabe
   
   -- Weitere Moeglichkeiten
   Put_Line(ENUM_TYP_T'Image(ENUM_TYP_T'Max(EnumWert1, EnumWert2))); -- Vergleich die beiden Typen und gibt den von der Position her groeﬂeren zurueck
   Put_Line(ENUM_TYP_T'Image(ENUM_TYP_T'Min(EnumWert1, EnumWert2))); -- Vergleich die beiden Typen und gibt den von der Position her kleineren zurueck
   Put_Line(ENUM_TYP_T'Image(ENUM_TYP_T'Val(3)));                    -- Gibt den Wert an Stelle 3 (0 1 2 3 <) zurueck --> Wert4
   
   Put_Line(Integer'Image(ENUM_TYP_T'Pos(Wert3)));                        -- Gibt die Position des entsprechenden Wertes als Integer zurueck (Wert3 --> hat Position 2 [0 1 2])
   
   -- Die gegebenen Moeglichkeiten sind auf Aufzaehlungstypen / Literaltypen ebenfalls anwendbar
 
   
end g31Typisierung;

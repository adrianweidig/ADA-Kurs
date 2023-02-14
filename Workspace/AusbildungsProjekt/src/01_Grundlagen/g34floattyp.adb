with Ada.Text_IO; use Ada.Text_IO;

-- Floattyp ist ein Spezialfall unter den Typen
procedure g34floattyp is
   -- digits gibt die Anzahl an Ziffern an (min. 1, max. 18)
   -- ACHTUNG:
   -- Ist die Zahl laenger als die Anzahl an Ziffern
   -- wird diese an der entsprechenden Stelle gerundet
   
   -- range nutzbar wie bei Integern vom Prinzip
   
   -- Ausprobieren: digits 9 absteigend bis 1
   type KOMMA_1_T is digits 9 range -1.0 .. 11.0;
   
   Kommazahl1 : KOMMA_1_T;
   Kommazahl2 : KOMMA_1_T;
   Kommazahl3 : KOMMA_1_T;
   
   type KOMMA_2_T is new Float range -1.0 .. 1.0;
   
   Kommazahl4 : KOMMA_2_T;
begin
   
   Kommazahl1 := 10.0454361;
   Kommazahl2 := 10.0554361;
   Kommazahl3 := 10.0654361;
   
   Kommazahl4 := 0.052;
   
   -- Nicht Typkompatibel 
   --  Kommazahl4 := Kommazahl1;
   
   -- Ausgaben
   Put_Line(KOMMA_1_T'Image(Kommazahl1));
   Put_Line(KOMMA_1_T'Image(Kommazahl2));
   Put_Line(KOMMA_1_T'Image(Kommazahl3));
   
   Put_Line(KOMMA_2_T'Image(Kommazahl4));
   
   -- Zeigt die festgelegte Anzahl Digits an
   Put_Line(Integer'Image(KOMMA_1_T'Digits));
   
   -- Float spezifische Eigenschaften
   
   -- Float zu Integer sorgt fuer das klassische Runden
   Put_Line(Integer'Image(Integer(Kommazahl1)));
   
   -- Gibt den kleinsten, groeﬂten und die Genauigkeit des Float 
   -- Wertes aus (Differenz von 1.0 und der naechstgroeﬂeren Zahl)
   Put_Line(KOMMA_1_T'Image(KOMMA_1_T'First));
   Put_Line(KOMMA_1_T'Image(KOMMA_1_T'Last));
   Put_Line(KOMMA_1_T'Image(KOMMA_1_T'Epsilon)); -- WOF‹R ?
   
   -- Vermutung:
   -- Epsilon 

   
end g34floattyp;

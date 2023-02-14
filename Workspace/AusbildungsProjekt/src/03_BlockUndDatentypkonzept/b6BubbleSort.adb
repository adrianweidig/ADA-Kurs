with Ada.Numerics.Discrete_Random, Ada.Text_IO, Ada.Real_Time;

use Ada.Text_IO;

procedure b6BubbleSort is
   ---------------------------------------------------------------------------
   -- Types --
   ---------------------------------------------------------------------------
   subtype Integer_Bereich  is Integer range 1 .. 10;
   
   -- Guter trotzdem schneller Vergleichswert ist 2000
   type Ein_Langes_Array is array (Positive range 1 .. 10) of Integer_Bereich;
   
   use type Ada.Real_Time.Time;
   
   ---------------------------------------------------------------------------
   -- Auspraegungen --
   ---------------------------------------------------------------------------
   -- Erzeugt eine Zufallszahl (Integer) im vorgelegten Bereich
   package Random_Integer is new Ada.Numerics.Discrete_Random(Result_Subtype => Integer_Bereich);
   
   ---------------------------------------------------------------------------
   -- Variablen --
   ---------------------------------------------------------------------------
   Unser_Array       : Ein_Langes_Array;
   Integer_Generator : Random_Integer.Generator;
   
   -- Moeglichkeit sich die Zeit auszugeben
   Start, Ende : Ada.Real_Time.Time;
   Vergangene_Zeit : Ada.Real_Time.Time_Span;

   ---------------------------------------------------------------------------
   -- Unterprogramme --
   ---------------------------------------------------------------------------
   procedure Array_Ausgabe (Das_Array : in Ein_Langes_Array) is
   begin 
      Put("Array: ");
      for Element of Das_Array loop
         Put(Integer_Bereich'Image(Element) & " ");
      end loop;
      
      New_Line;
   end Array_Ausgabe;
   
   procedure Init_Array (Das_Array : in out Ein_Langes_Array) is
   begin
      -- Setzt / Initialisiert den Generator
      Random_Integer.Reset(Integer_Generator);
      
      for I in Das_Array'Range loop
         -- Weisst jeder Stelle einen Zufallswert des Bereichs zu
         Das_Array(I) := Random_Integer.Random(Integer_Generator);
      end loop;
      
      -- Ausgabe des fertig initialisierten Arrays (Je nach Laenge auskommentieren)
      Put("Fertig initialisiertes ");
      Array_Ausgabe(Das_Array);
   end Init_Array;

   procedure Bubble_Sort_Iterativ(Das_Array : in out Ein_Langes_Array) is 
      
      Temp_Zahl : Integer_Bereich;

   begin
      -- Von Anfang bis Ende 
      for I in Das_Array'Range loop
         -- Vom Ersten Element des Arrays bis zum Aktuell ausgewaehlten
         -- Element (So umgeht man das Problem, wenn man einfach Stumpf
         -- bis zum Ende geht man beim Vergleich von I und theoretisch
         -- I+1 ueber die Array-Grenze hinaus geht).
         for J in Das_Array'First .. I loop
            if Das_Array(I) < Das_Array(J) then
               Temp_Zahl := Das_Array(J);
               Das_Array(J) := Das_Array(I);
               Das_Array(I) := Temp_Zahl;
            end if;
         end loop;
         
         -- Bei kleinen Bereich Testweise das Array bei jeder Aenderung ausgeben.
         Array_Ausgabe(Das_Array);
      end loop;
      
      -- Beispieldurchlauf:
      -- 3 2 1 
      -- Range waere 1-3
      -- 1. Durchlauf: 
      --- I = 1 loop 1-3
      --- J = 1 loop 1-1
      --- if Stelle 1 < Stelle 1 dann tausche (3 < 3 --> keine Aenderung)
      --- J-Loop Ende
      -- 2. Durchlauf:
      --- I = 2 loop 2-3
      --- J = 1 loop 1-2 
      --- if Stelle 2 < Stelle 1 dann tausche (2 < 3 --> Wechsel zu 2 3 1)
      --- J = 2 loop 2-2
      --- if Stelle 2 < Stelle 2 dann tausche (3 < 3 --> Keine Aenderung)
      --- J-Loop Ende
      -- 3. Durchlauf:
      --- I = 3 loop 3-3
      --- J = 1 loop 1-3
      --- if Stelle 3 < Stelle 1 dann tausche (1 < 2 --> Wechsel zu 1 3 2)
      --- J = 2 loop 2-3
      --- if Stelle 3 < Stelle 2 dann tausche (2 < 3 --> Wechsel zu 1 2 3)
      --- J = 3 loop 3-3
      --- if Stelle 3 < Stelle 3 dann tausche (3 < 3 --> Keine Aenderung)
      
      --> Von Stelle Last zu First (1. Schleife reverse) ist effizienter

   end Bubble_Sort_Iterativ; 
   
   procedure Bubble_Sort_Rekursiv(Das_Array : in out Ein_Langes_Array; Groesse_Des_Arrays : in Integer) is 
      
      Groesse   : Integer := Groesse_Des_Arrays;
      Temp_Zahl : Integer_Bereich;
      
   begin
      -- Sortierung des groeßten Elements an die letzte Stelle
      -- So muss die letzte Stelle nicht mehr weiter beruecksichtigt
      -- werden und es ist nicht moeglich ausversehen ueber die
      -- Grenzen / Constraints hinaus zu kommen.
      if Groesse /= 1 then
         for I in Das_Array'First .. Groesse-1 loop
            if Das_Array(I) > Das_Array(I+1) then
               Temp_Zahl := Das_Array(I);
               Das_Array(I) := Das_Array(I+1);
               Das_Array(I+1) := Temp_Zahl;
            end if;  
         end loop;
         
         -- Da wir das aeusserst rechte Element zuvor
         -- sortiert haben muessen wir jetzt nur noch bis zum
         -- vorletzten Element sortieren

         -- Bei kleinen Bereich Testweise das Array bei jeder Aenderung ausgeben.
         Array_Ausgabe(Das_Array);

         Groesse := Groesse - 1;
         Bubble_Sort_Rekursiv(Das_Array, Groesse);

      end if;
      
      -- Beispieldurchlauf:
      -- 3 2 1 
      -- Range waere 1-3
      -- 1. Durchlauf [3 2 1]:
      -- Groesse = 3
      --- if Groesse /= 1 --> Nein (Groesse = 3)
      --- Iteration von Anfang bis 2 und Tausch des
      --- groessten Elements an bis zu Stelle 3
      ---> I maximal 2 somit ist I+1 = 3
      --- 1. AUSGABE 
      --- Groesse - 1 = 2
      -- 2. Durchlauf [2 1 3]:
      --- if Groesse /= 1 --> Nein (Groesse = 2)
      --- Iteration von Anfang bis 1 und Tausch des
      --- groessten Elements an bis zu Stelle 2 
      ---> I maximal 1 somit ist I+1 = 2
      --- 2. AUSGABE
      --- Groesse - 1 = 1 
      -- 3. Durchlauf [1 2 3] --> Ja eigentlich schon fertig sortiert:
      --- if Groesse /= 1 --> Ja (Groesse = 1)
      --- ABBRUCH 3. Durchlauf
      --- ABBRUCH 2. Durchlauf
      --- ABBRUCH 1. Durchlauf


   end Bubble_Sort_Rekursiv;
  
begin
   Put_Line("---------------- Iterativ ----------------------");

   Init_Array(Unser_Array);
   
   -- Zum Testen der Kommentare
   --  Unser_Array(1) := 3;
   --  Unser_Array(2) := 2;
   --  Unser_Array(3) := 1;
   
   -- Nimmt die aktuelle Zeit
   Start := Ada.Real_Time.Clock;   

   Bubble_Sort_Iterativ(Unser_Array);
   
   -- Nimmt nochmals die aktuelle Zeit
   Ende := Ada.Real_Time.Clock;
   
   -- Berechnet die Vergangene Zeit
   Vergangene_Zeit := Ende - Start;

   Put_Line("Vergangene Zeit: " & Duration'Image(Ada.Real_Time.To_Duration(Vergangene_Zeit)) & " Sekunden");
   Put_Line("---------------- REKURSIV ----------------------"); 

   Init_Array(Unser_Array);
   
   -- Zum Testen der Kommentare
   --  Unser_Array(1) := 3;
   --  Unser_Array(2) := 2;
   --  Unser_Array(3) := 1;
   
   -- Nimmt die aktuelle Zeit
   Start := Ada.Real_Time.Clock;         
            
   Bubble_Sort_Rekursiv(Unser_Array, Ein_Langes_Array'Last);
            
   -- Nimmt nochmals die aktuelle Zeit
   Ende := Ada.Real_Time.Clock;

   -- Berechnet die Vergangene Zeit
   Vergangene_Zeit := Ende - Start;
   Put_Line("Vergangene Zeit: " & Duration'Image(Ada.Real_Time.To_Duration(Vergangene_Zeit)) & " Sekunden");
   
end b6BubbleSort;

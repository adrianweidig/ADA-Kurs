package body g6GenSort is

   procedure Array_Ausgabe (Das_Array : in Ein_Langes_Array) is
   begin 
      Put("Array: ");
      for Element of Das_Array loop
         Put(Generischer_Typ'Image(Element) & " ");
      end loop;
      
      New_Line;
   end Array_Ausgabe;
   
   procedure Init_Array (Das_Array : in out Ein_Langes_Array) is
   begin
      -- Setzt / Initialisiert den Generator
      Random.Reset(Generator);
      
      for I in Das_Array'Range loop
         -- Weisst jeder Stelle einen Zufallswert des Bereichs zu
         Das_Array(I) := Random.Random(Generator);
      end loop;
      
      -- Ausgabe des fertig initialisierten Arrays (Je nach Laenge auskommentieren)
      Put("Fertig initialisiertes ");
      Array_Ausgabe(Das_Array);
   end Init_Array;

   procedure Bubble_Sort_Iterativ(Das_Array : in out Ein_Langes_Array) is 
      
      Temp_Zahl : Generischer_Typ;

   begin
      for I in Das_Array'Range loop
         for J in Das_Array'First .. I loop
            if Das_Array(I) < Das_Array(J) then
               Temp_Zahl := Das_Array(J);
               Das_Array(J) := Das_Array(I);
               Das_Array(I) := Temp_Zahl;
            end if;
         end loop;
         
         Array_Ausgabe(Das_Array);
      end loop;

   end Bubble_Sort_Iterativ; 
   
   procedure Bubble_Sort_Rekursiv(Das_Array : in out Ein_Langes_Array; Groesse_Des_Arrays : in Integer) is 
      
      Groesse   : Integer := Groesse_Des_Arrays;
      Temp_Zahl : Generischer_Typ;
      
   begin
     
      if Groesse /= 1 then
         for I in Das_Array'First .. Groesse-1 loop
            if Das_Array(I) > Das_Array(I+1) then
               Temp_Zahl := Das_Array(I);
               Das_Array(I) := Das_Array(I+1);
               Das_Array(I+1) := Temp_Zahl;
            end if;  
         end loop;
         
         Array_Ausgabe(Das_Array);

         Groesse := Groesse - 1;
         Bubble_Sort_Rekursiv(Das_Array, Groesse);

      end if;

   end Bubble_Sort_Rekursiv;

end g6GenSort;

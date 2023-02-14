with Ada.Text_IO, Ada.Real_Time, g6GenSort;

use Ada.Text_IO;

procedure g6GenBubbleSortMain is
   use type Ada.Real_Time.Time;
   -- Moeglichkeit sich die Zeit auszugeben
   Start, Ende : Ada.Real_Time.Time;
   Vergangene_Zeit : Ada.Real_Time.Time_Span;
   
   ---- Mit Integern
   subtype Integer_Bereich  is Integer range 1 .. 10;
   type Ein_Langes_Array is array (Positive range <>) of Integer_Bereich;
   
   Unser_Array : Ein_Langes_Array(1..10);
   
   package Integer_Sort is new g6GenSort(Generischer_Typ  => Integer_Bereich,
                                         Ein_Langes_Array => Ein_Langes_Array);
   
   
   -- Mit Enums
   type Wochentage is (Mo, Di, Mi, Don, Fr, Sa, So);
   type Ein_Enum_Array is array (Positive range <>) of Wochentage;
   
   Enum_Array : Ein_Enum_Array(1..10);
   
   package Enum_Sort is new g6GenSort(Generischer_Typ  => Wochentage,
                                      Ein_Langes_Array => Ein_Enum_Array);

  
begin
   --------------------------------------------------------
   --------------------- MIT INTEGERN ---------------------
   --------------------------------------------------------
   
   Put_Line("---------------- Iterativ ----------------------");

   Integer_Sort.Init_Array(Unser_Array);
  
   Start := Ada.Real_Time.Clock;   

   Integer_Sort.Bubble_Sort_Iterativ(Unser_Array);

   Ende := Ada.Real_Time.Clock;

   Vergangene_Zeit := Ende - Start;

   Put_Line("Vergangene Zeit: " & Duration'Image(Ada.Real_Time.To_Duration(Vergangene_Zeit)) & " Sekunden");
   Put_Line("---------------- REKURSIV ----------------------"); 

   Integer_Sort.Init_Array(Unser_Array);

   Start := Ada.Real_Time.Clock;         
            
   Integer_Sort.Bubble_Sort_Rekursiv(Unser_Array, Unser_Array'Last);

   Ende := Ada.Real_Time.Clock;

   Vergangene_Zeit := Ende - Start;
   Put_Line("Vergangene Zeit: " & Duration'Image(Ada.Real_Time.To_Duration(Vergangene_Zeit)) & " Sekunden");
   
   --------------------------------------------------------
   --------------------- MIT ENUMS! -----------------------
   --------------------------------------------------------
   Put_Line("---------------- Iterativ ----------------------");

   Enum_Sort.Init_Array(Enum_Array);
  
   Start := Ada.Real_Time.Clock;   

   Enum_Sort.Bubble_Sort_Iterativ(Enum_Array);

   Ende := Ada.Real_Time.Clock;

   Vergangene_Zeit := Ende - Start;

   Put_Line("Vergangene Zeit: " & Duration'Image(Ada.Real_Time.To_Duration(Vergangene_Zeit)) & " Sekunden");
   Put_Line("---------------- REKURSIV ----------------------"); 

   Enum_Sort.Init_Array(Enum_Array);

   Start := Ada.Real_Time.Clock;         
            
   Enum_Sort.Bubble_Sort_Rekursiv(Enum_Array, Enum_Array'Last);

   Ende := Ada.Real_Time.Clock;

   Vergangene_Zeit := Ende - Start;
   Put_Line("Vergangene Zeit: " & Duration'Image(Ada.Real_Time.To_Duration(Vergangene_Zeit)) & " Sekunden");
   
end g6GenBubbleSortMain;

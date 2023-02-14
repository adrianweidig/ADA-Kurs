with Ada.Numerics.Discrete_Random, Ada.Text_IO, Ada.Real_Time;

use Ada.Text_IO;
generic
   type Generischer_Typ is (<>);
   type Ein_Langes_Array is array (Positive range <>) of Generischer_Typ;

package g6GenSort is

   procedure Array_Ausgabe (Das_Array : in Ein_Langes_Array);
   
   procedure Init_Array (Das_Array : in out Ein_Langes_Array);

   procedure Bubble_Sort_Iterativ(Das_Array : in out Ein_Langes_Array);
   
   procedure Bubble_Sort_Rekursiv(Das_Array : in out Ein_Langes_Array; Groesse_Des_Arrays : in Integer);
   
private
   
   package Random is new Ada.Numerics.Discrete_Random(Result_Subtype => Generischer_Typ);

   Generator         : Random.Generator;

end g6GenSort;

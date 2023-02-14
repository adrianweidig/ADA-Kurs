with Ada.Text_IO;

use Ada.Text_IO;

procedure T010ProtectedTypen is
protected type Protected_Integer_Type is
      procedure Set (V : Integer);
      function Get return Integer;
   private
      Zahl : Integer := 0;
   end Protected_Integer_Type;

   protected body Protected_Integer_Type is
      procedure Set (V : Integer) is
      begin
         Zahl := V;
      end Set;

      function Get return Integer is
      begin
         return Zahl;
      end Get;
   end Protected_Integer_Type;

   PInteger1 : Protected_Integer_Type;
   PInteger2 : Protected_Integer_Type;
   PInteger3 : Protected_Integer_Type;
   PInteger4 : Protected_Integer_Type;
   
begin
   PInteger1.Set (1);
   PInteger2.Set (2);
   PInteger3.Set (3);
   PInteger4.Set (4);
   
   Put_Line ("Zahl von PInteger1: " & Integer'Image (PInteger1.Get));
   Put_Line ("Zahl von PInteger2: " & Integer'Image (PInteger2.Get));
   Put_Line ("Zahl von PInteger3: " & Integer'Image (PInteger3.Get));
   Put_Line ("Zahl von PInteger4: " & Integer'Image (PInteger4.Get));
   
   -- Wenn man ausprobieren moechte:
   -- Benutze die protected Objects wie eine Klasse
   -- und versuche alles (ausser Vererbung etc.) zu
   -- replizieren.
   
end T010ProtectedTypen;

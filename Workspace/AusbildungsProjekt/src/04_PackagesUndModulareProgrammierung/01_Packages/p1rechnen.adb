with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure p1Rechnen is
   -- Funktionen
   function "+" (A, B : in Integer) return String is 
   begin
      return Integer'Image(A) & " ," & Integer'Image(B);
   end "+";

   -- Variablen
   A : Integer;
   B : Integer;
 
begin
  
   -- Eingabe
   Put("A : ");
   Get(A);
      
   Put("B : ");
   Get(B);
   
   -- Ausgabe
   Put_Line(p1Rechnen."+"(A,B));
   Put_Line(A + B);
   
end p1Rechnen;

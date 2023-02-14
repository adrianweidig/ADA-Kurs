
package body p7UseType is

   function "+" (A, B : in EineZahl) return String is 
   begin
      return EineZahl'Image(A) & " ," & EineZahl'Image(B);
   end "+";
   
   procedure setEineZahl (Eingabe : in Integer; Zahl : in out EineZahl) is
   begin
      Zahl := EineZahl(Eingabe);
   end setEineZahl;
   

end p7UseType;


package p7UseType is

   type EineZahl is private;
   
   function "+" (A, B : in EineZahl) return String;
   
   procedure setEineZahl (Eingabe : in Integer; Zahl : in out EineZahl);
   
private
   
   type EineZahl is new Integer;
   
end p7UseType;

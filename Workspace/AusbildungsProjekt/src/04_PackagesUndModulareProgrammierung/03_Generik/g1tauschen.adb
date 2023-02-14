with Ada.Text_IO;
package body g1tauschen is

   -- MAN BEACHTE:
   -- Die Verwendung von Generic ist kein weiteres Mal notwendig
   procedure Tauschen(A, B : in out Generischer_Typ)  is 
      Temp : Generischer_Typ;
   begin
      Temp := A;
      
      A := B;
      
      B := Temp;
   end Tauschen;
   
   -- Durch die Verwendung von (<>) geht man von einem diskreten Typen aus
   -- hierauf sind entsprechende Prozeduren / Funktionen, wie unter anderem
   -- die klassische 'Image() Funktion welche einen String zurueckgibt.
   procedure Gen_Ausgabe(A : in Gen_Disk_Type) is
   begin
      
      Ada.Text_IO.Put_Line("Generische Gen_Ausgabe Prozedur: " & Gen_Disk_Type'Image(A));
      Ada.Text_IO.Put_Line("---------------------------------------------------------------");
      
   end Gen_Ausgabe;
   
   procedure Float_Ausgabe(A : Gen_Float_Type) is
   begin
   
      Ada.Text_IO.Put_Line("Kleinste Floatstelle: " & Gen_Float_Type'Image(Gen_Float_Type'First));
      Ada.Text_IO.Put_Line("Groesste Floatstelle: " & Gen_Float_Type'Image(Gen_Float_Type'Last));
      Ada.Text_IO.Put_Line("---------------------------------------------------------------");
   end Float_Ausgabe;

   
   
   

end g1tauschen;

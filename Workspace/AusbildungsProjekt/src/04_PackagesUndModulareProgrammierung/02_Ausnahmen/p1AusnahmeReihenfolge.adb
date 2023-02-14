with Ada.Text_IO;

use Ada.Text_IO;

-- Um die Hierarchie besser zu verstehen alle Exceptions
-- drin lassen und nacheinander auskommentieren.
procedure p1AusnahmeReihenfolge is
   
   Zahl : Integer := 1;
   
   --------- Package Aussen --------------------
   
   package Aussen is 
      ---- Deklaration Ausgabe ----
      procedure Text_Aussen;
      
      --------- Package Body Innen ------------
      package Innen is 
         
         procedure Text_Innen;
         
      end Innen;
       
   end Aussen;
   
   --------- Package Body Aussen -----------------
     
   package body Aussen is
      
      -- Definition von Ausgabe ---
      procedure Text_Aussen is 
      begin
         
         Put_Line("Package Aussen Bereich");
         Zahl := Zahl / 0;
      exception
         when Constraint_Error => Put_Line("     Error - Aussen");
      end Text_Aussen;
      
      --------- Package Body Innen ------------
      package Body_Innen is 
         
         procedure Text_Body_Innen;
         
      end Body_Innen;
      
      --------- Package Body Innen -------
      package body Body_Innen is 
         
         procedure Text_Body_Innen is 
         begin
            Put_Line("Package Body - Text_Body_Innen");  
            Zahl := Zahl / 0;
         exception
            when Constraint_Error => Put_Line("     Error - Text_Body_Innen");
         end Text_Body_Innen;
             
      end Body_Innen;
      
      --------- Package Innen -------
      package body Innen is 
         
         procedure Text_Innen is 
         begin
            Put_Line("Package Body - Text_Innen");
            Zahl := Zahl / 0;
         exception
            when Constraint_Error => Put_Line("     Error - Text_Innen");
               Body_Innen.Text_Body_Innen;
         end Text_Innen;
             
      end Innen;
      
   end Aussen;
 
   
begin
   Put_Line("Procedure Bereich");
   Aussen.Text_Aussen;
   Aussen.Innen.Text_Innen;
   
end p1AusnahmeReihenfolge;

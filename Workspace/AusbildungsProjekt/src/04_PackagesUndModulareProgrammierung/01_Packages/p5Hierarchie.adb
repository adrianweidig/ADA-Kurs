with Ada.Text_IO;

use Ada.Text_IO;

procedure P5Hierarchie is
   
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
         end Text_Body_Innen;
             
      end Body_Innen;
      
      --------- Package Innen -------
      package body Innen is 
         
         procedure Text_Innen is 
         begin
            Put_Line("Package Body - Text_Innen");   
            Body_Innen.Text_Body_Innen;
         end Text_Innen;
             
      end Innen;
      
   end Aussen;
 
   
begin
   -- Bereich der Procedure selbst
   Put_Line("Procedure Bereich");
   
   -- Das Paket aussen ist hier nutzbar (auch ohne with),
   -- da es innerhalb unserer Procedure definiert ist.
   Aussen.Text_Aussen;
   
   -- Auf das Package innerhalb des Package "Aussen" ist von
   -- aussen zugreifbar wie auf ein Childpackage
   Aussen.Innen.Text_Innen;
   

   
   -- Voraussetzung fuer die Sichtbarkeit des inneren Packages ist, dass
   -- im Package die Deklaration ist und im dazugehoerigen Body
-- die entsprechende Initialisierung stattfindet.
   
end P5Hierarchie;

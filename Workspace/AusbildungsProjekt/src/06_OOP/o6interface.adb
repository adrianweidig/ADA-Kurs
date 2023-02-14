with Ada.Text_IO;

use Ada.Text_IO;

package body O6Interface is

   procedure Laufen (this : Pferd) is
   begin
      Put_Line("Ich laufe.");
   end Laufen;
   
   overriding procedure Fliegen (this : Pegasus) is
   begin
      Put_Line("Ich fliege.");
   end Fliegen;

end O6Interface;

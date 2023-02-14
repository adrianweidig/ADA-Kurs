with Ada.Text_IO;

use Ada.Text_IO;
package body O5AbstrakteKlassen is

   -------------
   -- Bewegen --
   -------------

   overriding procedure Bewegen (this : Auto) is
   begin
      Put_Line("Ich bewege mich auf einer Strasse");
   end Bewegen;

   -------------
   -- Bewegen --
   -------------

   overriding procedure Bewegen (this : Boot) is
   begin
      Put_Line("Ich bewege mich auf dem Wasser");
   end Bewegen;

end O5AbstrakteKlassen;

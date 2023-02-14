with Ada.Text_IO;
package body P6LimitedPackage is

   ---------------
   -- Reinlegen --
   ---------------

   procedure Reinlegen (EinStack : out Stack; Inhalt : in Stack) is
   begin
      EinStack := Inhalt;
   end Reinlegen;

   --------------
   -- Auslesen --
   --------------

   procedure Auslesen (EinStack : in Stack) is
   begin
     Ada.Text_IO.Put_Line(Integer'Image(EinStack.Inhalt));
   end Auslesen;


end P6LimitedPackage;

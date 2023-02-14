with Ada.Text_IO; use Ada.Text_IO;
-- Automatische Generierung der Body Datei
-- DESWEGEN ABSICHTLICH OHNE WEITERE IMPLEMENTIERUNGEN

-- Pragma zeigt HIER an welche Version genutzt wird
-- Die Inhalte der Funktionen / Prozeduren wird automatisch
-- mit einer Warnnachricht befuellt, die ausgegeben wird,
-- wenn man diese ohne Inhalt aufruft.

--pragma Ada_2012;
package body p3schrank is

   -----------------
   -- Hinzufuegen --
   -----------------

   procedure Hinzufuegen (Anzahl : in Integer) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Hinzufuegen unimplemented");
      raise Program_Error with "Unimplemented procedure Hinzufuegen";
   end Hinzufuegen;

   ------------------
   -- Herausnehmen --
   ------------------

   function Herausnehmen (Anzahl : in Integer) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Herausnehmen unimplemented");
      return raise Program_Error with "Unimplemented function Herausnehmen";
   end Herausnehmen;

   -- private ist im Body Bereich NICHT erlaubt
   -- private



end p3schrank;

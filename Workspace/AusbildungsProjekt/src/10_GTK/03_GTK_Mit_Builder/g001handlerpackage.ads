with Gtkada.Builder; use Gtkada.Builder;
with Gtk.Main;
with Ada.Text_IO; use Ada.Text_IO;

package G001HandlerPackage is

   -- Handler Procedure:
   -- Diese wird benoetigt um eine entsprechende Anweisung durchfuehren zu
   -- koennen, wenn Quit aufgerufen wird. (Bei uns in diesem Fall, wenn z.B.
   -- das Fenster geschlossen wird)
   procedure Quit(Object : access Gtkada_Builder_Record'Class);

end G001HandlerPackage;

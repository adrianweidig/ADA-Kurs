with Gtk.Menu_Item;  use Gtk.Menu_Item;

package WidgetHandler is

   -- Zur Pruefung ob das Spiel bereits gestartet wurde
   Gestartet : Boolean := False;

   procedure New_Game (Self : access Gtk_Menu_Item_Record'Class);

   procedure End_Game(Self : access Gtk_Menu_Item_Record'Class);

end WidgetHandler;

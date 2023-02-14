-- Gtk Packages
with Gtk.Window;    use Gtk.Window;
with Gtk.Box;       use Gtk.Box;
with Gtk.Menu;      use Gtk.Menu;
with Gtk.Menu_Bar;  use Gtk.Menu_Bar;
with Gtk.Menu_Item; use Gtk.Menu_Item;
with Gtk.Frame;     use Gtk.Frame;
with Gtk.Status_Bar;use Gtk.Status_Bar;
with Schachfelder;  use Schachfelder;

package GladeObjects is

   -- Das Hauptfenster, Box fuer Menue und Schachbrett
   Fenster         : Gtk_Window;
   Mainbox         : Gtk_Vbox;
   MenuBar         : Gtk_Menu_Bar;
   
   -- Untermenue Spiel
   Menu_Game       : Gtk_Menu_Item;
   Menu_Game_Sub   : Gtk_Menu;
   MGS_NewGame     : Gtk_Menu_Item;
   MGS_Load        : Gtk_Menu_Item;
   MGS_Save        : Gtk_Menu_Item;
   MGS_SaveAs      : Gtk_Menu_Item;
   MGS_End         : Gtk_Menu_Item;
   
   -- Untermenue Hilfe
   Menu_Help       : Gtk_Menu_Item;
   Menu_Help_Sub   : Gtk_Menu;
   MHS_Manual      : Gtk_Menu_Item;
   
   -- Das Schachbrett selbst
   Brett           : Gtk_Frame;
   Status_Bar      : Gtk_Status_Bar;
   
   -- Das Schachbrett --> Das komplette Feld auf dem Brett
   Das_Schachbrett : Schachbrett;

end GladeObjects;

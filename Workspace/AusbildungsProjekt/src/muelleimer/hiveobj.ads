with Gtk.Window;				use Gtk.Window;
with Gtk.Box;					use Gtk.Box;
with Gtk.Menu_Item;			use Gtk.Menu_Item;
with Gtk.Frame;				use Gtk.Frame;
with Gtk.Label;				use Gtk.Label;
with Gtk.Status_Bar;			use Gtk.Status_Bar;


package HiveObj is

   -- Das Fenster selbst
   Fenster						: Gtk_Window;
   
   -- Die einzelnen Menuepunkte
   Neues_Spiel				: Gtk_Menu_Item;
   Beenden						: Gtk_Menu_Item;
   Anleitung					: Gtk_Menu_Item;
   
   -- Vorratsdinger
   Frame_Weisser_Schwarm	: Gtk_Frame;
   Frame_Schwarzer_Schwarm	: Gtk_Frame;
   
   -- Hive-Feld
   Box_Spielbrett				: Gtk_Vbox;
   
   -- Status-Anzeige
   Status_Spieler				: Gtk_Status_Bar;
   Status_Zug					: Gtk_Status_Bar;
   
   -- Frame Label (Ueberschriften)
   Lbl_Weisser_Schwarm		: Gtk_Label;
   Lbl_Schwarzer_Schwarm	: Gtk_Label;
   Lbl_Hive					: Gtk_Label;
   

end HiveObj;

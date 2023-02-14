-- Gtk Packages
with Gtk.Window;    use Gtk.Window;
with Gtk.Box;       use Gtk.Box;
with Gtk.Menu;      use Gtk.Menu;
with Gtk.Menu_Bar;  use Gtk.Menu_Bar;
with Gtk.Menu_Item; use Gtk.Menu_Item;
with Gtk.Button;    use Gtk.Button;
with Gtk.Frame;     use Gtk.Frame;
with Gtk.Status_Bar;use Gtk.Status_Bar;

-- Eigene Packages
with GladeObjects;            use GladeObjects;
with WidgetHandler;           use WidgetHandler;

package body Init_Widgets is

   procedure InitGladeWidgetHandlers is
   begin
      MGS_NewGame.On_Activate(New_Game'Access);
      
      MGS_End.On_Activate(End_Game'Access);
   end InitGladeWidgetHandlers;
     
   procedure InitGladeWidgets(Der_Builder : Gtkada_Builder) is
   begin
      -- Das Hauptfenster, Box fuer Menue und Schachbrett
      Fenster       := Gtk_Window(Get_Object(Builder => Der_Builder,
                                             Name    => "Fenster"));
      Mainbox       := Gtk_Vbox(Get_Object(Builder => Der_Builder,
                                           Name    => "Mainbox"));
      MenuBar       := Gtk_Menu_Bar(Get_Object(Builder => Der_Builder,
                                               Name    => "MenuBar"));
        
      --  -- Untermenue Spiel
      Menu_Game     := Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                Name    => "Menu_Game"));
      Menu_Game_Sub := Gtk_Menu(Get_Object(Builder => Der_Builder,
                                           Name    => "Menu_Game_Sub"));
      MGS_NewGame   := Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                Name    => "MGS_NewGame"));
      MGS_Load      := Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                Name    => "MGS_Load"));
      MGS_Save      := Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                Name    => "MGS_Save"));
      MGS_SaveAs    := Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                Name    => "MGS_SaveAs"));
      
      MGS_End       := Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                Name    => "MGS_End"));
        
      
      -- Untermenue Hilfe
      Menu_Help     := Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                Name    => "Menu_Help"));
      Menu_Help_Sub := Gtk_Menu(Get_Object(Builder => Der_Builder,
                                           Name    => "Menu_Help_Sub"));
      MHS_Manual    := Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                Name    => "MHS_Manual"));
   
      -- Das Schachbrett selbst
      Brett         := Gtk_Frame(Get_Object(Builder => Der_Builder,
                                            Name    => "Schachbrett"));
      
      -- Statusbar
      Status_Bar    := Gtk_Status_Bar(Get_Object(Builder => Der_Builder,
                                                 Name    => "Statusbar"));
      
      
      -- BEACHTE:
      -- Die Size_Request muss erfolgen, falls keine explizite Hoehen
      -- und Breitenanforderung vorhanden ist
      -- Brett.Set_Size_Request(Width  => 860,
      --                       Height => 860);
      
      -- Weisst anschliessend allen Widgets ihre entsprechenden
      -- Handler zu.
      InitGladeWidgetHandlers;

   end InitGladeWidgets;
 
end Init_Widgets;

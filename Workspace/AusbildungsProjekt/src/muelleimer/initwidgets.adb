with Gtk.Window;				use Gtk.Window;
with Gtk.Box;					use Gtk.Box;
with Gtk.Menu_Item;			use Gtk.Menu_Item;
with Gtk.Frame;				use Gtk.Frame;
with Gtk.Label;				use Gtk.Label;
with Gtk.Status_Bar;			use Gtk.Status_Bar;

-- Eigene Packages
with HiveObj; use HiveObj;

package body initWidgets is

   procedure init(Der_Builder : Gtkada_Builder) is
      
   begin
      
      Fenster 						:= Gtk_Window(Get_Object(Builder => Der_Builder,
                                            		Name    => "Fenster"));
      
      Neues_Spiel 					:= Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                   Name    => "Neues_Spiel"));
      Beenden 						:= Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                               		Name    => "Beenden"));
      
      Anleitung 						:= Gtk_Menu_Item(Get_Object(Builder => Der_Builder,
                                                   Name    => "Anleitung"));
      
      Frame_Weisser_Schwarm 		:= Gtk_Frame(Get_Object(Builder => Der_Builder,
                                               Name    => "Frame_Weisser_Schwarm"));
      
      Frame_Schwarzer_Schwarm 		:= Gtk_Frame(Get_Object(Builder => Der_Builder,
                                                        Name    => "Frame_Schwarzer_Schwarm"));
      Box_Spielbrett 				:= Gtk_Vbox(Get_Object(Builder => Der_Builder,
                                              Name    => "Box_Spielbrett"));
      
      Status_Spieler 				:= Gtk_Status_Bar(Get_Object(Builder => Der_Builder,
                                                    Name    => "Status_Spieler"));
      
      Status_Zug						:= Gtk_Status_Bar(Get_Object(Builder => Der_Builder,
                                                    Name    => "Status_Zug"));
      
      Lbl_Weisser_Schwarm			:= Gtk_Label(Get_Object(Builder => Der_Builder,
                                               Name    => "Lbl_Weisser_Schwarm"));
      
      Lbl_Schwarzer_Schwarm 		:= Gtk_Label(Get_Object(Builder => Der_Builder,
                                               Name    => "Lbl_Schwarzer_Schwarm"));
      
      Lbl_Hive 						:= Gtk_Label(Get_Object(Builder => Der_Builder,
                                               Name    => "Lbl_Hive"));
      
      Fenster.Maximize;

   end init;

end initWidgets;

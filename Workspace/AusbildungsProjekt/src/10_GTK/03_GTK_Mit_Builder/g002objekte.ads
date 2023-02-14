-- Man muss fuer alle Widgets deren zugehoeriges Paket einbinden

-- GTK Packages
with Gtk.Button;              use Gtk.Button;
with Gtk.Switch;              use Gtk.Switch;
with Gtk.Check_Button;        use Gtk.Check_Button;
with Gtk.File_Chooser_Button; use Gtk.File_Chooser_Button;
with Gtk.Color_Button;        use Gtk.Color_Button;
with Gtk.Toggle_Button;       use Gtk.Toggle_Button;
with Gtk.Label;               use Gtk.Label;

with Gtk.Main;                use Gtk.Main;

-- Zur Ausgabe von Enum_Typen
with Gdk.RGBA;                use Gdk.RGBA;

-- GTK Ada Packages
with Gtkada.Builder;          use Gtkada.Builder;

-- Ada Packages
with Ada.Text_IO;             use Ada.Text_IO;

package G002Objekte is
   ---------------------------------------
   ---------------- Widgets --------------
   ---------------------------------------
   
   -- Get_Object sucht im jeweiligen Builder
   -- nach dem Object mit dem angegebenen Namen
   button1            : Gtk_Button;              
   
   switch1            : Gtk_Switch;              
   
   checkbutton1       : Gtk_Check_Button;       
   
   filechooserbutton1 : Gtk_File_Chooser_Button; 
   
   colorbutton1       : Gtk_Color_Button;       
   
   togglebutton1      : Gtk_Toggle_Button;       
   
   label1             : Gtk_Label;             
  
   label2             : Gtk_Label;              
   
   label3             : Gtk_Label;               
   
   label4             : Gtk_Label;              
   
   label5             : Gtk_Label;               
   
   label6             : Gtk_Label;               
   
   procedure InitAllWidgets(Der_Builder : Gtkada_Builder);
   
   ---------------------------------------
   -------- Handler-Bearbeitung ----------
   ---------------------------------------
   
   -- Um die richtigen Handlerprozeduren zu finden bietet es sich
   -- an diese zuerst ueber Zugriff auf das Objekt und denn Aufruf
   -- des gewollten Events (z.B. button1.On_Clicked) dieses dann
   -- in der .ads nachzuschlagen und die Parameterliste entsprechend
   -- zu uebernehmen.
   
   procedure InitAllFknHandlers (Der_Builder : Gtkada_Builder);
   
   -- Fenster-Schliess Prozedur
   procedure Quit (Object : access Gtkada_Builder_Record'Class);
   
   procedure button1_clicked_cb (Object : access Gtkada_Builder_Record'Class);
   
   function switch1_state_set_cb (Object : access Gtkada_Builder_Record'Class) return Boolean;
   
   procedure checkbutton1_toggled_cb (Object : access Gtkada_Builder_Record'Class);
   
   procedure filechooserbutton1_file_set_cb (Object : access Gtkada_Builder_Record'Class);
   
   procedure colorbutton1_color_set_cb (Object : access Gtkada_Builder_Record'Class);
   
   procedure togglebutton1_toggled_cb (Object : access Gtkada_Builder_Record'Class);
   
   ---------------------------------
   -------- Nutzvariablen ----------
   ---------------------------------
   
   button1_label1_Zahl : Integer := 0;

end G002Objekte;

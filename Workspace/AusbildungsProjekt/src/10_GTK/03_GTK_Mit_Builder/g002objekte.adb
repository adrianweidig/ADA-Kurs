package body G002Objekte is

   procedure InitAllWidgets(Der_Builder : Gtkada_Builder) is
   begin
      -- Get_Object sucht im jeweiligen Builder
      -- nach dem Object mit dem angegebenen Namen
      button1            := Gtk_Button(Get_Object(Builder => Der_Builder,
                                                  Name    => "button1"));
   
      switch1            := Gtk_Switch(Get_Object(Builder => Der_Builder,
                                                  Name    => "switch1"));
   
      checkbutton1       := Gtk_Check_Button(Get_Object(Builder => Der_Builder,
                                                        Name    => "checkbutton1"));
   
      filechooserbutton1 := Gtk_File_Chooser_Button(Get_Object(Builder => Der_Builder,
                                                               Name    => "filechooserbutton1"));
   
      colorbutton1       := Gtk_Color_Button(Get_Object(Builder => Der_Builder,
                                                        Name    => "colorbutton1"));
   
      togglebutton1      := Gtk_Toggle_Button(Get_Object(Builder => Der_Builder,
                                                         Name    => "togglebutton1"));
   
      label1             := Gtk_Label(Get_Object(Builder => Der_Builder,
                                                 Name    => "label1"));
   
      label2             := Gtk_Label(Get_Object(Builder => Der_Builder,
                                                 Name    => "label2"));
   
      label3             := Gtk_Label(Get_Object(Builder => Der_Builder,
                                                 Name    => "label3"));
   
      label4             := Gtk_Label(Get_Object(Builder => Der_Builder,
                                                 Name    => "label4"));
   
      label5             := Gtk_Label(Get_Object(Builder => Der_Builder,
                                                 Name    => "label5"));
   
      label6             := Gtk_Label(Get_Object(Builder => Der_Builder,
                                                 Name    => "label6"));
   end InitAllWidgets;
   
   procedure Quit(Object : access Gtkada_Builder_Record'Class) is 
      pragma Unreferenced(Object);
   begin
      Put_Line("Anwendung wird beendet.");
      Gtk.Main.Main_Quit;
   end Quit;
   
   procedure button1_clicked_cb (Object : access Gtkada_Builder_Record'Class) is 
      
   begin
      
      button1_label1_Zahl := button1_label1_Zahl + 1;
      
      button1.Set_Label(Label => Integer'Image(button1_label1_Zahl));
      
      label1.Set_Label(Str => Integer'Image(button1_label1_Zahl));

   end button1_clicked_cb;
   
   function switch1_state_set_cb (Object : access Gtkada_Builder_Record'Class) return Boolean is 
      
   begin
      
      label2.Set_Label(Str => Boolean'Image(switch1.Get_Active));
      return switch1.Get_Active;
   end switch1_state_set_cb;

   procedure checkbutton1_toggled_cb (Object : access Gtkada_Builder_Record'Class) is 
      
   begin
      label3.Set_Label(Str => Boolean'Image(checkbutton1.Get_Active));
   end checkbutton1_toggled_cb;
   
   procedure filechooserbutton1_file_set_cb (Object : access Gtkada_Builder_Record'Class) is 
      
   begin
      label4.Set_Label(Str => filechooserbutton1.Get_Filename);
   end filechooserbutton1_file_set_cb;
   
   procedure colorbutton1_color_set_cb (Object : access Gtkada_Builder_Record'Class) is 
      Farbe : Gdk_RGBA;
   begin
      
      colorbutton1.Get_Rgba(Farbe);
      
      label5.Set_Label(Str => Gdk.RGBA.To_String(Farbe));
      
   end colorbutton1_color_set_cb;
   
   procedure togglebutton1_toggled_cb (Object : access Gtkada_Builder_Record'Class) is 
      
   begin
      label6.Set_Label(Str => Boolean'Image(togglebutton1.Get_Active));
   end togglebutton1_toggled_cb;
   
   procedure InitAllFknHandlers (Der_Builder : Gtkada_Builder) is   

   begin
      -- Fenster schliessen
      Register_Handler(Builder => Der_Builder, 
                       Handler_Name => "gtk_main_quit", 
                       Handler => Quit'Access);
      
      Register_Handler(Builder => Der_Builder, 
                       Handler_Name => "button1_clicked_cb", 
                       Handler => button1_clicked_cb'Access);
            
      Register_Handler(Builder => Der_Builder, 
                       Handler_Name => "switch1_state_set_cb", 
                       Handler => switch1_state_set_cb'Access);
                  
      Register_Handler(Builder => Der_Builder, 
                       Handler_Name => "checkbutton1_toggled_cb", 
                       Handler => checkbutton1_toggled_cb'Access);
                          
      Register_Handler(Builder => Der_Builder, 
                       Handler_Name => "filechooserbutton1_file_set_cb", 
                       Handler => filechooserbutton1_file_set_cb'Access);
                                  
      Register_Handler(Builder => Der_Builder, 
                       Handler_Name => "colorbutton1_color_set_cb", 
                       Handler => colorbutton1_color_set_cb'Access);
                                        
      Register_Handler(Builder => Der_Builder, 
                       Handler_Name => "togglebutton1_toggled_cb", 
                       Handler => togglebutton1_toggled_cb'Access);
      
   end InitAllFknHandlers;

end G002Objekte;

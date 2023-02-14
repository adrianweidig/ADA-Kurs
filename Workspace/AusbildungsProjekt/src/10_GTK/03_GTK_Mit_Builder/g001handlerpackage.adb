package body G001HandlerPackage is

   procedure Quit(Object : access Gtkada_Builder_Record'Class) is 
      pragma Unreferenced(Object);
   begin
      Put_Line("Anwendung wird beendet.");
      Gtk.Main.Main_Quit;
   end Quit;

end G001HandlerPackage;


with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Window;      use Gtk.Window;

with Gtk.Main;

procedure G000LeeresFensterUnkommentiert is
   Fenster : Gtk_Window;
   Box     : Gtk_Vbox;

   -- Handler Funktion um das Programm beim
   -- Schliessen des Fensters zu quitieren.
   function Fenster_Schliessen (this : access Gtk_Widget_Record'Class; Event: Gdk.Event.Gdk_Event) return Boolean is
      pragma Unreferenced(this, Event);
   begin
      Gtk.Main.Main_Quit;
      return True;
   end Fenster_Schliessen;

begin
   Gtk.Main.Init;
   
   -- Fenster
   Gtk_New (Fenster);
   Fenster.Set_Default_Size(1000, 1000);
   
   -- Box
   Gtk_New_Vbox(Box);
   Fenster.Add(Box);
   

   
   -- Handler
   Fenster.On_Delete_Event(Fenster_Schliessen'Unrestricted_Access);

   
   
   
   -- Show
   Fenster.Show_All;
   Fenster.Present;

   Gtk.Main.Main;
   
end G000LeeresFensterUnkommentiert;

with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;


with Ada.Text_IO;     use Ada.Text_IO;
procedure test is

   Fenster : Gtk_Window;
   Label   : Gtk_Label;
   Box     : Gtk_Vbox;

   function Fenster_Schliessen
     (this : access Gtk_Widget_Record'Class;
      Event: Gdk.Event.Gdk_Event) return Boolean 
   is 
      pragma Unreferenced(this, Event);
   begin
      
      Put_Line("PROGRAMM WIRD GLEICH BEENDET");

      Gtk.Main.Main_Quit;
      
      return True;
   end Fenster_Schliessen;
   
begin
      
   Gtk.Main.Init;
   ---
   
   -- FENSTER
   Gtk_New(Fenster);
   Fenster.Set_Default_Size(400,400);
   
   Gtk_New_Vbox(Box);
   
   Gtk_New(Label, "Hallo Welt!");
   
   Box.Add(Label);
   
   Fenster.Add(Box);

   Fenster.On_Delete_Event(Fenster_Schliessen'Unrestricted_Access);
   
   ---
   Fenster.Show_All;
   Fenster.Present;
   
   Gtk.Main.Main;
      
end test;

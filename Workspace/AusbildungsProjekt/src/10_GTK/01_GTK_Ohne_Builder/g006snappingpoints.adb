
with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Window;      use Gtk.Window;

with Gtk.Main;

with G006SnappiPack;           use G006SnappiPack;
procedure G006SnappingPoints is

   Fenster : Gtk_Window;
   Die_Box : Gtk_Vbox;

begin 

   Gtk.Main.Init;
   
   -- Fenster
   Gtk_New (Fenster);
   Fenster.Set_Default_Size(1000, 1000);
   
   -- Box
   Gtk_New_Vbox(Die_Box);
   Fenster.Add(Die_Box);
   
   -- Sobald man anfaengt eigene Widges zu machen MUSS
   -- man dies in ein externes Paket auslagern, da man
   -- ansonsten Probleme mit der "accessibility" bekommt.
   -- Man erhaelt so unglaublich schnell den Fehler:
   -- "accessibility check failed"
   G006SnappiPack.Start(Box => Die_Box);
   
   -- Show
   Fenster.Show_All;
   Fenster.Present;

   Gtk.Main.Main;
   
   
end G006SnappingPoints;

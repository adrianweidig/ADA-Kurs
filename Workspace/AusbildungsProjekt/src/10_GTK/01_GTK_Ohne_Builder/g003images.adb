with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Window;      use Gtk.Window;

with Gtk.Main;

-- Bilderpakete
with Gtk.Image;       use Gtk.Image;
with Gdk.Pixbuf;      use Gdk.Pixbuf;

-- Glib
with Glib.Error;      use Glib.Error;

procedure G003Images is
   
   Error        : aliased Glib.Error.GError;
   
   Fenster : Gtk_Window;
   Box     : Gtk_Vbox;
   
   -- Moeglichkeit 1 direkt ueber GTK_Image
   Bild1   : Gtk_Image := Gtk_Image_New_From_File(Filename => "Data\Bilder\horse1.gif");
   Bild2   : Gtk_Image := Gtk_Image_New_From_File(Filename => "Data\Bilder\horse2.gif");
   
   -- Moeglichkeit 2 ueber Pixbuf um das Bild veraendern zu koennen
   Bild1_Pix : Gdk_Pixbuf;
   Bild2_Pix : Gdk_Pixbuf;
   
   -- ACHTUNG:
   -- Bilder koennen ueber Glade eingebunden werden. Dort werden diese
   -- jedoch als pixbufs eingebunden. Somit entfallen die Animationen.
   -- Zusaetzlich muss die Pfadangabe vom Glade Ordner aus orientiert
   -- werden.

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
   
   -- Verwendung von Pixbuf
   -- ACHTUNG:
   -- Es wurden absichtlich Gifs genommen um zu zeigen,
   -- dass bei der Verwendung von pixbuf die Animation
   -- verloren geht. Da die Animationsinformationen
   -- nicht in ein Pixbuf Typ uebernommen werden.s
   
   -- Auskommentieren um die animierten Bilder zu zeigen
   Gdk_New_From_File(Pixbuf   => Bild1_Pix,
                     Filename => "Data\Bilder\horse1.gif",
                     Error    => Error);
   
   Gdk_New_From_File(Pixbuf   => Bild2_Pix,
                     Filename => "Data\Bilder\horse2.gif",
                     Error    => Error);
   
   Bild1 := Gtk_Image_New_From_Pixbuf(Bild1_Pix);
   
   Bild2 := Gtk_Image_New_From_Pixbuf(Bild2_Pix);
   
   
   -- Bilder hinzufuegen
   Box.Add(Bild1);
   Box.Add(Bild2);
 
   -- Handler
   Fenster.On_Delete_Event(Fenster_Schliessen'Unrestricted_Access);

   
   
   
   -- Show
   Fenster.Show_All;
   Fenster.Present;

   Gtk.Main.Main;
   
end G003Images;

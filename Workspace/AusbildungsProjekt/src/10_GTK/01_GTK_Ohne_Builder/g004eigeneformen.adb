with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Window;      use Gtk.Window;

with Gtk.Image;       use Gtk.Image;

with Gtk.Main;

with Gtk.Drawing_Area;    use Gtk.Drawing_Area;

-- Cairo 2D Framework
with Cairo;               use Cairo;

with Glib;                use Glib;
with Glib.Object;         use Glib.Object;

procedure G004EigeneFormen is
   -- Objekte
   Fenster  : Gtk_Window;
   VBox     : Gtk_Box;
   DrawArea : Gtk_Drawing_Area;
   
   -- Handler Funktion um das Programm beim
   -- Schliessen des Fensters zu quitieren.
   function Fenster_Schliessen (this : access Gtk_Widget_Record'Class; Event: Gdk.Event.Gdk_Event) return Boolean is
      pragma Unreferenced(this, Event);
   begin
      Gtk.Main.Main_Quit;
      return True;
   end Fenster_Schliessen;

   -- Zustaendig fuer das "Malen" auf die entsprechende Oberflaeche
   function Malflaeche(Self : access GObject_Record'Class; Cr : Cairo_Context) return Boolean is
      
   begin
      
      Paint(Cr);

      -- Faerbt den Cairo_Context ein
      -- Farbe wird in RGB % < angegeben
      -- Link: https://convertingcolors.com/
      -- Zeigt RGB Farben auch in % an
      Set_Source_Rgb (Cr, 0.20, 0.66, 0.32);
      
      -- Erzeugt ein Rechteck. Lediglich nicht sichtbar,
      -- solange dieses nicht gefillt ist oder der Stroke
      -- also der Rahmen angezeigt wird.
      Rectangle (Cr, 50.0, 50.0, 50.0, 50.0);

      -- Fuellt es mit der zugewiesenen Farbe
      Fill (Cr);
      
      -- Moechte man andere Formen kann man dies auf dem gleichen
      -- Context platzieren.
      -- ABER man beachte, dass man dann quasi ein grosses Feld hat,
      -- welches "bemalt" ist. Sinnvoller waere es einzelne
      -- Formobjekte also einzelne Contexte zu haben.
      Set_Source_Rgb (Cr, 0.1, 0.1, 1.0);
      Rectangle (Cr, 250.0, 250.0, 50.0, 50.0);
      Fill (Cr);
      
      
      return False;
   end Malflaeche;

begin
   Gtk.Main.Init;
   
   -- Fenster
   Gtk_New (Fenster);
   Fenster.Set_Default_Size(1000, 1000);
   
   -- Drawing Area -------------------------------------------
   -- Die Drawing Area dient als Oberflaeche
   -- fuer den Cairo Context
   Gtk_New(DrawArea);
   
   Gtk_New_Vbox(VBox);
   
   VBox.Add(DrawArea); 

   Fenster.Add(VBox);
   
   DrawArea.On_Draw(Malflaeche'Unrestricted_Access, VBox);
   -- Drawing Area --------------------------------------------

   -- Fenster Handler
   Fenster.On_Delete_Event(Fenster_Schliessen'Unrestricted_Access);

   -- Show
   Fenster.Show_All;
   Fenster.Present;

   Gtk.Main.Main;
  
end G004EigeneFormen;

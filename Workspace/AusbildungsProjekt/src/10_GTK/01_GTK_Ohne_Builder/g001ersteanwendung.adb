with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Main;
with Gtk.Window;      use Gtk.Window;

procedure G001ErsteAnwendung is

   Fenster : Gtk_Window;
   Label   : Gtk_Label;
   Box     : Gtk_Vbox;

   -- Handler Funktion um das Programm beim
   -- Schliessen des Fensters zu quitieren.
   function Fenster_Schliessen
     (this : access Gtk_Widget_Record'Class;
      Event: Gdk.Event.Gdk_Event) return Boolean
   is
      -- Unterdrueckt das Warning, dass die access Types
      -- zu diesem Zeitpunkt noch nicht referenziert sind.
      pragma Unreferenced(this, Event);
   begin
      -- Beendet das Programm
      Gtk.Main.Main_Quit;
      return True;
   end Fenster_Schliessen;

begin
   -- Initialisiert alle Grundanweisungen von GTK
   Gtk.Main.Init;

   -- Erzeugt eine neues Fenster 400x400
   Gtk_New (Fenster);
   Fenster.Set_Default_Size(400, 400);

   -- Erzeugt eine sogenannte Box.
   -- Eine Box ist eine X auf X Einheit, welche einzelne
   -- Inhalte in sich weiter gliedern laesst. Diese kann
   -- man vertikal (VBox) als auch horizontal (HBox) ausrichten.
   Gtk_New_Vbox(Box);

   -- Fuegt das Label (Platzhalter fuer Text) hinzu
   Gtk_New(Label, "Hallo Welt!");
   Box.Add(Label);

   -- Fuegt die Box dem Fenster als "Children" hinzu
   Fenster.Add(Box);

   -- Sorgt dafuer, dass beim Schliessen des Fensters unsere
   -- vordefinierte Prozedur aufgerufen wird.
   Fenster.On_Delete_Event(Fenster_Schliessen'Unrestricted_Access);

   -- Zeigt das Fenster
   Fenster.Show_All;
   Fenster.Present;

   -- Startet die GTK+ Main Schleife, sodass
   -- das Fenster "gehalten" wird.
   Gtk.Main.Main;

end G001ErsteAnwendung;

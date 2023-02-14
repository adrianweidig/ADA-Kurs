
with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Window;      use Gtk.Window;

with Gtk.Main;

---- Spezielle hierfuer benoetigte Pakete

with Cairo;                    use Cairo;
with Glib;                     use Glib;
with Glib.Object;              use Glib.Object;
with Gdk.RGBA;                 use Gdk.RGBA;
with Gdk.Types;                use Gdk.Types;
with Gtkada.Canvas_View;       use Gtkada.Canvas_View;
with Gtkada.Canvas_View.Views; use Gtkada.Canvas_View.Views;
with Gtkada.Style;             use Gtkada.Style;

with Pango.Font;               use Pango.Font;

with Gdk.Pixbuf;               use Gdk.Pixbuf;

with Glib.Error;               

with Ada.Tags;                 use Ada.Tags;

---- Spezielle hierfuer benoetigte Pakete
procedure G005Canvas is
 
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
   
   ---- Spezielle hierfuer benoetigte Objekte
   
   Canvas_Modelle   : List_Canvas_Model;
   
   Canvas           : Canvas_View;
   
   -- Ausprobieren, denn es gibt viele 
   -- Moeglichkeiten in Gtkada.Canvas_View
   Polyline, 
   Polyline2        : Polyline_Item;
   
   -- ca. Sqrt(3)/2 ohne Nutzung der ganzen extra Pakete etc.
   Wurzel3Halbe     : constant Gdouble := 0.86602540378443864676;
   Kantenlaenge     : Gdouble := 60.0;
   
   Textbox          : Text_Item;
   
   Schrift          : Drawing_Style;
   ---- Spezielle hierfuer benoetigte Objekte
   
   --- WEITERE HANDLER ---
   function On_Item_Event
     (View  : not null access GObject_Record'Class; Event : Event_Details_Access) return Boolean is
      
      -- "Welches Event?" & Button "Button Name [Z.B. Button 1, Scroll 5 etc.]
      Std_Text : constant String := Canvas_Event_Type'Image (Event.Event_Type) & " (button" & Guint'Image (Event.Button) & ")";
   begin
      -- Ist ein Model ausgewaehlt (Z.B. Polyline) oder
      -- wurde einfach irgendein Button gedrueckt.
      if Event.Toplevel_Item /= null then
         Textbox.Set_Text(Std_Text & " auf " & External_Tag (Event.Toplevel_Item'Tag));
      else
         Textbox.Set_Text (Std_Text);
      end if;
      
      -- Aendert automatisch die Groesse der Textbox anhand des Inhalts
      Canvas.Model.Refresh_Layout;

      -- Bei genauer Anwendung des On_Item_Event Handlers koennen somit
      -- einige Eingaben abgefangen werden.
      
      return False; 
      -- Muss auf False gesetzt sein, damit andere 
      -- Events ebenfalls abgefangen werden. Sonst 
      -- bleibt man nach der Ausfuehrung von On_Item_Event
      -- stehen und die anderen Ereignisse werden nicht
      -- abgefangen z.B. Drag & Drop etc.
   end On_Item_Event;
   
   -- Manche Handler / Funktionen sind Generisch und benoetigen erst genauere
   -- Definition (oftmals Fehler "no selector...." dies bedeutet, dass in der Regel
   -- ein Modifier mit angegeben werden muss der genauer definiert was bei Ausloesung
   -- des Events passieren soll. (Ausprobieren um Effekte zu sehen)
   -- Hier: 0 = Bewegung alles andere = Keine Bewegung bei Maustasten
   function On_Item_Event_Key_Scrolls is new On_Item_Event_Key_Scrolls_Generic
     (Modifier => 0);
   
   

begin
   Gtk.Main.Init;
   
   -- Fenster
   Gtk_New (Fenster);
   Fenster.Set_Default_Size(1000, 1000);
   
   -- Box
   Gtk_New_Vbox(Box);
   Fenster.Add(Box);
   
   ------------------------------------- CANVAS ----------------------------------------------------
   -- Vorinitialisieren der Model-List und des Canvas_Views
   Gtk_New(Canvas_Modelle);
   Gtk_New(Canvas);
   
   -- Laesst zu, dass mehrere gewaehlt werden koennen
   Canvas_Modelle.Set_Selection_Mode(Selection_Multiple);
   
   -- Malt auf die Canvas Flaeche alle Inhalte der Modelliste
   Canvas.Set_Model(Canvas_Modelle);
   
   -- Warum sieht das so komisch aus?
   -- Entsprechend der Formel wurde ein regelmaessiges
   -- Sechseck berechnet.
   -- Moechte man die Groesse veraendern muss man die Kantenlaenge anpassen.
   -- Der erste Parameter ist eine Farbe mit einem Schatten.
   Polyline := Gtk_New_Polyline
   -- Farbe auch hier wieder in RGBA PROZENT <
     (Gtk_New (Fill => Create_Rgba_Pattern ((0.0, 0.0, 0.0, 1.0)),
               Shadow => (Color => (0.0, 0.0, 0.0, 0.8), others => <>)),
      
      -- Sind die verschiedenen Eckpunkte des Sechsecks. Das Verbinden
      -- passiert bei einer Polyline automatisch
      ((2.0 * Kantenlaenge, Kantenlaenge * Wurzel3Halbe),
       (1.5 * Kantenlaenge, Kantenlaenge * Wurzel3Halbe * 2.0),
       (0.5 * Kantenlaenge, Kantenlaenge * Wurzel3Halbe * 2.0),
       (0.0,     Kantenlaenge * Wurzel3Halbe),
       (0.5 * Kantenlaenge, 0.0),
       (1.5 * Kantenlaenge, 0.0)),
      Close => True);
   
   -- Platziert die Polyline auf X Y Koordinaten des Canvas
   Polyline.Set_Position ((500.0, 500.0));
   
   -- Fuegt die Polyline zur Liste der Modelle hinzu
   Canvas_Modelle.Add (Polyline);
   
   --- Polyline 2
   Polyline2 := Gtk_New_Polyline
     (Gtk_New (Fill => Create_Rgba_Pattern ((1.0, 1.0, 1.0, 1.0)),
               Shadow => (Color => (0.0, 0.0, 0.0, 0.8), others => <>)),
      ((2.0 * Kantenlaenge, Kantenlaenge * Wurzel3Halbe),
       (1.5 * Kantenlaenge, Kantenlaenge * Wurzel3Halbe * 2.0),
       (0.5 * Kantenlaenge, Kantenlaenge * Wurzel3Halbe * 2.0),
       (0.0,     Kantenlaenge * Wurzel3Halbe),
       (0.5 * Kantenlaenge, 0.0),
       (1.5 * Kantenlaenge, 0.0)),
      Close => True);
   
   Polyline2.Set_Position ((250.0, 250.0));

   Canvas_Modelle.Add (Polyline2);
   
   -- Fuegt das Canvas zur Box hinzu um die Inhalte anzuzeigen
   Box.Add(Canvas);
   
   
   
   -- Textbox zum Canvas hinzufuegen
   
   -- Erzeugt eine Schriftart mit:
   -- Stroke => Schriftfarbe (Null_RGBA = Schwarz)
   -- Font   => Schriftart
   Schrift := Gtk_New (Stroke => Gdk.RGBA.Black_RGBA,
                       Font   => (Name   => From_String ("sans 8"),
                                  others => <>));
   
   Textbox := Gtk_New_Text(Schrift, "");
   
   -- Warum (()) ? --> Set_Position moechte ein Pos Objekt. 
   -- dieses wird innerhalb der ersten Klamme deklariert. Somit
   -- kann mit ((X,Y)) die Position per Komposition angegeben
   -- werden.
   Textbox.Set_Position((10.0, 10.0));
   
   Canvas_Modelle.Add(Textbox);

   -- Verhindert das Ueberlappen einzelner Models
   -- Bei Ueberlappung wird das untere Model verschoben.
   -- Duration = Animationsdauer der Verschiebung in Sekunden
   
   -- ACHTUNG:
   -- Das Ueberlappen wird anhand des RECHTECKS um das Objekt
   -- erkannt. Z.B. bei unserem Sechseck wird ein Ueberlappen
   -- erkannt wenn sich die Eck-Kanten treffen.
   -- Eine moegliche Alternative waere hier eigene Kollisions-
   -- rechtecke zu definieren die an jeder Kante des Sechsecks
   -- liegen. So waere es moeglich auch alle 6 Seiten abzufragen.
   Canvas.Avoid_Overlap(Avoid    => False,
                        Duration => 1.0);
   
   --- Canvas Handler
   --  Sorgt dafuer, dass alle Events abgefangen werden
   --  und nutzt die obig ueberschriebene Funktion / Handler
   Canvas.On_Item_Event (On_Item_Event'Access);

   --  Die Reihenfolge ist irrelevant
   -- Uebergibt die entsprechend des Namens ausgewaehlten
   -- Handler und macht sie fuer die Items des Canvas "moeglich"
   -- hier z.B. Auswaehlen und Bewegen und Bewegen mit Pfeiltastena
   -- Achtung:
   -- Es ist ein "unsichtbares" Netz / Grid im Hintergrund vorhanden
   -- an welchem sich die Objekte orientieren, wenn dies nicht anders
   -- eingestellt ist. Move_Item hat die Funktion unter Nutzung der
   -- Shift Taste das Grid zu ignorieren.
   
   -- Es koennen mit Strg + Klick auch mehrere ausgewaehlt und gleichzeitig
   -- verschoben werden.
   Canvas.On_Item_Event (On_Item_Event_Select'Access);
   Canvas.On_Item_Event (On_Item_Event_Move_Item'Access);  
   Canvas.On_Item_Event (On_Item_Event_Key_Scrolls'Access);
   ------------------------------------- CANVAS ----------------------------------------------------
   -- Handler
   Fenster.On_Delete_Event(Fenster_Schliessen'Unrestricted_Access);
   
   -- Show
   Fenster.Show_All;
   Fenster.Present;

   Gtk.Main.Main;
   
   
end G005Canvas;

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

with Ada.Tags;                 use Ada.Tags;

with Gtkada.Canvas;            use Gtkada.Canvas;



-- LOESCHEN
with Gdk.Pixbuf; use Gdk.Pixbuf;
with Glib.Error; use Glib.Error;
with Ada.Text_IO; use Ada.Text_IO;
package G006SnappiPack is

   procedure Start(Box : access Gtk.Box.Gtk_Box_Record'Class);
   
private
   
   type Own_Canvas_View_Record is new Canvas_View_Record with record
      Aktiviert : Boolean := True;
   end record;
   
   type Own_Canvas_View is access all Own_Canvas_View_Record'Class;

   Canvas_Modelle   : List_Canvas_Model;

   Canvas           : Own_Canvas_View;

   Polyline, 
   Polyline2        : Polyline_Item;

   Wurzel3Halbe     : constant Gdouble := 0.86602540378443864676;
   Kantenlaenge     : Gdouble := 60.0;
   
   Textbox          : Text_Item;
   
   Schrift          : Drawing_Style;
   
   -- EIGENE FIGUR
   -- Eigenes Bild von Klasse vererbt
   -- TBD MIT EIEGENER KLASSE BISHER NOCH FEHLERHAFT
   type Schachfigur_Record is new Image_Item_Record with record
      Zahl : Integer := 0;
   end record;
   
   type Schachfigur is access all Schachfigur_Record'Class;

   Figur_Buffer : Gdk_Pixbuf;
   Figur        : Schachfigur;
   Der_Error    : aliased Glib.Error.GError;
   
   --- EIGENE FIGURs
   
   overriding procedure Draw_Internal
     (Self    : not null access Own_Canvas_View_Record;
      Context : Draw_Context;
      Area    : Model_Rectangle); 

   function On_Item_Event
     (View  : not null access GObject_Record'Class; Event : Event_Details_Access) return Boolean;

   function On_Item_Event_Key_Scrolls is new On_Item_Event_Key_Scrolls_Generic
     (Modifier => 0);

end G006SnappiPack;

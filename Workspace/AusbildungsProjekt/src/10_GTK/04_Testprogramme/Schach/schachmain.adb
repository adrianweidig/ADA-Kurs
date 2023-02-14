-- ACHTUNG:
-- Das Spiel ist aktuell so konzipiert, dass es komplett
-- auf Datenkapselung verzichtet. Daher sind
-- Aenderungen mit Vorsicht vorzunehmen.


--- GTK Packages
with Gtk;          use Gtk;
with Gtk.Box;      use Gtk.Box;

with Gtk.Label;    use Gtk.Label;
with Gtk.Widget;   use Gtk.Widget;

with Gtk.Main;     use Gtk.Main;
with Gtk.Window;   use Gtk.Window;

with Glib;         use Glib;
with Glib.Error;   use Glib.Error;

with Gtkada.Builder;     use Gtkada.Builder;

-- Ada Packages
with Ada.Text_IO;        use Ada.Text_IO;

-- Eigene Packages
with Init_Widgets; 
with GladeObjects;
with WidgetHandler;

procedure SchachMain is
   
   Builder      : Gtkada_Builder;
   Error        : aliased Glib.Error.GError;
   Return_Code  : Guint;
 
begin
   -- Initialisieren der Glade Elemente
   Gtk.Main.Init;
   Gtk_New (Builder);
   
   Return_Code := Add_From_File (Builder  => Builder,
                                 Filename => "Data\Glade\Schach.glade",
                                 Error    => Error'Access);
   if Error /= null then
      Ada.Text_IO.Put_Line ("Error : " & Get_Message (Error));
      Error_Free (Error);
      return;
   end if;
   
   --- Widgets und entsprechende Handler initialisieren
   Init_Widgets.InitGladeWidgets(Der_Builder => Builder);
   
   -- Anzeige aller Elemente
   GladeObjects.Fenster.Show_All;
   GladeObjects.Fenster.Present;
   
   Gtk.Main.Main;

   Unref (Builder);

end SchachMain;

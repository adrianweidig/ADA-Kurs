-- Beinhaltet alle Bewegungsanweisungen der Figuren
-- und der jeweiligen Schachfeldern

with Glib.Object;              use Glib.Object;
with Gtkada.Canvas_View;       use Gtkada.Canvas_View;
with Gtkada.Canvas_View.Views; use Gtkada.Canvas_View.Views;

with Schachfelder;             use Schachfelder;

package SchachfeldController is

   -- Farbe = Aktueller Spieler
   Spieler : Farbe;

   function On_Item_Event
     (View  : not null access GObject_Record'Class; Event : Event_Details_Access) return Boolean;

end SchachfeldController;

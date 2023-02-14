-- Gtk Packages
with Gtk.Status_Bar;                use Gtk.Status_Bar;

-- Gtkada Packages
with Gtkada.Canvas_View;            use Gtkada.Canvas_View;
with Gtkada.Canvas_View.Views;      use Gtkada.Canvas_View.Views;

-- Glib Packages
with Glib;                          use Glib;

-- Eigene Packages
with Schachfelder;                  use Schachfelder;
with SchachfeldController;
with GladeObjects;                  use GladeObjects;

package body WidgetHandler is

   procedure New_Game (Self : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced (Self);
   begin
      if Gestartet = False then
         Das_Schachbrett := new Schachbrett_Record;
         
         -- Initialisieren des Bretts als Canvas View
         Gtkada.Canvas_View.Initialize(Das_Schachbrett);
      
         -- Danach ist das Brett komplett Initialisiert und anzeigbar
         Init_Schachbrett(Brett => Das_Schachbrett);
      
         Brett.Add(Das_Schachbrett);
         
         Das_Schachbrett.On_Item_Event (SchachfeldController.On_Item_Event'Access);
         Das_Schachbrett.On_Item_Event (On_Item_Event_Move_Item'Access);  

         Fenster.Show_All;
      
         -- Ausfuehrung der Tests
         -- Tests(Das_Schachbrett);
         
         Gestartet := True;
         
         -- Weisser Spieler beginnt
         SchachfeldController.Spieler := W;
      else
         declare
            Status           : Context_Id := 0;
            Status_Nachricht : Message_Id;
            Nachricht        : UTF8_String := "Bitte zuvor Spiel ueber das Spiel-Menue beenden";
         begin
            Status_Nachricht := Gtk.Status_Bar.Push(Statusbar => Status_Bar,
                                                    Context   => Status,
                                                    Text      => Nachricht);
         end;
      end if;
   end New_Game;
   
   -- Beendet das Spiel und loescht das Feld
   procedure End_Game(Self : access Gtk_Menu_Item_Record'Class) is
      pragma Unreferenced(Self);
   begin
      if Gestartet then
         Brett.Remove(Das_Schachbrett);
         
         Gestartet := False; 
      end if;
   end End_Game;
      
   
end WidgetHandler;

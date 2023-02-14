-- Glib Packages
with Glib;          use Glib;

-- Gtk Packages
with Gtk.Status_Bar;use Gtk.Status_Bar;

-- GtkAda Packages
with Gtkada.Style;       use Gtkada.Style;
with Gtkada.Canvas_View; use Gtkada.Canvas_View;

-- Ada Packages
with Ada.Tags;      use Ada.Tags;
with Ada.Text_IO;   use Ada.Text_IO;

-- Eigene Packages
with GladeObjects;  use GladeObjects;

package body SchachfeldController is
   
   --------------------------------
   ----- Interne Behandlungen -----
   -------------------------------- 
   
   -- Sucht zur entsprechenden Figur das dazugehoerige Feld
   -- TODO: 
   -- Figuren kennen ihr eigenes Feld permanent
   function Finde_Feld(Ausgewaehlte_Figur : Schachfigur) return Schachfeld is

      Return_Feld : Schachfeld;      

   begin
      for Zeile in Das_Schachbrett.Schachfelder'Range(1) loop
         for Spalte in Das_Schachbrett.Schachfelder'Range(2) loop
            if Das_Schachbrett.Schachfelder(Zeile, Spalte).Figur = Ausgewaehlte_Figur then
               Return_Feld := Das_Schachbrett.Schachfelder(Zeile, Spalte);
            end if;
         end loop;
      end loop;
      
      return Return_Feld;
   end Finde_Feld;
   
   -- Berechnet die Distanz zwischen X1/Y1 und X2/Y2 
   -- und liefert ein Gdouble zur Weiterverarbeitung zurueck
   function DistanzBerechnung (X1 : Gdouble; Y1 : Gdouble; X2 : Gdouble; Y2 : Gdouble) return Gdouble is
   begin
      return Gdouble_Elementary_Functions.Sqrt(((X1-X2)*(X1-X2))+((Y1-Y2)*(Y1-Y2)));
   end DistanzBerechnung;
   
   -- Waehlt anhand der Distanzen zwischen Figur und Feld das naechste
   -- Feld aus. 
   -- TODO:
   -- Sprung nur zu "nutzbaren" Feld
   function Naechstes_Feld (Ausgewaehlte_Figur : Schachfigur) return Schachfeld is

      -- X und Y der jeweiligen Figur
      Figur_X  : Gdouble := Ausgewaehlte_Figur.Position.X;
      Figur_Y  : Gdouble := Ausgewaehlte_Figur.Position.Y;
      
      -- X und Y des jeweiligen Feldes
      Feld_X   : Gdouble := Ausgewaehlte_Figur.Position.X;
      Feld_Y   : Gdouble := Ausgewaehlte_Figur.Position.Y;

      -- Absichtich so hoch gewaehlt, damit Pruefung
      -- Distanz_Aktuell > Distanz_Neu durchgefuhert werden
      -- kann.
      Distanz   : Gdouble := Gdouble'Last;
      
      Wahl_Feld   : Schachfeld;
      Return_Feld : Schachfeld;
      
   begin
      
      for Zeile in Das_Schachbrett.Schachfelder'Range(1) loop
         for Spalte in Das_Schachbrett.Schachfelder'Range(2) loop
            
            Wahl_Feld := Das_Schachbrett.Schachfelder(Zeile, Spalte);
            
            declare 
               Hat_Figur : Boolean := Wahl_Feld.Figur /= null;
               Ist_Gegner: Boolean := False;
            begin
               
               -- Kann nur auf Gegner pruefen, wenn eine Figur vorhanden ist
               -- Sonst --> Access Check Failed
               if Hat_Figur then
                  Ist_Gegner := Wahl_Feld.Figur.Figurfarbe /= Ausgewaehlte_Figur.Figurfarbe;
               end if;
               
               -- Entweder ist das Feld leer oder ein "Gegner" steht auf dem Feld
               -- oder es ist das eigene Feld der Figur
               if not Hat_Figur or Ist_Gegner or Wahl_Feld.Figur = Ausgewaehlte_Figur then
                  -- TODO:
                  -- Einbauen, dass nur geprueft wird, wenn das Feld nutzbar ist
                  Feld_X := Wahl_Feld.Position.X;
                  Feld_Y := Wahl_Feld.Position.Y;
            
                  if DistanzBerechnung(Figur_X, Figur_Y, Feld_X, Feld_Y) < Distanz then
                     Distanz := DistanzBerechnung(Figur_X, Figur_Y, Feld_X, Feld_Y);
                     Return_Feld := Wahl_Feld;
                  end if;

               end if;
            end;
            
            
         end loop;
      end loop;
      
      return Return_Feld;
      
   end Naechstes_Feld;   
   

   -------------------------------
   ----- Schachfigur Handler -----
   ------------------------------- 
   
   procedure Figur_End_Drag (Figur : Schachfigur) is
      
      Ziel_Feld     : Schachfeld := Naechstes_Feld(Ausgewaehlte_Figur => Figur);
      
      Ziel_Position : Point      := (Ziel_Feld.Position.X, Ziel_Feld.Position.Y);
      
   begin
      
      -- Entfernt die Figur aus ihrem vorherigen Feld, fuegt es 
      -- dem neuen Feld hinzu und setzt die Position der Figur neu.
      Finde_Feld(Ausgewaehlte_Figur => Figur).Figur := null; 
      
      -- Bedeutet, dass hier ein Gegner geschlagen werden soll
      if Ziel_Feld.Figur /= null and then Ziel_Feld.Figur.Figurfarbe /= Figur.Figurfarbe then
         
         Das_Schachbrett.Model.Remove(Ziel_Feld.Figur);
      
      end if;

      Ziel_Feld.Figur := Figur;
      Figur.Set_Position(Pos => Ziel_Position);
      
      Spieler := S;

   end Figur_End_Drag;

   ------------------------
   ----- Item Handler -----
   ------------------------ 
   
   -- On_Item Event ist eine erweiterte Methode, welche permanent aufgerufen wird,
   -- sobald ein "Item" des Canvas / Schachbrettes "genutzt" wird. Z.B. mit der Maus
   -- angeklickt, ausgewaehlt etc.
   function On_Item_Event
     (View  : not null access GObject_Record'Class; Event : Event_Details_Access) return Boolean is
      Std_Text : constant String := Canvas_Event_Type'Image (Event.Event_Type) & " (button" & Guint'Image (Event.Button) & ")";
      
      Status           : Context_Id := 0;
      Status_Nachricht : Message_Id;
   begin
      
      -- Setzt den Fokuspunkt immer auf die Mitte, sodass ein
      -- Scrollen ausserhalb des Fenster, wenn Objekte via Drag and Drop
      -- verschoben werden, nicht moeglich ist. 
      
      -- ACHTUNG:
      -- Aktuell konnen die Objekte dennoch ausserhalb des Bereichs gezogen
      -- werden. End_Drag der Figur behebt dieses Problem.
      
      -- TODO: 
      -- Dafuer sorgen, dass Figuren am "Rand" abprallen statt darueber
      -- hinaus zu "stottern"
      Das_Schachbrett.Center_On(Center_On => (0.0, 0.0),
                                X_Pos     =>  0.0,
                                Y_Pos     =>  0.0,
                                Duration  =>  0.0);

      -- Immer pruefen, ob dieses Event moeglicherweise ausgeloest wurde
      -- ohne, dass es ein Toplevel_Item gibt.
      if Event.Toplevel_Item /= null then
         
         ----------------------------------------------
         ----- Spezifisches Verhalten fuer Felder -----
         ----------------------------------------------
         if External_Tag (Event.Toplevel_Item'Tag) = "SCHACHFELDER.SCHACHFELD_RECORD" then
         
            -- Dadurch, dass On_Item_Event direkt unterbricht und True zurueckliefert,
            -- werden keiner weiteren Handler aktiviert und somit auch das Bewegen
            -- nicht aktiviert. Dies tritt nur ein, wenn der Tag dem eines Feldes entspricht.
         
            -- Casten ueber das Event ware auch moeglich:
            -- Zeigt die Koordinaten des Feldes an. 
            -- Return = False sorgt dafuer, dass das Feld bewegt
            --          werden kann und die Koordinaten angezeigt werden.
            -- Return = True sorgt dafuer, dass das Feld NICHT
            --          bewegt werden kann und die Koordinaten einmalig
            --          beim Klick auf das erste Feld angezeigt werden.
            declare
               Feld : Schachfeld := Schachfeld(Event.Toplevel_Item);
            begin
               Status_Nachricht := Gtk.Status_Bar.Push(Statusbar => Status_Bar,
                                                       Context   => Status,
                                                       Text      => "X: " & Gdouble'Image(Feld.Position.X) & " , Y: " & Gdouble'Image(Feld.Position.Y));
            
            end;

            return True;
         end if;
         
         -----------------------------------------------
         ----- Spezifisches Verhalten fuer Figuren -----
         -----------------------------------------------
         if External_Tag (Event.Toplevel_Item'Tag) = "SCHACHFELDER.SCHACHFIGUR_RECORD" then
            
            -- Vorhandene Event Types:
            -- Button_Press, Button_Release, Double_Click,
            -- Start_Drag, In_Drag, End_Drag, Key_Press, Scroll, Custom
            case Event.Event_Type is

               when End_Drag
                  => Figur_End_Drag(Figur => Schachfigur(Event.Toplevel_Item));
               when others => null;
            end case;
         end if;

         -----------------------------------------
         ----- Faengt alle anderen Events ab -----
         -----------------------------------------
         Status_Nachricht := Gtk.Status_Bar.Push(Statusbar => Status_Bar,
                                                 Context   => Status,
                                                 Text      => Std_Text & " auf " & External_Tag (Event.Toplevel_Item'Tag));
      else
         Status_Nachricht := Gtk.Status_Bar.Push(Statusbar => Status_Bar,
                                                 Context   => Status,
                                                 Text      => Std_Text);
      end if;

      Das_Schachbrett.Model.Refresh_Layout;
      
      return False; 

   end On_Item_Event;    

end SchachfeldController;

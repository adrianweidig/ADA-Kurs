with Ada.Text_IO;    use Ada.Text_IO;
with Ada.Tags;       use Ada.Tags;
with Gtk.Status_Bar; use Gtk.Status_Bar;

package body Schachfelder is

   --------------------------------------
   ----- Initialisieren des Brettes -----
   --------------------------------------   

   -- Initialisiert alle Farben der Felder
   procedure InitFarben(Brett : in out Schachbrett) is
      Zaehlervariable : Integer := 0;
      
      -- Fuer die Breite der Felder
      FeldGroesse : Size := (Unit_Pixels, 107.5);
   begin
      for Zeile in Brett.Schachfelder'Range(1) loop
         for Spalte in Brett.Schachfelder'Range(2) loop
            if Zaehlervariable = 0 then
               Brett.Schachfelder(Zeile,Spalte) := new Schachfeld_Record'(Rect_Item_Record with
                                                                          Nutzbar   => False,
                                                                          Figur     => null,
                                                                          Feldfarbe => S);
               
               -- Setzt die Fuellung des Rechtecks auf Schwarz
               Brett.Schachfelder(Zeile,Spalte).Set_Style(Style => Gtk_New (Fill => Create_Rgba_Pattern ((1.0, 1.0, 1.0, 1.0))));
               
               -- Legt Hoehe und Breite fest
               Brett.Schachfelder(Zeile,Spalte).Set_Size(Width  => FeldGroesse,
                                                         Height => FeldGroesse);

               Zaehlervariable := Zaehlervariable +1;
            else
               Brett.Schachfelder(Zeile,Spalte) := new Schachfeld_Record'(Rect_Item_Record with
                                                                          Nutzbar   => False,
                                                                          Figur     => null,
                                                                          Feldfarbe => W);
               
               -- Setzt die Fuellung des Rechtecks auf Weiss
               Brett.Schachfelder(Zeile,Spalte).Set_Style(Style => Gtk_New (Fill => Create_Rgba_Pattern ((0.0, 0.0, 0.0, 1.0))));
               
               -- Legt Hoehe und Breite fest
               Brett.Schachfelder(Zeile,Spalte).Set_Size(Width  => FeldGroesse,
                                                         Height => FeldGroesse);
               
               

               Zaehlervariable := Zaehlervariable -1;
            end if;
         
         end loop;
         Zaehlervariable := (if Zaehlervariable = 0 then Zaehlervariable +1 else Zaehlervariable -1);
      end loop;
   end InitFarben;
   
   -- Initialisiert die Bauern der angegebenen Farbe
   procedure InitBauern (Brett : in out Schachbrett; Die_Farbe : Farbe) is
      Zeile : Integer := (if Die_Farbe = S then 2 else 7);
      
      -- Fuer die Breite der Felder
      FeldGroesse : Size := (Unit_Pixels, 107.5);
   begin

      for Spalte in Brett.Schachfelder'Range(2) loop
         Brett.Schachfelder(Zeile,Spalte).Figur := new Schachfigur_Record'(Image_Item_Record with
                                                                           Figurfarbe => Die_Farbe,
                                                                           Figurart   => B);
         
         -- Legt Hoehe und Breite fest (Gleich wie das entsprechende Feld)
         Brett.Schachfelder(Zeile,Spalte).Figur.Set_Size(Width  => FeldGroesse,
                                                         Height => FeldGroesse);
      end loop;
   end InitBauern;
   
   -- Initialisiert die restlichen Figuren der angegebenen Farbe
   procedure InitRestFiguren (Brett : in out Schachbrett; Die_Farbe : Farbe) is
      Zeile : Integer := (if Die_Farbe = S then 1 else 8);
      
      -- Fuer die Breite der Felder
      FeldGroesse : Size := (Unit_Pixels, 107.5);
      

   begin

      for Spalte in Brett.Schachfelder'Range(2) loop
            
         -- Tuerme
         if Spalte = 1 or Spalte = 8 then
            Brett.Schachfelder(Zeile, Spalte).Figur := new Schachfigur_Record'(Image_Item_Record with
                                                                               Figurfarbe => Die_Farbe,
                                                                               Figurart   => T);
         end if;
            
         -- Springer
         if Spalte = 2 or Spalte = 7 then
            Brett.Schachfelder(Zeile, Spalte).Figur := new Schachfigur_Record'(Image_Item_Record with
                                                                               Figurfarbe => Die_Farbe,
                                                                               Figurart   => S);
         end if;
            
         -- Laeufer
         if Spalte = 3 or Spalte = 6 then
            Brett.Schachfelder(Zeile, Spalte).Figur := new Schachfigur_Record'(Image_Item_Record with
                                                                               Figurfarbe => Die_Farbe,
                                                                               Figurart   => L);
         end if;
            
         -- Dame
         if Spalte = 4 then
            Brett.Schachfelder(Zeile, Spalte).Figur := new Schachfigur_Record'(Image_Item_Record with
                                                                               Figurfarbe => Die_Farbe,
                                                                               Figurart   => D);
         end if;
            
         -- Koenig
         if Spalte = 5 then
            Brett.Schachfelder(Zeile, Spalte).Figur := new Schachfigur_Record'(Image_Item_Record with
                                                                               Figurfarbe => Die_Farbe,
                                                                               Figurart   => K);

         end if;
         
         -- Legt Hoehe und Breite fest (Gleich wie das entsprechende Feld)
         Brett.Schachfelder(Zeile, Spalte).Figur.Set_Size(Width  => FeldGroesse,
                                                          Height => FeldGroesse);
      end loop;
   end InitRestFiguren;
   
   -- Initialisiert die entsprechende Figur mit dem richtigen Bild
   procedure InitImages(Die_Figur : Schachfigur) is
      
      Image_Buffer : Gdk_Pixbuf;
      Ein_Error        : aliased Glib.Error.GError;
      
   begin
      case Die_Figur.Figurart is
      when K 
         =>  Gdk_New_From_File(Pixbuf   => Image_Buffer,
                               Filename => "Data\Bilder\Koenig" & Farbe'Image(Die_Figur.Figurfarbe) & ".png",
                               Error    => Ein_Error);
      when D 
         =>  Gdk_New_From_File(Pixbuf   => Image_Buffer,
                               Filename => "Data\Bilder\Dame" & Farbe'Image(Die_Figur.Figurfarbe) & ".png",
                               Error    => Ein_Error);
      when T 
         =>  Gdk_New_From_File(Pixbuf   => Image_Buffer,
                               Filename => "Data\Bilder\Turm" & Farbe'Image(Die_Figur.Figurfarbe) & ".png",
                               Error    => Ein_Error);
      when L 
         =>  Gdk_New_From_File(Pixbuf   => Image_Buffer,
                               Filename => "Data\Bilder\Laeufer" & Farbe'Image(Die_Figur.Figurfarbe) & ".png",
                               Error    => Ein_Error);
      when S 
         =>  Gdk_New_From_File(Pixbuf   => Image_Buffer,
                               Filename => "Data\Bilder\Springer" & Farbe'Image(Die_Figur.Figurfarbe) & ".png",
                               Error    => Ein_Error);
      when B 
         =>  Gdk_New_From_File(Pixbuf   => Image_Buffer,
                               Filename => "Data\Bilder\Bauer" & Farbe'Image(Die_Figur.Figurfarbe) & ".png",
                               Error    => Ein_Error);
      end case;
     
      Die_Figur.Initialize_Image(Style         => Gtk_New (Stroke => (0.0, 0.0, 0.0, 0.0)), -- Maximal Transparent
                                 Image         => Image_Buffer);

   end InitImages;

   -- TODO: Statt fixen Wert 107.5 diesen durch Brett Hoehe/Breite /8 ersetzen
   procedure InitPositions (Brett : in out Schachbrett) is
      X_Koordinate : Gdouble := 0.0;
      Y_Koordinate : Gdouble := 0.0;
   begin
      for Zeile in Brett.Schachfelder'Range(1) loop
         
         -- Platziert die Rechtecke im Abstand von 107.5 Pixel, sowie
         -- die Figuren an die gleichen Stellen der jeweiligen Rechtecke
         for Spalte in Brett.Schachfelder'Range(2) loop
            Brett.Schachfelder(Zeile, Spalte).Set_Position(Pos => (X_Koordinate, Y_Koordinate));
            if Brett.Schachfelder(Zeile, Spalte).Figur /= null then
               Brett.Schachfelder(Zeile, Spalte).Figur.Set_Position(Pos => (X_Koordinate, Y_Koordinate));
            end if;
            X_Koordinate := X_Koordinate + 107.5;
         end loop;
         
         -- Sobald die Zeile beendet ist faengt es wieder komplett links an und 
         -- platziert die Rechtecke 107.5 nach unten versetzt von links nach rechts
         Y_Koordinate := Y_Koordinate + 107.5;
         X_Koordinate := 0.0;
      end loop;
   end InitPositions;

   procedure Init_Schachbrett (Brett : in out Schachbrett) is
   begin
      -----------------------------------
      -------- INITIALISIERUNGEN --------
      -----------------------------------

      -- Initialisierung unseres Model-Trees
      Gtk_New(Canvas_Modelle);

      -- Zuweisen des Model-Trees zum Canvas (Brett)
      Brett.Set_Model(Canvas_Modelle);     

      -------------------------
      -------- FARBEN ---------
      -------------------------
      
      InitFarben(Brett);
      
      -------------------------
      -------- FIGUREN --------
      -------------------------

      ----------- BAUERN ---------

      InitBauern(Brett     => Brett,
                 Die_Farbe => S);

      InitBauern(Brett     => Brett,
                 Die_Farbe => W);

         
      ----------- Restliche Figuren ---------
         
      InitRestFiguren(Brett     => Brett,
                      Die_Farbe => S);
      
      InitRestFiguren(Brett     => Brett,
                      Die_Farbe => W);
      
      -----------------------------
      -------- Positionen ---------
      -----------------------------
      
      InitPositions(Brett => Brett);
      
      -------------------------
      -------- Bilder ---------
      -------------------------
      
      for Zeile in Brett.Schachfelder'Range(1) loop
         for Spalte in Brett.Schachfelder'Range(2) loop
            if Brett.Schachfelder(Zeile,Spalte).Figur /= null then
               InitImages(Die_Figur => Brett.Schachfelder(Zeile,Spalte).Figur);
            end if;
         end loop;
      end loop;
      
      -------------------------------------------
      -------- ABSCHLUSS INITIALISIERUNG --------
      -------------------------------------------
      
      -- Hinzufuegen aller Objekte zum Model-Tree 
      for Zeile in Brett.Schachfelder'Range(1) loop
         for Spalte in Brett.Schachfelder'Range(2) loop
            Canvas_Modelle.Add(Brett.Schachfelder(Zeile,Spalte));
            Brett.Schachfelder(Zeile,Spalte).Show;
            if Brett.Schachfelder(Zeile,Spalte).Figur /= null then
               Canvas_Modelle.Add(Brett.Schachfelder(Zeile,Spalte).Figur);
               Brett.Schachfelder(Zeile,Spalte).Figur.Show;
            end if;
         end loop;
      end loop;
      
      Brett.Model.Refresh_Layout;
      
      -----------------------------------
      -------- Figuren-Verhalten --------
      -----------------------------------
      
      -- Verschiebt andere Elemente des Canvas, wenn diese
      -- sich beruehren
      Brett.Set_Snap(Snap_To_Grid   => False,
                     Snap_To_Guides => False);      

      Brett.Avoid_Overlap(Avoid    => False,
                          Duration => 1.0);

      

   end Init_Schachbrett;

   -----------------
   ----- Tests -----
   -----------------
   procedure Tests(Brett : Schachbrett) is

      package FlIO is new Ada.Text_IO.Float_IO(Glib.Gdouble);

   begin                                         
      --- Test. 
      for Zeile in Brett.Schachfelder'Range(1) loop
         for Spalte in Brett.Schachfelder'Range(2) loop
            if Brett.Schachfelder(Zeile,Spalte).Figur /= null then
               Put(Farbe'Image(Brett.Schachfelder(Zeile,Spalte).Figur.Figurfarbe) &  " ");
            end if;
         end loop;
         New_Line;
      end loop;
      
      for Zeile in Brett.Schachfelder'Range(1) loop
         for Spalte in Brett.Schachfelder'Range(2) loop
            if Brett.Schachfelder(Zeile,Spalte).Figur /= null then
               Put(Art'Image(Brett.Schachfelder(Zeile,Spalte).Figur.Figurart) &  " ");
            end if;
         end loop;
         New_Line;
      end loop;
      
      -- Wenn Positionen der Figuren passen muessen die Felder auch passen
      for Zeile in Brett.Schachfelder'Range(1) loop
         for Spalte in Brett.Schachfelder'Range(2) loop
            --  if Brett.Schachfelder(Zeile,Spalte).Figur /= null then
            --Put(Gdouble'Image(Brett.Schachfelder(Zeile,Spalte).Figur.Position.X) &  " ");
               
            FlIO.Put(Brett.Schachfelder(Zeile,Spalte).Position.X, 0, 2, 0);
            Put(" ");
            -- Put(Gdouble'Image(Brett.Schachfelder(Zeile,Spalte).Figur.Position.y) &  " ");
            FlIO.Put(Brett.Schachfelder(Zeile,Spalte).Position.Y, 0, 2, 0);
            Put(" ");
            -- end if;
         end loop;
         New_Line;
      end loop;
      
      -- Zeigt ob alle Elemente "visible" sind
      -- Wenn Positionen der Figuren passen muessen die Felder auch passen
      for Zeile in Brett.Schachfelder'Range(1) loop
         for Spalte in Brett.Schachfelder'Range(2) loop    
            Put(Boolean'Image(Brett.Schachfelder(Zeile,Spalte).Is_Invisible) & " ");
         end loop;
         New_Line;
      end loop;
   end Tests;

end Schachfelder;

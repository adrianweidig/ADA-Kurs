

package body G006SnappiPack is
   
   function On_Item_Event
     (View  : not null access GObject_Record'Class; Event : Event_Details_Access) return Boolean is

      Std_Text : constant String := Canvas_Event_Type'Image (Event.Event_Type) & " (button" & Guint'Image (Event.Button) & ")";
   begin
      if Event.Toplevel_Item /= null then
         Textbox.Set_Text(Std_Text & " auf " & External_Tag (Event.Toplevel_Item'Tag));
      else
         Textbox.Set_Text (Std_Text);
      end if;

      Canvas.Model.Refresh_Layout;
      
      return False; 

   end On_Item_Event;   
   
   overriding procedure Draw_Internal
     (Self    : not null access Own_Canvas_View_Record;
      Context : Draw_Context;
      Area    : Model_Rectangle)
   is
   begin
      
      Self.Set_Snap(Snap_To_Grid   => True,
                    Snap_To_Guides => True,
                    Snap_Margin    => 60.0);
      
      Self.Set_Grid_Size(60.0);

      Draw_Grid_Lines
        (Self    => Self,
         Style   => Gtk_New (Stroke => (0.8, 0.8, 0.8, 0.8)),
         Context => Context,
         Area    => Area);

      Canvas_View_Record (Self.all).Draw_Internal (Context, Area);
   end Draw_Internal;   

   procedure Start(Box : access Gtk.Box.Gtk_Box_Record'Class) is 
      
      
   begin
      Gtk_New(Canvas_Modelle);
      Canvas := new Own_Canvas_View_Record;
      Gtkada.Canvas_View.Initialize(Canvas);
   
      Canvas_Modelle.Set_Selection_Mode(Selection_Multiple);

      Canvas.Set_Model(Canvas_Modelle);

      Polyline := Gtk_New_Polyline
        (Gtk_New (Fill => Create_Rgba_Pattern ((0.0, 0.0, 0.0, 1.0)),
                  Shadow => (Color => (0.0, 0.0, 0.0, 0.8), others => <>)),
         ((2.0 * Kantenlaenge, Kantenlaenge * Wurzel3Halbe),
          (1.5 * Kantenlaenge, Kantenlaenge * Wurzel3Halbe * 2.0),
          (0.5 * Kantenlaenge, Kantenlaenge * Wurzel3Halbe * 2.0),
          (0.0,     Kantenlaenge * Wurzel3Halbe),
          (0.5 * Kantenlaenge, 0.0),
          (1.5 * Kantenlaenge, 0.0)),
         Close => True);

      Polyline.Set_Position(Pos      => (0.0, 0.0),
                            Anchor_X => 0.5,
                            Anchor_Y => 0.5);

      Canvas_Modelle.Add (Polyline);

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

      Box.Add(Canvas);
   
      Schrift := Gtk_New (Stroke => Gdk.RGBA.Black_RGBA,
                          Font   => (Name   => From_String ("sans 8"),
                                     others => <>));
   
      Textbox := Gtk_New_Text(Schrift, "");

      Textbox.Set_Position((10.0, 10.0));
   
      Canvas_Modelle.Add(Textbox);
      
      -- FIGUR
      
      --  Figur := new Schachfigur_Record'(Image_Item_Record with
      --                                     Zahl => 0);
      
      Figur := new Schachfigur_Record'(Image_Item_Record with
                                         Zahl => 0);
   
      Gdk_New_From_File(Pixbuf   => Figur_Buffer,
                        Filename => "Data\Bilder\BauerS.png",
                        Error    => Der_Error);
   
      Figur.Initialize_Image(Style         => Gtk_New (Stroke => (0.0, 0.0, 0.0, 0.0)), -- Maximal Transparent
                             Image         => Figur_Buffer);
   
      Figur.Set_Position((50.0, 50.0));
   
      if Figur /= null then
         Canvas_Modelle.Add(Figur);
      end if;
      
      -- FIGUR

      Canvas.Avoid_Overlap(Avoid    => False,
                           Duration => 1.0);

      Canvas.On_Item_Event (On_Item_Event'Access);

      Canvas.On_Item_Event (On_Item_Event_Select'Access);
      Canvas.On_Item_Event (On_Item_Event_Move_Item'Access);  
      Canvas.On_Item_Event (On_Item_Event_Key_Scrolls'Access);
      ------------------------------------- CANVAS ----------------------------------------------------
   end Start;
end G006SnappiPack;

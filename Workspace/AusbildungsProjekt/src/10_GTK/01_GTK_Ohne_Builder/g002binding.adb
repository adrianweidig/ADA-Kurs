with Gdk.Event;       use Gdk.Event;

with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget;      use Gtk.Widget;
with Gtk.Window;      use Gtk.Window;
with Gtk.Button;      use Gtk.Button;
with Gtk.Grid;        use Gtk.Grid;

with Gtk.Main;

procedure G002Binding is

   Zahl      : Integer := 0;
   
   Fenster   : Gtk_Window;
   Label1    : Gtk_Label;
   Label2    : Gtk_Label;
   Box       : Gtk_Vbox;
   Button    : Gtk_Button;

   -- Fenster-Schliess Funktion
   function Close_Window(Self  : access Gtk_Widget_Record'Class;Event : Gdk.Event.Gdk_Event) return Boolean is
      pragma Unreferenced (Self, Event);
   begin
      Gtk.Main.Main_Quit;
      return True;
   end Close_Window;

   -- Klick Prozeduren fuer Button1 und Button2
   procedure Update_Label(Self : access Gtk_Button_Record'Class) is
   begin
      Zahl := Zahl + 1;
      Set_Text(Label1, Integer'Image(Zahl));
   end Update_Label;
   
   procedure Update_Label2(Self : access Gtk_Button_Record'Class) is
   begin
      Zahl := Zahl - 1;
      Set_Text(Label2, Integer'Image(Zahl));
   end Update_Label2;

begin
   Gtk.Main.Init;
   Gtk_New (Fenster);
   Fenster.Set_Default_Size (100, 100);

   Gtk_New_Vbox (Box);
   Fenster.Add (Box);

   --  Label 1
   Gtk_New (Label1, "Label1");
   Box.Add (Label1);
   
   --  Label 2
   Gtk_New (Label2, "Label2");
   Box.Add (Label2);
   
   --------------
   -- BINDINGS --
   --------------
   
   -- Auszug aus Glib:
   --  Binding_Default        : constant Binding_Flags := 0;
   --  Binding_Bidirectional  : constant Binding_Flags := 1;
   --  Binding_Sync_Create    : constant Binding_Flags := 2;
   --  Binding_Invert_Boolean : constant Binding_Flags := 4;
      
   --  Binding_Default is the default binding: if the source property changes,
   --     the target property is updated with its value.
   --  Binding_Bidirectional: if either property changes, the other property
   --     is updated.
   --  Binding_Sync_Create: synchronizes the values of the source and target
   --     properties when creating the binding; the direction of the
   --     synchronization is always from the source to the target.
   --  Binding_Invert_Boolean: if the two properties being bound are booleans
   --     setting one to True will result in the other being set to False and
   --     vice versa. The flag cannot be used when passing custom
   --     transformation functions.
   
   -- AUSBILDERHINWEIS:
   -- Verschiedene Flags gem. der obigen Anzeige ausprobieren.
   -- Das Verhalten ist recht eindeutig, da wir hier das Binding
   -- an Label 1 haben.
   -- ! Das Verhalten wird erst bei der Nutzung der Buttons ersichtlich !
   
   -- Die Passenden Property Namen findet man zumeist am Ende 
   -- der .ads Datei des jeweiligen Objekts (Hier Gtk.Label.ads Zeile 896)
   Label1.Bind_Property(Source_Property => "label",
                        Target          => Label2,
                        Target_Property => "label",
                        Flags           => 0);
   
   --------------
   -- BINDINGS --
   --------------
    
   -- Button 1 erhoeht die Zahl und veraendert dann LABEL 1 < 
   Gtk_New (Button, "Aendere Label1");
   On_Clicked(Button, Update_Label'Unrestricted_Access);
   
   Box.Add(Button);
   
   -- Button 2 verringert die Zahl und veraendert dann LABEL 2 <
   Gtk_New (Button, "Aendere Label2");
   On_Clicked(Button, Update_Label2'Unrestricted_Access);
   
   Box.Add(Button);

   -- Fenster
   Fenster.On_Delete_Event (Close_Window'Unrestricted_Access);

   Fenster.Show_All;
   Fenster.Present;

   Gtk.Main.Main;

        
end G002Binding;

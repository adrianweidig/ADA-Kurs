
with Gtk;          use Gtk;
with Gtk.Box;      use Gtk.Box;

with Gtk.Label;    use Gtk.Label;
with Gtk.Widget;   use Gtk.Widget;

with Gtk.Main;     use Gtk.Main;
with Gtk.Window;   use Gtk.Window;

with Glib;         use Glib;
with Glib.Error;   use Glib.Error;

with Gtkada.Builder;     use Gtkada.Builder;

with Ada.Text_IO;        use Ada.Text_IO;

with initWidgets;

procedure TestHive is
   
   Builder      : Gtkada_Builder;
   Error        : aliased Glib.Error.GError;
   Return_Code  : Guint;
    
begin
   Gtk.Main.Init;

   Gtk_New (Builder);

   Return_Code := Add_From_File (Builder  => Builder,
                                 Filename => "D:\Entwicklung\repos\Ada-2021_Hive\Hive_Workspace\src\View\Hive.glade",
                                 Error    => Error'Access);
   if Error /= null then
      Ada.Text_IO.Put_Line ("Error : " & Get_Message (Error));
      Error_Free (Error);
      return;
   end if;

   --initWidgets.init(Der_Builder => Builder);

   Gtk.Widget.Show_All (Gtk_Widget (Gtkada.Builder.Get_Object (Builder, "Fenster")));
   Gtk.Main.Main;

   Ada.Text_IO.Put_Line ("Programm wurde beendet.");
   Unref (Builder);

end TestHive;

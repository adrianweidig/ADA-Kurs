-- Man beachte:
-- Die Vollqualifizierung dient hier nur der Veranschaulichung.
-- An vielen Stellen ist es wesentlich sinnvoller auf diese zu
-- verzichten.

-- Ebenfalls wichtig:
-- Build --> Run --> "Projektname" --> Programm auswaehlen --> Run in an external Terminal
-- Da ansonsten das Fenster nicht sichtbar wird.

with Gtk;          use Gtk;
with Gtk.Box;      use Gtk.Box;

with Gtk.Label;    use Gtk.Label;
with Gtk.Widget;   use Gtk.Widget;

with Gtk.Main;     use Gtk.Main;
with Gtk.Window;   use Gtk.Window;

with Glib;         use Glib;
with Glib.Error;   use Glib.Error;

-- Gtkada enthaelt die spezifischen Ada Inhalte
-- um Gtk ueberhaupt fuer Ada zu benutzen.
with Gtkada.Builder;     use Gtkada.Builder;

with Ada.Text_IO;        use Ada.Text_IO;

-- Wir benoetigen ein extra HandlerPackage indem
-- alle Prozeduren etc. stehen welche fuer Funktionalitaeten
-- von Buttons etc. benoetigt werden.
with G001HandlerPackage; use G001HandlerPackage;

procedure G001ErstesFenster is
   
   Builder      : Gtkada_Builder;
   Error        : aliased Glib.Error.GError;
   Return_Code  : Guint;
    
begin
   -- Initialisiert die internen GTK Prozesse
   Gtk.Main.Init;
   
   -- Schritt 1: Der Builder wird erstellt indem 
   --            ihm die benoetigten Informationen
   --            gegeben werden. Mit Add_From_File
   --            erhalten wir die Informationen nach
   --            der Zuweisung der Glade Datei.
   --            Pfadangaben sind hierbei wie gewohnt.
   Gtk_New (Builder);
   
   -- Add_From_File = Function deshalb muss eine 
   -- Zuweisung stattfinden. Man koennte den Return_Code
   -- weiter behandeln.
   
   -- File Standard Path: Project Workspace
   Return_Code := Add_From_File (Builder  => Builder,
                                 Filename => "D:\Entwicklung\repos\Ada-2021_Hive\Hive_Workspace\src\View\Hive.glade",
                                 Error    => Error'Access);
   if Error /= null then
      Ada.Text_IO.Put_Line ("Error : " & Get_Message (Error));
      Error_Free (Error);
      return;
   end if;
   
   -- Schritt 2: Registrierung der Handler (Package Prozeduren) zu
   --            den entsprechenden Signalen der Datei.
   --            z.B. gtk_main_quit() ist der Name des Handlers
   --            welcher in der Datei angegeben wurde (Window -> destroy)
   --            Diesem wird die Prozedur Quit zugewiesen (ACCESS <<)
   
   -- Die Klammern von gtk_main_quit kann man auch weglassen so kann im
   -- GUI Builder diese Methode auch aus dem Drop-Down Menue ausgewaehlt
   -- werden.
   Register_Handler
     (Builder      => Builder,
      Handler_Name => "gtk_main_quit()", -- aus der XML file <signal handler=..>
      Handler      => G001HandlerPackage.Quit'Access);
 
   -- Schritt 3: Fuehrt die Verbindung nach dem Registrieren aus und verlinkt
   --            angegebene Elemente (Signal und Handler)
   Do_Connect (Builder);
 
   --  Sucht das Fenster (ID des Fensters im Builder ist anzugeben) und oeffnet
   --  dieses, sowie alle Unterfenster
   Gtk.Widget.Show_All (Gtk_Widget (Gtkada.Builder.Get_Object (Builder, "window1")));
   Gtk.Main.Main;
 
   -- Schritt 4: Nachdem das Programm geschlossen wurde wird durch
   --            Unref der Speicher wieder freigegeben.
   Ada.Text_IO.Put_Line ("Programm wurde beendet.");
   Unref (Builder);
   
end G001ErstesFenster;

with F02KlassenPackage, Ada.Streams.Stream_IO, Ada.Strings.Unbounded, Ada.Text_IO;

use F02KlassenPackage, Ada.Streams.Stream_IO, Ada.Strings.Unbounded;

procedure F02StreamLesen is
   
   -- Vollqualifizieren ist notwendig,
   -- da wir Text und Stream_IO importieren.
   -- Alternativ kann man Text_IO aus der
   -- Use Klausel entfernen. (Prioritaet)
   Datei : File_Type;
   
   Datei_Stream : Stream_Access;
   
   Datei_Name : constant String := "Voegel.bin";
     
   Ein_Vogel : Vogel;
   
begin
   
   -- Darauf achten, dass F02StreamSchreiben
   -- die Datei ueberhaupt angelegt hat.
   Open(File => Datei,
        Mode => In_File,
        Name => Datei_Name,
        Form => "");
   
   Datei_Stream := Stream(Datei);
   
   -- Da Stream_IO ALLE Informationen
   -- in unsere Datei mit ablegt haben
   -- wir selbst die Informationen des
   -- Unbounded_Strings zu unserem 
   -- Vogel Objekt.
   -- BEACHTE:
   -- Unbounded_Strings erben von Controlled
   -- und sind somit Klassen (tagged record)
   -- mit Konstruktor Implementierung.
   -- Dies war z.B. bei Sequential_IO nicht
   -- moeglich. Ich konnte nur die
   -- "oberflaechlichen" Informationen der
   -- Klasse erhalten und Typen welche auch
   -- sequentiell zugreifbar waren.
   Vogel'Read(Datei_Stream, Ein_Vogel);
   
   Ada.Text_IO.Put_Line(To_String(Ein_Vogel.Bezeichnung));
   
   Delete(Datei);
   
end F02StreamLesen;

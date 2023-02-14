with F02KlassenPackage, Ada.Streams.Stream_IO, Ada.Strings.Unbounded;

use F02KlassenPackage, Ada.Streams.Stream_IO, Ada.Strings.Unbounded;

procedure F02StreamSchreiben is
   
   Datei : File_Type;
   
   Datei_Stream : Stream_Access;
   
   Datei_Name : constant String := "Voegel.bin";
     
   Ein_Vogel : Vogel;
   
begin
   
   Ein_Vogel.Bezeichnung := To_Unbounded_String("Amsel");
   
   Create(File => Datei,
          Mode => Out_File,
          Name => Datei_Name,
          Form => "");
   
   Datei_Stream := Stream(Datei);
   
   -- Hier mit serialisieren wir unser
   -- Vogel Objekt in unserer Datei.
   Vogel'Write(Datei_Stream, Ein_Vogel);
   
   -- Interessant sind hier auch die Inhalte der
   -- Datei selbst. Ada nimmt hier keine Ruecksicht
   -- auf Verluste und fuegt Inhalte von Klassen
   -- komplett unverschluesselt ein.
   --> Bezeichnung kann man herauslesen.
   
   Close(Datei);
 
end F02StreamSchreiben;

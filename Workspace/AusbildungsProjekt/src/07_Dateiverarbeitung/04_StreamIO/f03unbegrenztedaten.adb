-- Bei der Eingabe von Daten welche keine
-- direkt festgelegten Grenzen (z.B. Strings
-- oder Floats) haben sondern erst bei der
-- Nutzung diese Grenzen klar werden hatten
-- wir bisher das Problem, dass man diese
-- Informationen nicht persistent speichern
-- konnte. 

with Ada.Text_IO, Ada.Streams.Stream_IO;

use Ada.Streams.Stream_IO;

procedure F03UnbegrenzteDaten is
   
   -- Zur Vereinfachung
   package TIO renames Ada.Text_IO;
   
   Datei : File_Type;
   
   Datei_Stream : Stream_Access;
   
   Datei_Name   : constant String := "Unlimited_File.unli";
   
   -- Man beachte in den beiden Unterprogrammen, dass die Grenzen
   -- der beiden Typen nicht klar festgelegt sind (unbeschraenkt)
   -- diese werden erst nach Festlegung der Inhalte klar. Diese
   -- Informationen gilt es nun mitzuserialisieren.
   procedure Eingabe (Ein_String : String; Ein_Float : Float) is
   begin
      String'Write(Datei_Stream, Ein_String);
      Float'Write(Datei_Stream, Ein_Float);
   end Eingabe;
   
   procedure Ausgabe is
      -- Dies verdeutlicht nochmal das "Problem"
      -- denn wir benoetigen eine Initialisierung
      -- des Strings. Haben wir nur 3 Stellen werden
      -- immer nur 3 Stellen gelesen und dies macht
      -- das komplette lesen kaputt (Ausprobieren)
      
      --  Read_String : String := "132";
      --  Read_Float  : Float;
      
      -- Dies initialisiert unsere Objekte direkt 
      -- und uebergibt die gespeicherten Informationen
      -- hinsichtlich Grenzen. (Auch fuer beschraenkte
      -- Typen moeglich bzw. nutzbar)
      Tmp_String : String := String'Input(Datei_Stream);
      Tmp_Float : Float := Float'Input(Datei_Stream);
   begin
      
      -- READ VARIANTE
      --  String'Read(Datei_Stream, Read_String);
      --  Float'Read(Datei_Stream, Read_Float);
        
      --  TIO.Put_Line(Read_String);
      --  TIO.Put_Line(Float'Image(Read_Float));
      
      -- NEUE VARIANTE
      -- Man Beachte wieder den impliziten Zeiger:
      -- Zuerst wurde ein String eingefuegt somit
      -- ist dieser auch an erster Stelle auzulesen.
      TIO.Put_Line(Tmp_String);
      TIO.Put_Line(Float'Image(Tmp_Float));
      
   end Ausgabe;
   
begin
   -- Wie gewohnt erzeugen der Datei
   -- und des Streams
   Create(File => Datei,
          Mode => Out_File,
          Name => Datei_Name,
          Form => "");
   
   Datei_Stream := Stream(Datei);
   
   -- Aufruf der Methode und Schreiben
   -- der Informationen in die Datei. 
   Eingabe(Ein_String => "Erster Text",
           Ein_Float  => 50.123);
   
   Eingabe(Ein_String => "Zweiter Text",
           Ein_Float  => 25.12345);
   
   -- Wechsel in den Lese-Modus
   Reset(File => Datei,
         Mode => In_File);
   
   while not End_Of_File(Datei) loop
      Ausgabe;
   end loop;
   
end F03UnbegrenzteDaten;

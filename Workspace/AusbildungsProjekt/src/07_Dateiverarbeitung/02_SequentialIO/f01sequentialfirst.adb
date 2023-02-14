with Ada.Text_IO, Ada.Sequential_IO;

-- Der Verstaendlichkeit halber wird hier ueberall
-- vollqualifiziert.

procedure F01SequentialFirst is

   -- Klassischer Record
   type Ein_Record is record
      Zahl       : Integer;
      Wahrheit   : Boolean := False;
      Komma_Zahl : Float;
   end record;
   
   -- Sequential IO ist generisch und muss somit
   -- ausgepraegt werden. Erlaubt jedoch auch eine
   -- Uebernahme jeglicher Typen.
   package Record_IO is new Ada.Sequential_IO(Ein_Record);
   
   -- Der Uebersichtlichkeit halber koennte man dies
   -- hinzufuegen
   -- use Record_IO;

   -- ACHTUNG: 
   -- Heisst auch File_Type. Nutzt man also mehrere _IO 
   -- packages und bindet diese ein muss man definitiv
   -- vollqualifizieren.
   Datei : Record_IO.File_Type; 
   
   -- Der Dateityp ist nicht zwingend notwendig.
   -- Die Endungen werden einfach vom jeweiligen
   -- Betriebssystem entsprechend interpretiert.
   Datei_Name : constant String := "Sequential_Data.dat";
   
begin
   
   Record_IO.Create(File => Datei,
                    Mode => Record_IO.Out_File,
                    Name => Datei_Name,
                    Form => "");
   
   -- Write tut genau das was der Name sagt.
   -- Es schreibt in die jeweilige Datei. Hier
   -- sind jedoch auch entsprechende Rechte
   -- wichtig.
   Record_IO.Write(File => Datei,
                   Item => (5, True, 5.0));
   
   -- Item => (10, 10.0) ist nicht moeglich.
   -- Der Standardwert der im Record angegeben
   -- ist muesste in einem neuen Objekt vom
   -- jeweiligen Rekordtyp gespeichert sein.
   -- In diesem Objekt koennte man ganz normal
   -- via Aggregat etc. das Rekordobjekt erzeugen
   -- und dieses schliesslich bei Write uebergeben.
   Record_IO.Write(File => Datei,
                   Item => (10, False, 10.0));
   
   -- Wie bei Text_IO
   Record_IO.Reset(File => Datei,
                   Mode => Record_IO.In_File);
   
   -- Beim Lesen der .dat Datei sieht man, dass
   -- irgendwelche kryptischen Informationen
   -- gespeichert werden die so nicht normal
   -- lesbar sind. (Kann man auch zeigen indem
   -- man die Dateiendung auf .txt wechselt und
   -- das Ergebnis gleich bleibt)
   
   declare
      -- Wir benoetigen einen Zwischenspeicher
      -- unserer Inhalte.
      Zwischenwert : Ein_Record;
   begin
      -- Liest den naechsten Inhalt aus der File (Datei)
      -- und speichert diesen in Item (Zwischenwert)
      Record_IO.Read(File => Datei,
                     Item => Zwischenwert);
      
      Ada.Text_IO.Put_Line(Integer'Image(Zwischenwert.Zahl));
      Ada.Text_IO.Put_Line(Boolean'Image(Zwischenwert.Wahrheit));
      Ada.Text_IO.Put_Line(Float'Image(Zwischenwert.Komma_Zahl));
      
      -- Die Funktionsweise des Lesens der naechsten Zeile funktioniert
      -- wie bei Text_IO.
      Record_IO.Read(File => Datei,
                     Item => Zwischenwert);
      
      Ada.Text_IO.Put_Line(Integer'Image(Zwischenwert.Zahl));
      Ada.Text_IO.Put_Line(Boolean'Image(Zwischenwert.Wahrheit));
      Ada.Text_IO.Put_Line(Float'Image(Zwischenwert.Komma_Zahl));
      
      -- ACHTUNG:
      -- Wir koennen dies hier nur ausgeben lassen, da uns der Typ
      -- Ein_Record bekannt ist. Zwei unabhaengige Dateien koennten
      -- diese Information aus einem gemeinsamen Package rauslesen
      -- um den gleichen Typ nutzbar zu machen und die Datei
      -- zu "Deserialisieren".
        
   end ;
   
   Record_IO.Delete(Datei);
  
end F01SequentialFirst;

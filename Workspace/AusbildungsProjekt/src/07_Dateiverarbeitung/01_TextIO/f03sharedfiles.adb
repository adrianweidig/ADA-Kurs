with Ada.Text_IO;

use Ada.Text_IO;

procedure F03SharedFiles is
   
   Datei_Name : constant String := "SharedFile.txt";
   
   Datei1 : File_Type;
   
   Datei2 : File_Type;
   
begin
   
   -- Wenn bei Form "" angegeben ist koennen
   -- wir dies so nicht durchfuehren. Es ist
   -- so nicht moeglich aus verschiedenen Quellen
   -- gleichzeitig auf unsere Datei zuzugreifen.
   -- USE_ERROR: System.File_IO.Open: reopening shared file
   
   -- Um dies zu ermoeglichen kann man bei Form den
   -- Parameter "shared=yes" hinzufuegen. Dies erlaubt
   -- die gleichzeitige mehrfache Ansprache einer Datei
   -- in einem Programmablauf.
   Open(File => Datei1,
        Mode => In_File,
        Name => Datei_Name,
        Form => "shared=yes");
   
   Open(File => Datei2,
        Mode => In_File,
        Name => Datei_Name,
        Form => "shared=yes");
   
   -- Eigenschaft von shared=yes:
   
   -- Bei Reset:
   -- USE_ERROR : System.File_IO.Reset: cannot change mode of shared file
   --> Wie kann man das umgehen?
   --> Wir nutzen 2 Programme! Eins schreibt. Eins liest.
   
   -- ACHTUNG: 
   -- Moeglicher Gedanke waere eine Shared File im Out Mode die andere im In 
   -- Mode zu starten. Dies ist jedoch nicht moeglich, denn ADA implementiert
   -- das sogenannte "Flushen" (Spuelen) der Daten so, dass dies erst bei 
   -- einem Reset oder Beenden des Programmes passiert und diese dann erst fuer
   -- externe sichtbar wird. Vorher kann lediglich das Programm selbst zur 
   -- Laufzeit auf diese Informationen zugreifen.
   -- Hier wollen wir aber explizit das Verhalten, dass andere Dateien zur
   -- gleichen Zeit auf unsere Informationen zugreifen koennten.
   
   -- ANSONSTEN:
   -- Waere es moeglich auch 2 Dateiobjekte mit unterschiedlichem Modus zu erstellen
   -- um einfach auf die Laufzeitinformationen des Datenstroms zuzugreifen.

   -- Ja Threads / Tasks sind besser ABER haben wir an dieser Stelle noch nicht.
   while true loop
      
      begin
         -- Delay laesst unser Programm "warten"
         delay 1.0;
         Put_Line("Lesen Datei1: " & Get_Line(Datei1));
      
         delay 1.0;
         Put_Line("Lesen Datei2: " & Get_Line(Datei2));
      exception 
         when End_Error => Put_Line("Noch kein neuer Inhalt");
      end;
            
   end loop;
   
   -- Starten von F03SharedFilesZwei dann F03SharedFiles
   --                (Create)                (Open)
   -- ansonsten ist die Datei nicht vorhanden, somit nicht
   -- lesbar und kann dann ueber In_Mode auch nicht 
   -- zugreifbar sein.
   
   -- Ergebnis:
   -- FSFZwei schreibt permanent Inhalte in unsere Datei.
   -- FSF liest permanent mit 2 Objekten welche mit share
   --     markiert sind. Man sieht sehr schoen, dass unsere
   --     beiden Programme den Zugriff auf die Datei ausueben.
   
   
   -- NICHT VERGESSEN DIE DATEI DANN IM ANSCHLUSS MANUELL ZU LOESCHEN --
end F03SharedFiles;

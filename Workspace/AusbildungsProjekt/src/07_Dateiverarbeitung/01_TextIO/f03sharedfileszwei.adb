with Ada.Text_IO;

use Ada.Text_IO;

procedure F03SharedFilesZwei is

   Datei_Name : constant String := "SharedFile.txt";
   
   Datei1 : File_Type;

   Zahl : Integer := 0;
   
begin
   
   -- ACHTUNG:
   -- Man sieht hier sehr schoen, dass obwohl usnere
   -- F03SharedFiles gerade laeuft (Aufgrund der While
   -- - Schleife) wir Zugriff auf die gleiche Datei 
   -- erhalten koennen. 
   Create(File => Datei1,
          Mode => Out_File,
          Name => Datei_Name,
          Form => "");
   
   -- Setzt die 1. Zeile
   Put_Line(Datei1, "Inhalt: " & Integer'Image(Zahl));
   Zahl := Zahl+1;
   
   while true loop
      begin
         delay 2.0;
         -- Danach wird alles angehaengt. Der Reset ist wichtig
         -- aufgrund des "Flush" Verhaltens von ADA in Verbindung
         -- mit unserem 2. Leseprogramm. (Die Prozedur Flush wird
         -- bei Stream_IO naeher beleuchtet)
         Reset(Datei1, Append_File);
         Put_Line("Neuer Inhalt Integer aktuell: " & Integer'Image(Zahl));
         Put_Line(Datei1, "Inhalt: " & Integer'Image(Zahl));
         Zahl := Zahl+1;
         
         flu
      exception 
         when End_Error => Put_Line("Schreiben nicht moeglich.");
      end;
   end loop;
   
   -- NICHT VERGESSEN DIE DATEI DANN IM ANSCHLUSS MANUELL ZU LOESCHEN --
   
end F03SharedFilesZwei;

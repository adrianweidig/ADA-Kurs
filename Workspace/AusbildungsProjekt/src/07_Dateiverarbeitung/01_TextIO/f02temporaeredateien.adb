-- WICHTIG:
-- Temporaere Dateien sind nur fuer
-- die Laufzeit und die Umgebung des
-- Programmes selbst einsehbar und nutzbar.

with Ada.Text_IO;

use Ada.Text_IO;

procedure F02TemporaereDateien is

   Tmp_Datei : File_Type;

begin
   
   -- Wir wollen Informationen AUS (Out) unserem
   -- Stream in die Datei bringen.
   Create(File => Tmp_Datei,
          Mode => Out_File,
          Name => "",
          Form => "");
   
   Put_Line(Tmp_Datei, "Wort1");
   
   -- Reset mit den Parametern File und Mode
   -- aendert quasi lediglich den bereits
   -- vorhandenen Modus ohne die Datei dabei
   -- zu schliessen und haelt somit den 
   -- Stream offen und setzt gleichzeitig
   -- den Zeiger wieder auf die erste Stelle
   -- der Datei.
   Reset(File => Tmp_Datei,
         Mode => In_File);
   
   -- Ausgabe aktueller Inhalt durch die 
   -- Auswahl des In_File Modus moeglich
   Put_Line(Get_Line(Tmp_Datei));
   
   -- KONSOLENABSATZ
   New_Line;
   -- KONSOLENABSATZ
   
   -- Mit dem modus Append_File koennen
   -- wir zusaetzliche Inhalte an unsere
   -- Datei anfuegen.
   Reset(File => Tmp_Datei,
         Mode => Append_File);
   
   
   
   -- Anfuegen von Wort2 in die 2. Zeile
   -- der Datei. Appen sucht dabei egal
   -- wo sich der Zeiger befindet ob die
   -- Zeile bereits ein LF (Zeilenumbruch)
   -- besitzt und fuegt an die darauffolgende
   -- Stelle erst den neuen Inhalt an.
   Put_Line(Tmp_Datei, "Wort2");
   
   -- Somit ist Lesen wieder moeglich
   Reset(File => Tmp_Datei,
         Mode => In_File);
   
   -- Hier sieht man sehr schoen, dass es
   -- eine Art Zeiger gibt der die aktuell
   -- zu nutzende Zeile anzeigt, denn beim
   -- 2. Aufruf wird ebenfalls die 2. Zeile
   -- ausgegeben.
   Put_Line(Get_Line(Tmp_Datei));
   Put_Line(Get_Line(Tmp_Datei));
   
   -- KONSOLENABSATZ
   New_Line;
   -- KONSOLENABSATZ

   -- Hier je nach Fall In/Append und Out ausprobieren.
   Reset(File => Tmp_Datei,
         Mode => In_File); -- Hier In/Append/Out ausprobieren
   
   -- ACHTUNG:
   -- Wenn vorher der Modus In_File oder Append_File ausgeweahlt
   -- wurde, wird der Zeiger auf die 1. Stelle der Datei gesetzt.
   -- Wird jedoch der Modus Out_File ausgeweahlt,
   -- so wird der Inhalt der Datei entfernt.
   Reset(Tmp_Datei);
   
   -- Lesbar machen
   Reset(File => Tmp_Datei,
         Mode => In_File);
   
   -- Bei vorherigem In:
   -- Man gibt wieder Zeile 1 und 2 aus
   
   -- Bei vorherigem Out bzw. bei vorhandenen Schreibrechten:
   -- ... END_ERROR --> Zugriff auf Inhalte der Datei ob wohl
   -- kein Inhalt vorhanden ist.
   Put_Line(Get_Line(Tmp_Datei));
   Put_Line(Get_Line(Tmp_Datei));
   
   -- KONSOLENABSATZ
   New_Line;
   -- KONSOLENABSATZ
   
   -- Vorheriger Modus: In_File
   -- Setzt also den Zeiger auf die erste Zeile
   Reset(Tmp_Datei);
   
   -- Dies wird nun an Stelle von Zeile 1 gesetzt
   -- und ueberschreibt ebenfalls alle anderen Daten.
   -- (Zeile 2... wird dabei ebenfalls entfernt)
   Reset(File => Tmp_Datei,
         Mode => Append_File); -- Hier Out oder Append ausprobieren
   
   Put_Line(Tmp_Datei, "Wort3");
   
   Reset(File => Tmp_Datei,
         Mode => In_File);
   
   Put_Line(Get_Line(Tmp_Datei));
   
   -- Bei vorherigen Out : END_ERROR
   -- Bei Append : Wort1 Wort2 Wort3
   Put_Line(Get_Line(Tmp_Datei));
   Put_Line(Get_Line(Tmp_Datei));

end F02TemporaereDateien;

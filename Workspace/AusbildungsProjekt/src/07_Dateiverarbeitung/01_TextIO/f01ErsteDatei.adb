with Ada.Text_IO;

use Ada.Text_IO;

-- Uebersicht moeglicher Unterprogramme:
--  Create		| Erzeugen und Öffnen einer Datei
--  Open			| Öffnen einer bestehenden Datei
--  Close			| Schließen einer geöffneten Datei
--  Delete		| Löschen einer geöffneten Datei
--  Reset			| Zurücksetzen einer geöffneten Datei

--  Mode			| Abfrage des Dateimodus
--  Name			| Abfrage des Dateinamens
--  Form			| Abfrage der Dateiform 
--  Is_Open	 	| Abfrage des Dateizustands

-- Moegliche Modes:
--  In_File		| für reine Ausgabedateien    (Ich will etwas herauslesen  )
--  Out_File		| für reine Eingabedateien    (Ich will etwas reinschreiben)
--  Inout_File 	| für Ein- und Ausgabedateien (nur bei Direktzugriff       )
--  Append_File	| für reine Ausgabedateien    (anhängen, nur bei squenziell)

-- Formulierung fuer Input und Output:
-- Man spricht aus der Stream / Programmsicht. 
-- Der Stream hat den Modus "Out" also gibt er Informationen nach 
-- "Aussen" hin ab. (Z.B. gibt seine Informationen nach Aussen in 
-- die Datei)
-- Der Stream hat den Modus "In" also nimmt er Informationen nach
-- "Innen" hin auf. (Z.B. nimmt Informationen aus der Datei entgegen
-- und bearbeitet diese weiter)

-- FORM Parameter:
-- Beispiel: Form = "TEXT_TRANSLATION=Text, SHARED=Yes";
--  TEXT_TRANSLATION=[YES|NO|TEXT|BINARY|U8TEXT|WTEXT|U16TEXT]
--  SHARED=[YES|NO]
--  WCEM=[n|h|u|s|e|8|b]
--  ENCODING=[UTF8|8BITS]
-- 
-- Die Verwendung der obigen Schluesselwoerter ist in der
-- Regel nicht notwendig. Erlaubt jedoch genauere Informationen
-- ueber die erhaltenen oder gebenden Daten zu definieren. 
-- Sollte ein nicht existenter String eingegeben werden so
-- wird dieser schlichtweg ignoriert.
procedure f01ErsteDatei is
   
   -- Zwischenspeicher welcher raepraesentativ
   -- fuer die zu nutzende Datei steht.
   Datei      : File_Type;
      
   -- Stellvertreter fuer den Verzeichnisort
      
   -- Absolute Pfadangabe
   -- Datei_Name : constant String := "D:\Entwicklung\_Repos\AnwProgWeidig\ADA Lehrgang\Workspace\AusbildungsProjekt\src\ErsteDatei.txt";
      
   -- Ausgehend vom Hauptverzeichnis des Projekts
   Datei_Name : constant String := "ErsteDatei.txt";
      
   -- Nicht moeglich:
   -- Datei_Name : constant String := "\src\ErsteDatei.txt";
      
   -- Der Dateiname spiegelt eigentlich nur den Verzeichnis-
   -- namen wieder. Ohne absolute Pfadangabe beginnend ab 
   -- der Festplatte (z.B. D:\Entwicklung\..) wird der
   -- Pfad des Projekts als Stamm gewaehlt. 
   -- ErsteDatei.txt wird also dort erstellt wo das 
   -- Hauptverzeichnis des Projekts (1 ueber src) ist.
   
   procedure Erzeugen is
   begin
      --  Parameterbeschreibung:
      --  File			| Das Dateiobjekt welches genutzt wird
      --  Mode			| Der zu nutzende Modus (siehe oben)
      --  Name			| Der Dateiname
      --  Form			| Abfrage der Dateiform 
      Create(File => Datei,
             Mode => Out_File,
             Name => Datei_Name,
             Form => ""); --<-- Form kann aufgrund des Defaultwertes weggelassen werden
      
      -- Das Erzeugen der Datei ruft automatisch das "Oeffnen"
      -- des Datenstromes auf (Umgangssprachlich Stream). Dies
      -- bedeutet, dass unsere Datei "Datei" genannt, nun fuer
      -- den entsprechenden Mode (In_File) zur Verfuegung steht.
      
      -- Die nun aufgerufenen Daten mit dem Parameter "Datei"
      -- Schreiben die Informationen in die Datei und fuegen
      -- am Ende ein New_Line; hinzu.
      Put_Line(Datei, "Hier steht ein Text.");
      Put_Line(Datei, "Hier steht noch ein Text.");
      Put_Line(Datei, "Hier steht ein weiterer Text.");
      
      -- Schliesst den Stream und laesst vorerst keine weiteren
      -- Vorgaenge mehr zu.
      Close (Datei); 
      
      -- Ist die Datei bereits vorhanden wir diese komplett
      -- ueberschrieben!
   end Erzeugen;
   
   procedure Ausgeben is
   begin
      -- Oeffnet den Data-Stream im Modus "In"
      -- Dies nimmt also Informationen entgegen
      -- ("In" sich rein)
      Open(File => Datei,
           Mode => In_File,
           Name => Datei_Name,
           Form => "");
      
      -- Wird die Datei nochmals geoeffnet, nachdem
      -- diese bereits geoeffnet wurde wird der Fehler
      -- .. EXCEPTIONS.STATUS_ERROR : System.File_IO.Open: file already open
      -- ausgegeben. (Stichwort: Exception Handling | Abfangen durch Is_Open)
      
      --  Open(File => Datei,
      --       Mode => In_File,
      --       Name => Datei_Name,
      --       Form => "");
      
      -- Die Schleife wird solange aufgerufen bis in
      -- der Datei der EOF Marker erreicht wird. Welcher
      -- automatisch immer ans Ende jeder Datei hinzugefuegt wird.
      while not End_Of_File(Datei) loop
         -- Put_Line ohne die Angabe von Parameter aus Text_IO
         -- gibt den in den Parameter stehenden String in der Konsole aus.
         -- Get_Line nimmt eine Zeile bis zum "End of Line" Marker entgegen 
         -- (Bis an der Stelle der Marker gelegt wird welcher bei New_Line 
         -- festgelegt wird (Ascii Zeilenumbruchs-Zeichen LF)
         Put_Line(Get_Line(Datei));
         
         -- Kurz: Hier wird jede Zeile einzeln aus der Datei gelesen
         --       bis es keine naechste Zeile gibt.
      end loop;
      
      -- Schliessen nicht vergessen!
      Close(Datei);
   end Ausgeben;
   
   procedure Loeschen is
   begin 
      -- Der Stream muss geoeffnet werden und den Zugriff schaffen
      -- Inhalte der Datei zu veraendern:
      -- Out --> Wir wollen Informationen nach Aussehn hin abgeben
      --          (Information, dass die Datei geloescht wird)          
      Open(File => Datei,
           Mode => Out_File,
           Name => Datei_Name,
           Form => "");

      -- Ist nicht moeglich wenn der Stream nicht geoeffnet ist.
      -- Close wird jedoch auch wieder automatisch ausgefuehrt um
      -- nicht ploetzlich auf einen geloeschten Datenstrom
      -- zugreifen zu wollen.
      Delete(Datei);
   end Loeschen;
   
begin 
   -- Zum Test nach dem kompletten Programmablauf
   -- Oeffnen wir zuletzt die Datei. Diese wird durch 
   -- uns nicht geschlossen (explizit). 
   -- Jedoch am Ende der Laufzeit wird diese geschlossen.
   -- (Sieht man dadurch, dass Open ausgefuhert wird und
   -- anschliessend "TEST" bevor es im Erzeugen zu einem
   -- Fehler kommt, da die Datei bereits geoeffnet ist)
   
   --  Open(File => Datei,
   --       Mode => Out_File,
   --       Name => Datei_Name,
   --       Form => "");
   --  Put_Line("TEST");
   
   -- Simples Erzeugen unserer ersten Datei
   Erzeugen;
   
   -- Ausgeben / Lesen aus der Datei
   -- AUSBILDERHINWEIS:
   -- Zu Testzwecken kann auch Erzeugen nach dem erstmaligen
   -- Ausfuehren auskommentiert werden, sodass das Auslesen
   -- auch ohne das explizite Erzeugen der Datei, gezeigt wird.
   -- (Theoretisch auch mit Textdatei mit eigens erstellten Text 
   -- moeglich)
   Ausgeben;
   
   -- Loeschen einer Datei
   Loeschen;
   
   -- Ausgabe moeglicher Informationen:
   -- Die Datei muss hierfuer (logischerweise)
   -- nicht geoeffnet sein.
   Put_Line(Boolean'Image(Is_Open(Datei)));
   
   -- Diese Information erhalten wir jedoch nur,
   -- wenn die Datei geoeffnet ist.

   --> Datei Erzeugen sonst koennen wir diese nicht oeffnen
   --  da wir diese zuvor geloescht haben.
   Erzeugen;
   
   -- Wir moechten Informationen IN unseren Stream bekommen
   --> IN Mode
   Open(File => Datei,
        Mode => In_File,
        Name => Datei_Name,
        Form => "");
   
   -- Gibt den absoluten Pfad der Datei zurueck
   Put_Line(Name(Datei));   
   
   -- Gibt den String unter Form einfach zurueck
   Put_Line(Form(Datei)); 
   
   -- Gibt den ausgewaehlten Modus der offenen
   -- Datei als File_Mode zurueck.
   Put_Line(File_Mode'Image(Mode(Datei)));  
   
   -- Auskommentieren um Zeile 150 - 154 zu verdeutlichen
   Close(Datei);
   
   Loeschen;
   
   -- AM ENDE DER LAUFZEIT WERDEN STREAMS EBENFALLS "GEKILLT"
   -- SIEHE ZEILE: 150 - 154
   
   -- ACHTUNG ACHTUNG:
   -- Man beachte hierbei jedoch, dass dies im Bezug auf die Laufzeit
   -- ist. Nutzt man derartiges Verhalten im Netzwerk oder bei 
   -- laufenden Datenstroemen kann ein Programmabbruch oder eine
   -- Exception oftmals dafuer sorgen, dass die Laufzeit jedoch nicht
   -- unterbrochen wird, sondern dann nicht mehr auf den Stream
   -- zugegriffen werden kann was zu schweren Problemen fuehren kann.
   -- Deswegen sollte man sich immer angewoehnen Streams am Ende
   -- zu schliessen oder mit einer Klasse zu verbinden welche durch
   -- Controlled und Finalized dafuer sorgt, dass beim Programmende
   -- auch alle Streams geschlossen werden.
end f01ErsteDatei;

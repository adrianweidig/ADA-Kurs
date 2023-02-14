with Ada.Text_IO; use Ada.Text_IO;

procedure G2variablen is
   -- Deklariert die entsprechenden G2variablen (links) zu 
   -- den entsprechenden Datentypen (rechts).
   
   -- Diese koennen zusaetzlich an der gleichen Stelle 
   -- initialisiert werden durch hinzufuegen von := "WERT"
   
   -- Klassische Ganzzahl (Ohne Komma)
   Ganzzahl          : Integer;
   
   -- Klassische Kommazahl
   Gleitkommazahl    : Float;
   
   -- "Wort" was bedeutet, dass alle Inhalte als Zeichen erkannt
   -- werden. Dies widerrum bedeutet auch, dass z.B. Rechnungen
   -- damit nicht moeglich sind bzw. erst geparsed werden muessen.
   
   -- ACHTUNG: 
   -- Ein String zaehlt als sogenanntes Array. Das heißt,
   -- wenn dieser deklariert wird muss entweder die "Range"
   -- angegeben werden oder dieser bereits initialisiert werden.
   -- Hierzu bietet es sich an den String leer zu initialisieren. ("")
   
   Zeichenkette      : String := "Hallo Welt!";
   
   -- Klassische Wahrheitswerte true, false
   Wahrheitswert     : Boolean;
   
   -- Ein Character fuer den Standardbereich von 256 Zeichen (8-Bit)
   EinCharacter      : Character;
   
   -- Deklariert und initialisierte Ganzzahl Variable
   GanzzahlInit      : Integer := 20;
   
   -- Ganzzahl Konstante (Kann nicht veraendert werden)
   -- Konstanten koenenn von jedem Typ sein. Muessen jedoch initialisiert werden.
   GanzzahlKonst     : constant Integer := 40;
   
   
begin
   -- Unter der Nutzung von "Datentyp'Image(Wert|Variable)"
   -- laesst sich der Inhalt als reinen Wert ausgeben/anzeigen.
   
   -- Zuweisung / Änderung der jeweiligen Variable
   -- Auch aufzeigen, dass abs Integer moeglich ist.
   -- abs -3 = 3, abs 3 = 3 --> entfernt immer das Vorzeichen
   Ganzzahl         := 10;
   Gleitkommazahl   := 12.5;
   
   -- Achtung:
   -- Bei Strings, sollte dieser vorinitialisiert sein, muss der neu zugewiesene
   -- exakt gleich lang dem bereits zu gewiesenen sein.
   
   -- Zur Veranschaulichung einmal auskommentieren und anzeigen.
   Zeichenkette     := "Hallo Welt?"; 
   
   Wahrheitswert    := false; -- False ebenfalls zeigen.
   EinCharacter     := 'H'; -- Verschiedene Zeichen zeigen anhand ASCII Tabelle
   
   -- Ausgabe der entsprechenden G2variablen quasi als String
   Put_Line(Integer'Image(Ganzzahl));
   Put_Line(Float'Image(Gleitkommazahl));
   Put_Line(Zeichenkette);
   Put_Line(Boolean'Image(Wahrheitswert));
   Put_Line(Character'Image(EinCharacter));
   Put_Line(Integer'Image(GanzzahlInit));
   
   -- Verbindung mehrerer G2variablen
   Put_Line("Textinhalt: " & Integer'Image(Ganzzahl) & Float'Image(Gleitkommazahl) & Zeichenkette & Boolean'Image(Wahrheitswert) & Character'Image(EinCharacter) & Integer'Image(GanzzahlInit));   
  
   -- Nutzung von Char-Sequenzen
   Put_Line("Hey wie geht es Dir?" & Character'Val(10) & "Mir geht es gut danke. Wie geht es dir?" & Character'Val(10) & "Mir gehts auch gut danke");
   
   -- Extra Absatz
   New_Line;
   
   -- Moeglichkeit durch einen Integer dem Char einen Wert zuzuweisen
   Ganzzahl       := 10;
   EinCharacter   := Character'Val(Ganzzahl);
   
   Put_Line("Ein Text" & EinCharacter & "mit Umbruch.");
   
   -- ASCII Nutzung (In Text_IO enthalten daher nicht extra Import noetig)
   -- ASCII. (Autovervollstaendigung) zeigt alle moeglichen ASCII Sequenzen
   -- die moeglich sind an. (LF entspricht ebenfalls dem Absatz)
   Put_Line("Ein Text" & ASCII.LF & "mit Umbruch.");
   
   -- Beispiel fuer Wahrheitswert
   Wahrheitswert := 10 < 5;
   Put_Line(Boolean'Image(Wahrheitswert));
   
   -- Ganzzahl = 10, GanzzahlInit = 20
   -- ACHTUNG:
   -- Es koennen nur gleiche Typen miteinander vergleichen werden. 
   -- (Alle Wahrheitsoperatoren, sowie and, or, xor moeglich)
   Wahrheitswert := Ganzzahl < GanzzahlInit;
   Put_Line(Boolean'Image(Wahrheitswert));
   
   -- Zur Veranschaulichung Konstante aendern:
   Put_Line(Integer'Image(GanzzahlKonst));
   -- FUNKTIONIERT NICHT!
   -- GanzzahlKonst := 10;   
   
end G2variablen;

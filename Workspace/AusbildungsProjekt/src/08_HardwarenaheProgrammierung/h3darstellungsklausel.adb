with Ada.Text_IO, System;

use Ada.Text_IO;


-- Die Darstellungsklausel in Verbindung mit Verbunden / Records
-- laesst die Spezifizierung von Groesse, Reihenfolge und Position
-- der Komponenten zu.
procedure H3Darstellungsklausel is
   
   ------- TYPEN ----------------------------------------------------------
   
   -- Darstellungsklausel von Enumerationen 
   -- Somit koennten externe Binaer Dateien nach festgelegten Regeln auf
   -- entsprechende Positionen zugreifen. Denn 1, 2, 3 etc. entspricht dann
   -- dabei dem jeweiligen Enumerationswert im binaeren Format. (01, 10, 11 etc.)
   type Tage   is (Mon, Die, Mit, Don, Fre, Sam, Son);
   for Tage use (Mon => 1, Die => 2, Mit => 3, Don => 4, Fre => 5, Sam => 6, Son => 7);
   
   -- Es gibt auch die Moeglichkeit direkt die Zuweisungen in binaerem Format zu machen,
   -- wobei die linke Zahl dem Zahlensystem entspricht (Oktal etc. auch moeglich)
   -- Dadurch sieht man auch sehr schoen welche Speichermenge als kleinstmoegliche
   -- verwenden koennte (Hier wuerden z.B. 4 Bit reichen)
   type Monate is (Jan, Feb, Mae, Apr, Mai, Jun, Jul, Aug, Sep, Okt, Nov, Dez);
   for Monate use (Jan => 2#01#, Feb => 2#10#, Mae => 2#11#, Apr => 2#100#, Mai => 2#101#,
                   Jun => 2#110#, Jul => 2#111#, Aug => 2#1000#, Sep => 2#1001#, Okt => 2#1010#,
                   Nov => 2#1011#, Dez => 2#1100#);
   
   -- ACHTUNG:
   -- Die Reihenfolge innerhalb der Enumerationen muss streng aufsteigend sein. Gleiche Werte
   -- und gemischt auf und absteigende Werte sind nicht erlaubt, wobei die Spruenge dabei
   -- irrelevant sind:
   -- 1 2 3      -> Ok
   -- 50 150 180 -> Ok
   -- 1 3 2      -> NEIN
   -- 1 1 2      -> NEIN
   
   type Jahre  is new natural range 1900 .. 2027;
   
   type Datum  is record
      Tag   : Tage;
      Monat : Monate;
      Jahr  : Jahre;
   end record;
   
   -- Bedeutet, dass alle Objekte von Datum an einer Adresse stehen,
   -- welche OHNE Rest durch 2 teilbar ist und gibt so eine Ordnung vor.
   -- Ohne diesen Zusatz kann die Adresse an einer beliebigen Stelle
   -- stehen.
   for Datum use record
      -- At gibt die Position der Unit an. Wobei die Groesse der Unit
      -- du
      Tag   at 0 range 0 .. 4; -- 5 Bits
      Monat at 0 range 5 .. 8; -- 4 Bits
      Jahr  at 1 range 1 .. 7; -- 7 Bits 
   end record; 
   
   
   -- Datum1 hat nun automatisch die Groesse von 16 Bit,
   -- da hier die Zusammenstellung der Bits genutzt wird.
   Datum1  : Datum;
   
   type Farben is (Rot, Gruen, Blau);
   for Farben'Size use 16;

   Farben1 : Farben;
   for Farben1'Address use Datum1'Address;
   
   
   ------- TYPEN ----------------------------------------------------------
   -- BitTyp welcher uns nur 0 und 1 gibt
   type One_Zero is new Integer range 0 .. 1;
   for One_Zero'Size use 1;
   
   -- Um die Groesse auch auf die 16 Bit zu bringen,
   -- welche vom Datum genutzt werden muessen wir "Packen"
   type BYTE_TA is array (0..15) of One_Zero;
   pragma Pack(BYTE_TA);
   
   -- Da Auslesen_Byte und Datum1 nun die gleiche Size haben
   -- koennen wir sagen, dass der Adress Bereich des jeweils
   -- anderen genutzt werden soll.
   Auslesen_Byte : BYTE_TA;
   for Auslesen_Byte'Address use Datum1'Address;
   
   
   ------- Prozedur
   
   -- Da Auslesen_Byte nun auf die gleichen Speicherstellen
   -- wie unser Datum zugreift entsprechen die Zahlen des Byte
   -- Arrays den zugehoerigen Werten unseres Datum. 
   -- Man beachte hierbei, dass es Compiler abhaengig ist wie
   -- gelesen wird. Von Rechts nach Links oder von Links nach
   -- rechts. 
   -- In unserem Fall von Rechts nach Links. Jedoch nur die 
   -- einzelnen Blöcke nicht den 
   procedure BitsAuslesen is
   begin
      for I in Auslesen_Byte'range loop
         Put(ONE_ZERO'Image(Auslesen_Byte(I))& ' ');
         -- Wir setzen | an die Stellen an denen Tag zu
         -- Monat und Monat zu Jahr getrennt wird um
         -- es besser zu lesen.
         if I = 4 or I = 8 then
            Put("|");
         end if;
      end loop;
      New_Line;
   end BitsAuslesen;
   
begin
   
   Datum1 := (Mon,Dez,2021);
   
   -- Ausgabe des Records
   Put_Line("Datum: " & Tage'Image(Datum1.Tag) & " " & Monate'Image(Datum1.Monat) & Jahre'Image(Datum1.Jahr));
   
   -- Ausgabe des Byte Arrays ( Hier natuerlich alles noch 0 )
   BitsAuslesen;
   New_Line;
   
   -- Da Farben nun den Adressbereich von Datum1 nutzt
   -- aendert sich nun der Inhalt. Es waere jetzt NICHT
   -- mehr moeglich den Record wie gewohnt auszulesen.
   Farben1 := Gruen;
   -- Rot   = 0000 0000 | 0000 0000
   -- Gruen = 1000 0000 | 0000 0000
   -- Blau  = 0100 0000 | 0000 0000
   --> Viele Stellen ungenutzt. Wenn man diese jedoch benutzt
   --  muss man darauf achten, dass sie dem entsprechenden Typ
   --  entsprechen.
   
   Put_Line("Farbe: " & Farben'Image(Farben1));
   BitsAuslesen;

   --- FARBWECHSEL BLAU
   
   Auslesen_Byte(0) := 0;
   Auslesen_Byte(1) := 1;
   -- 01... entspricht Blau
   
   Put_Line("Farbe: " & Farben'Image(Farben1));
   BitsAuslesen;
   New_Line;
   
   -- Wir koennen nun auch einzelne Stellen manipulieren
   -- ein zusaetzlicher Interpreter koennte die entsprechenden
   -- Bits nun auswerten.
   Auslesen_Byte := ( 0 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 0 , 0 , 1 , 1 , 1 , 1 );
   --                 0   1   0   0   0 | 0   0   1   1 | 1   0   0   1   1   1   1 
   --                       Tag               Monat                  Jahr
   -- Von Rechts nach Links gelesen:
   --                 0   0   0   1   0 | 1   1   0   0 | 1   1   1   1   0   0   1 
   --                    0010 = Die        1100 = DEZ        (0)111 1001 = 121 (?)
   -- Man beachte: 
   --              Da wir als Range 1900 als Start angegeben haben muessen wir von unserem
   --              Zielwert ebenfalls die 1900 abziehen. 2021 - 1900 = 121 da die 1900 quasi
   --              unserer Stelle 0 entspricht.
   
   Put_Line("Datum: " & Tage'Image(Datum1.Tag) & " " & Monate'Image(Datum1.Monat) & Jahre'Image(Datum1.Jahr));
   BitsAuslesen;
   New_Line;
   
   
   -- So laesst sich ebenfalls VORAB pruefen, ob die Struktur ueberhaupt
   -- auslesbar und somit "valide" ist:
   -- Dies funktioniert jedoch nur bei skalaren Datentypen (Bei Datum also nicht aber
   -- bei dessen Inhalte)
   Put_Line("Entspricht die Bit-Struktur einem Tag in Datum? - " & Boolean'Image(Datum1.Tag'Valid));
   Put_Line("Entspricht die Bit-Struktur einer Farbe?        - " & Boolean'Image(Farben1'Valid));
   New_Line;
   
   -- Hier sieht man sehr schoen, dass Valid auch False sein kann obwohl die Struktur der uns
   -- gewuenschten entspricht. Eine Erklaerung habe ich bisher dafuer nicht gefunden. Ich
   -- vermute jedoch, dass der Bit-Bereich eigentlich 121 aussagt und dies eben nicht in unserem
   -- gewuenschten Wertebereich liegt.
   Put_Line("Entspricht die Bit-Struktur einem Jahr in Datum? - " & Boolean'Image(Datum1.Jahr'Valid));
   Put_Line("Jahreszahl:" & Jahre'Image(Datum1.Jahr));
   New_Line;
   
   -- Farbwechsel
   Farben1 := Gruen;
   
   -- Interessant. Da Gruen dem gleichen Wert eines Tages (Mon)
   -- entspricht wird auch hier True zurueckgeliefert. Dies sollte
   -- man beachten, da man nicht grundsaetzlich sagen kann, dass 
   -- Valid der ausschlaggebende Faktor zum Auslesen ist.
   Put_Line("Entspricht die Bit-Struktur einem Tag in Datum? - " & Boolean'Image(Datum1.Tag'Valid));
   Put_Line("Entspricht die Bit-Struktur einer Farbe?        - " & Boolean'Image(Farben1'Valid));
   
   Put_Line("Gruen entspricht im Wert dem Tag " & Tage'Image(Datum1.Tag));
   
   -- Man sieht, dass durch die Manipulation und die Verwendung der folgenden Eigenschaften
   -- das eigentliche Typsystem von Ada aufgehoben ist. Ebenfalls lassen sich diese Binaeren
   -- Daten nun in eine Datei schreiben und ein entsprechender Reader koennte anhand der 
   -- Daten die Inhalte auslesen.
end H3Darstellungsklausel;

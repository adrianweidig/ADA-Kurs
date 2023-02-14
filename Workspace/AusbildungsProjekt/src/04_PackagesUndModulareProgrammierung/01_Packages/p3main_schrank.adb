-- Import des Packages und dessen Moeglichkeiten
-- with p3schrank; 

-- Es reicht das Child-Package zu importieren um die
-- Funkionen des Vaterpakets zu erhalten

procedure p3main_schrank is
   -- Renaming von packages um z.B. lange oder
   -- nicht passende Paketnamen zu verkuerzen.
   package Schrank_P renames p3schrank;
   
   -- Muss auch genutzt werden, da ansonsten
   -- der SCHRANK Typ nicht ueber das Child Package
   -- sichtbar ist. Funktionen die nicht private
   -- sind sind jedoch sichtbar.
 --  package Schrank_Functions renames p3schrank.funktionen;
   
   Uebrige_Buecher : Integer;
   
   -- Initialisieren unseres persoenlichen Schranks 
   -- mit Zugriff auf den anonymen SCHRANK Typ
   DerSchrank : Schrank_P.SCHRANK;
   
   -- Alternative:
   -- Nach dem ich use auf das generisch ausgepraegte
   -- Package genutzt habe kann ich dies ohne die 
   -- Qualifizierung nutzen
   use Schrank_P;
   
   DerSchrank2 : SCHRANK;
   
begin
   
   -- Ueber Autovervollstaendigung anzeigen
   -- was genau fuer den Nutzer sichtbar ist
   
   -- Da die Methoden nicht naeher implementiert sind
   -- bzw. werden sollten diese hier auskommentiert werden.
   
    p3schrank.Hinzufuegen(Anzahl => 5);
   
   --  Uebrige_Buecher := Schrank_P.Herausnehmen(Anzahl => 10);
   
   -- Aufruf der Methoden aus dem Childpackage
   p3schrank.funktionen.FaecherInitialisieren;
   
   p3schrank.funktionen.FaecherAusgeben;
   
   -- Limited
   -- Kompilierung zeigt bereits, dass dies moeglich ist.
   -- Jedoch nur solange der Typ NICHT limited ist.
   
   -- WARUM?
   -- limited Typen haben die Moeglichkeit eben diese
   -- nicht moeglichen Operatoren zu ueberschreiben
   --> = und /= , Eine Zuweisung bleibt jedoch verwehrt.
   
   -- Wann macht das Sinn?
   -- Z.B. bei Dateien macht es Sinn, dass Datei1 = Datei2
   -- nicht moeglich ist.
   DerSchrank := DerSchrank2;
   
   -- Nicht moeglich (In p3schrank.funktionen importiert)
   --   p3schrank.funktionen.Put_Line("TEST");
   
   -- Nicht moeglich, da im private Bereich der .adb File 
   -- welche ja so oder so schon nicht zugaenglich ist
   -- Schrank_P.TestAusgabe;

end p3main_schrank;

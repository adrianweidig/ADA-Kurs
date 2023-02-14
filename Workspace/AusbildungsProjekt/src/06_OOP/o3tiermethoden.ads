with Ada.Strings.Unbounded, Ada.Text_IO;

use Ada.Strings.Unbounded, Ada.Text_IO;

-- In der Regel werden komplexere Klassen in Pakete
-- ausgelagert um deren komplexe Funktionalitaet nicht
-- im Hauptprogramm zu integrieren und dadurch eine
-- aufgeblaehte Datei zu erhalten.
package O3TierMethoden is

   -------------- Typen -------------
   type Lebewesen is tagged null record;
   
   procedure Atmen     ( Ein_Lebewesen : Lebewesen );

   type Tier is new Lebewesen with record 
      Bezeichnung       : Unbounded_String;
   end record;
   
   type Fisch is new Tier with record
      Schwimmfaehigkeit : Boolean := True;
   end record;
   
   ---- Ueberschreiben von Methoden
   
   -- Das Ueberschreiben von Methoden ueberschreibt,
   -- wie der Name sagt, bereits vorhandene Methoden
   -- mit neuen Methoden deren Koerper unterschiedlich
   -- sein kann. Die Identitaet jedoch erhalten bleiben
   -- muss (Name, Modus etc.)
   
   -- Overriding ist optional muss aber, wenn
   -- genutzt auch der Ueberschreibungssyntax 
   -- entsprechen
   overriding procedure Atmen ( Ein_Fisch : Fisch);
   
   procedure Schwimmen ( Ein_Fisch : Fisch );
   
   type Vogel is new Tier with record
      Flugfaehigkeit    : Boolean := True;
   end record;
   
   procedure Fliegen   ( Ein_Vogel : Vogel );
   
   -- In ADA gibt es keine Mehrfachvererbung.
   -- Bedeutet, dass Moewe nicht gleichzeitig
   -- ein Vogel und ein Fisch sein kann. 
   -- Jedoch koennen die Eigenschaften als
   -- Objekt innerhalb der Klasse definiert
   -- werden.
   
   --> NICHT moeglich (Keine Mehrfachvererbung)
   -- "(Ada 2005) "Fisch" must be an interface"
   -- Spaeter mehr zu Interfaces
   -- type Moewe is new Vogel and new Fisch with record
   type Moewe is new Vogel with record
      Fischeigenschaften : Fisch;
   end record;
   --__________________________________________________________
   --|     ACHTUNG ACHTUNG ACHTUNG ACHTUNG ACHTUNG            |    
   --|                                                        |  
   --| Unterprogramme sollten direkt nach der Deklaration     |
   --| der Klasse deklariert werden, da ansonsten der Fehler: |
   --| "this primitive operation is declared too late"        |
   --| auftaucht. Dies ist ein Hinweis darauf, dass wir       |
   --| uns in einer hauptsaechlich prozeduralen               |
   --| Programmiersprache befinden. Eine spaetere             |
   --| Verbindung zwischen Klasse und Methode nachdem         |
   --| "Erben" der Klasse erzeugt wurden ist nicht            |
   --| moeglich.                                              |
   --|                                                        |
   --|     ACHTUNG ACHTUNG ACHTUNG ACHTUNG ACHTUNG            |
   --|________________________________________________________|
 
   -- Wie bei Lebewesen nur fuer eine Kindklasse eine
   -- entsprechende Deklaration als "Koerperlose" Klasse.
   -- Unterprogramme koennten dennoch ueberschreiben werden.
   type Raubtier is new Tier with null Record;
   
   ---- Test-Methode um das "Redispatching" zu zeigen
   

end O3TierMethoden;

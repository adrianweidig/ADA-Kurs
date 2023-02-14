with Ada.Finalization, Ada.Strings.Unbounded;

use Ada.Finalization, Ada.Strings.Unbounded;

package O7Konstruktor is
   -- Ein Konstruktor wird in der Regel genutzt um eine
   -- Initialisierung eines Objektes zu gewaehrleisten 
   -- oder ein Standardobjekt zu deklarieren.
   -- Hier werden beide Moeglichkeiten gezeigt.
   -- Man KANN den Konstruktor nutzen, muss aber nicht.
 
   -- Aus Ada.Finalization erben wir vom Klassentyp
   -- Controlled und erhalten somit seine Funktionalitaet.
   type Tier is new Controlled with record
      Tierart : Unbounded_String;
   end record;

   -- Overriding ist optional. Hebt jedoch hervor,
   -- dass der eigentliche Ursprung woanders ist.   
   
   -- ACHTUNG:
   -- Ueberladen oder anpassen der Parameter sorgt dafuer,
   -- dass der Konstruktor nicht entsprechend des eigentlichen
   -- Sinnes aufgerufen wird (Nicht automatisch bei der
   -- Objekterstellung)
   
   -- Standardkonstruktor
   -- Wird einmalig beim "Erzeugen" des Objekts aufgerufen
   overriding procedure Initialize ( this : in out Tier );
   
   -- Destruktor:
   -- Wird ausgefuehrt, wenn Speicher freigegeben werden kann
   overriding procedure Finalize ( this : in out Tier );
   
   -- Zuweisungs- / Kopierkonstruktor:
   -- Wird JEDES Mal aufgerufen zwei Typen
   -- einander zugeordnet bzw. einer kopiert werden bzw. wird.
   overriding procedure Adjust ( this : in out Tier );
   
   
   -- Erzeugung des Objekts mit Parameteruebergabe --
   
   function Tier_Erzeugen ( Art_Des_Tieres : String) return Tier;
   

end O7Konstruktor;

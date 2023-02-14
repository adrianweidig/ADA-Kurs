-- Man sieht, dass Child-Pakete mit xxx-xxx benannt werden
-- der Programm-Bezeichner jedoch mit dem . versehen ist.

package p3schrank.funktionen is

   -- Via Autovervollstaendigung aufzeigen was alles
   -- greifbar ist.
   --> Alles aus dem Vaterpaket ist fuer das Unterpaket sichtbar
   --  und nutzbar. (Auch der "private" Bereich)
   
   procedure FaecherInitialisieren; 
   
   procedure FaecherAusgeben;

end p3schrank.funktionen;

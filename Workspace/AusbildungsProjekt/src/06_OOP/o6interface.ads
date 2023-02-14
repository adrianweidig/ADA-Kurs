package O6Interface is

   type Pferd is tagged null record;
   procedure Laufen(this : Pferd);
   
   -- Interfaces werden in der Regel anhand
   -- der zu uebergebenden "Faehigkeit" 
   -- bezeichnet und koennen NUR Unterprogramme
   -- implementieren, welche von Unterprogrammen
   -- genutzt werden koennen.
   type Flugfaehig is interface;
   
   -- ACHTUNG:
   -- Entsprechende Interface-Unterprogramme MUESSEN
   -- abstrakt oder null sein.
   --> Abstrakt : Erben MUESSEN die Prozedur ueberschreiben
   --> is null  : Erben KOENNEN die Prozedur ueberschreiben
   -->  ABER    : Es darf kein body deklariert sein.
   --             (Auf die Grundprozedur des Interfaces)
   procedure Fliegen (this : Flugfaehig) is null;
   
   type Pegasus is new Pferd and Flugfaehig with null record;
   overriding procedure Fliegen (this : Pegasus);
   
   -- Wofuer werden Interfaces genutzt?
   -- In anderen Sprachen (z.B. Java) ist es moeglich den Methoden
   -- von Interfaces zusaetzliche Default Bodys zu geben. Dies
   -- ermoeglicht eine Art der Mehrfachvererbung.
   -- Ansonsten werden Interfaces eher dazu genutzt um entweder
   -- zu ueberpruefen, ob Zwei Klassen das gleiche Interface
   -- implementieren um somit Funktionalitaet zu gewaehrleisten
   -- oder eben um eine Art von Vorabspezifikation festzulegen,
   -- da die Klassen, welche das Interface implementieren, alle
   -- DEFINTIV die gleichen Moeglichkeiten hat wie das Interface
   -- vorgibt.

end O6Interface;

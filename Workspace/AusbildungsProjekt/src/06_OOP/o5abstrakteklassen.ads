package O5AbstrakteKlassen is

   -- Eine abstrakte Klasse dient mehr oder weniger als
   -- Schablone fuer alle Unterklassen. 
   -- Man kann keine Objekte der abstrakten Klasse erzeugen,
   -- jedoch haben die Erben Zugriff auf die bereits 
   -- vorhandenne Informationen der abstrakten Klasse.
   
   -- In diesem Fall sollte jedes Fahrzeug eine Seriennummer
   -- haben. Jedoch soll der Nutzer kein "Fahrzeug" Objekt
   -- erstellen koennen, denn jedes Fahrzeug soll ein 
   -- spezialisiertes Objekt sein also z.B. ein Auto,
   -- Boot, Flugzeut etc. 
   type Fahrzeug is abstract tagged record
      Seriennummer : Integer;
   end record;
   
   -- Durch die Verwendung von "is abstract" ist fuer
   -- diese Methode kein Body vorgegeben. Jedoch
   -- MUESSEN die Erben diese Methode ueberschreiben
   -- ODER die Erben MUESSEN selbst auch abstract sein.
   
   -- Somit koennen wir der "Schablone" Fahrzeug auch
   -- Unterprogramme beifuegen.
   
   -- ACHTUNG:
   -- Wird eine abstrakte Methode verwendet MUSS
   -- die Klasse, welche diese implementiert ebenfalls
   -- abstrakt sein.
   procedure Bewegen( this : Fahrzeug) is abstract;
   
   -- overriding kann weggelassen werden. Zeigt 
   -- jedoch dem Nutzer, dass hier gerade eine
   -- "Vater"-Methode ueberschrieben wird.
   type Auto is new Fahrzeug with null record;
   overriding procedure Bewegen ( this : Auto );
   
   type Boot is new Fahrzeug with null record;
   overriding procedure Bewegen ( this : Boot);

end O5AbstrakteKlassen;

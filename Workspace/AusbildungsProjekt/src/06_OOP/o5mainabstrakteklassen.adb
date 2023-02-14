with O5AbstrakteKlassen, Ada.Text_IO;

use O5AbstrakteKlassen, Ada.Text_IO;

procedure O5MainAbstrakteKlassen is
   
   -- Nicht moeglich. 
   -- "Type of object cannot be abstract"
   -- Ein_Fahrzeug : Fahrzeug;
   
   Ein_Auto     : Auto;
   
   Ein_Boot     : Boot;
   
begin
   -- Man beachte:
   -- Da die Seriennummer nicht initialisiert ist werden wieder 
   -- zufaellige Werte eingetragen.
   Put_Line("Seriennummer des Autos : " & Integer'Image(Ein_Auto.Seriennummer));
   Put_Line("Seriennummer des Bootes: " & Integer'Image(Ein_Boot.Seriennummer));
   
   -- Zur Wiederholung:
   -- Heutzutage greift man nicht mehr direkt auf Objekt-Inhalte
   -- ueber die statischen Eigenschaften zu, sondern veraendert
   -- diese ueber Getter und Setter Methoden (Private Zugriff).
   -- Dies sorgt fuer unerwartete Grenzfaelle, welche man
   -- moeglicherweise bei der Programmentwicklung nicht beruecksichtigt
   -- und erst auftauchen wenn jemand die kompletten Moeglichkeiten
   -- nutzt. Daher ist es auch anzustreben neben der Datenkapselung
   -- das starke Typisierungs-System von ADA soweit es moeglich und
   -- noetig ist zu nutzen.
   Ein_Auto.Seriennummer := 1;
   Ein_Boot.Seriennummer := 2;
   
   Put_Line("Seriennummer des Autos : " & Integer'Image(Ein_Auto.Seriennummer));
   Put_Line("Seriennummer des Bootes: " & Integer'Image(Ein_Boot.Seriennummer));
   
   -- Die Verwendung der Methoden funktioniert wie gewohnt.
   
   -- ADA 95
   O5AbstrakteKlassen.Bewegen(Ein_Auto);
   
   O5AbstrakteKlassen.Bewegen(Ein_Boot);
   
   -- ADA 2005
   Ein_Auto.Bewegen;
   
   Ein_Boot.Bewegen;
   
end O5MainAbstrakteKlassen;

with O9XRedispatching;

use O9XRedispatching;

procedure O9XMainRedispatching is
begin
   -- HINWEIS:
   -- Zum Ausprobieren immer die auszufuehrende
   -- Zeile hinsichtlich Uebersichtlichkeit
   -- auskommentieren.
   
   ----------  BEISPIEL 1 -----------
   
   -- Uebergibt Typ Tier'Class
   --> Ergebnis:
   --  ruft 2 Mal Bewegen von Tier auf.
    --  AlleBewegen(Ein_Tier_Ref);
   
   ----------  BEISPIEL 2 -----------
   
   -- Uebergibt Typ Vogel'Class
   --> Ergebnis:
   -- ruft 1 Mal direkt die Bewegen von 
   -- Vogel auf. Dort wird die AlleBewegen
   -- nochmals rekursiv (Mit Abbruch 5)
   -- aufgerufen (--> 6 Mal "Ich fliege").
   -- Dort widerrum wird wieder
   -- via 'Class die ermittelte Hauptmethode
   -- aufgerufen (Hier Vogel)
   -- Hier koennte man nun behaupten, dass
   -- AlleBewegen von der Bewegen Methode von
   -- Vogel jedoch ja explizit einen Vogel
   -- bekommt. 
     AlleBewegen(Ein_Vogel);
   
   ----------  BEISPIEL 3 -----------
   
   -- Uebergibt Typ Tier enthaelt
   -- jedoch unsere Referenz auf unseren
   -- Vogel. 
   -- Die Information, dass dieser entlang
   -- der Klassenhierarchie ebenfalls vom
   -- Typ Vogel ist bleibt erhalten und
   -- kann bei Verwendung von Class in
   -- der .adb Datei erkannt werden und somit
   -- die richtige Methode auswaehlen.

   -- Denn obwohl hier vom Casting her ein 
   -- Tier uebergeben wird erkennt 'Class der
   -- adb, dass es sich um Grundzustand um ein
   -- Vogel handelt.
    -- AlleBewegen(Tier(Ein_Vogel_Ref));
   
   ----------  BEISPIEL 4 -----------
   
   -- Macht keinen Sinn, da Ein_Tier_Ref
   -- nicht zu Vogel gecastet werden
   -- kann.
   --  AlleBewegen(Vogel(Ein_Tier_Ref));
end O9XMainRedispatching;

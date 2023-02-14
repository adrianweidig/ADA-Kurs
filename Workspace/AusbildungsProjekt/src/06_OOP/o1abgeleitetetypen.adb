-- Abgeleitete Typen sind letztendlich
-- Typen mit den gleichen Eigenschaften
-- der Typen von denen sie abgeleitet sind.

-- Der Sinn dahinter ist eher, dass verschiedene
-- Variablen die von Typ_A sind und Variablen
-- welche von Typ_B sind (Wobei B von A abgeleitet
-- ist) nicht zueinander zugewiesen werden koennen.

-- Diese Ableitung hatte man beim Renaming als moegliche
-- Variante gesehen, wobei es sich dabei nicht um 
-- ein echte Renaming handelt.

procedure O1AbgeleiteteTypen is
   
   -- Ja das geht auch als Subtyp
   type Integer_1_Bis_10 is new Integer range 1..10;
   
   type Integer_1_Bis_5  is new Integer range 1..5;
   
   Integer_A : Integer_1_Bis_5;
   
   Integer_B : Integer_1_Bis_10;
   
   -- Man koennte davon ausgehen, dass A := B moeglich
   -- ware, da ja beide von Integer sind.
   
begin
   
   -- Funktioniert nicht.
   -- ACHTUNG:
   -- Man beachte hier naemlich die Fehleraussage. 
   -- Expected Type ..... Found Type ...
   
   -- Sagt letztendlich aus, dass es erwartet einen
   -- gleichen Typen zu haben jedoch die Zuweisung
   -- einen Typen erhaelt, der so nicht verarbeitet
   -- werden kann.
   
   
   -- Integer_A := Integer_B;
   
   
   
end O1AbgeleiteteTypen;

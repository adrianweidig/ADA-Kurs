with Ada.Text_IO, Ada.Integer_Text_IO;

use Ada.Text_IO, Ada.Integer_Text_IO;

procedure b5Rekursion is
   -- Damit in und out ueberhaupt moeglich ist
   Von, Bis : Integer;
   
   -- Erwartet die beiden Grenzen
   procedure Hochzaehlen (Von, Bis : in out Integer) is 
   begin
      -- Nur Falls der Startwert nicht gleich dem Endwert ist
      -- Wichtig:
      -- Man muss +1 machen, da es sonst nicht weiter ausfuehrt,
      -- wenn die beiden Werte gleich sind. Dies soll jedoch auch
      -- dann noch ein weiteres Mal geschehen.
      if Von /= Bis+1 then
         -- Gebe den aktuellen Startwert aus
         Put_Line(Integer'Image(Von));
         
         -- Erhohe diesen um Eins
         Von := Von+1;
         
         -- Rufe die Eigene Funktion auf jedoch nun mit den Grenzen
         -- Startwert + 1 und Endwert
         Hochzaehlen(Von, Bis);
         
      end if;
      
     -- Put_Line("Abbruch des Durchlaufs");
      
   end Hochzaehlen;
   
   -- Woertlicher Ablauf:
   -- Von = 0, Bis = 3
   -- 1. Durchlauf [Von = 0, Bis = 3]:
   ---- 0 /= 4 ? -> Ja
   ----   Gebe 0 aus
   ----   Erhoehe 0 auf 1
   -- 2. Durchlauf [Von = 1, Bis = 3]:
   ---- 1 /= 4 ? -> Ja
   ---- Gebe 1 aus
   ---- Erhoehe 1 auf 2
   -- 3. Durchlauf [Von = 2, Bis = 3]:
   ---- 2 /= 4 ? -> Ja
   ---- Gebe 2 aus
   ---- Erhohe 2 auf 3
   -- 4. Durchlauf [Von = 3, Bis = 3]:
   ---- 3 /= 4 ? -> Ja
   ---- Gebe 3 aus
   ---- Erhohe 3 auf 4
   -- 5. Durchlauf [Von = 4, Bis = 3]:
   ---- 4 /= 4 ? -> Nein
   -- Abbruch des 5. Durchlaufs
   -- Abbruch des 4. Durchlaufs
   -- Abbruch des 3. Durchlaufs
   -- Abbruch des 2. Durchlaufs
   -- Abbruch des 1. Durchlaufs
   
   
begin
   
   Put("Von wo an soll gezaehlt werden?: ");
   Get(Von);
   
   Put("Bis wohin soll gezaehlt werden?: ");
   Get(Bis);
   
   New_Line;
   
   Hochzaehlen(Von, Bis);
   
end b5Rekursion;

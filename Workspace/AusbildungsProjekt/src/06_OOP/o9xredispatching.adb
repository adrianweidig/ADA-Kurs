with Ada.Text_IO;

use Ada.Text_IO;

package body O9XRedispatching is

   procedure Bewegen (Ein_Tier : in out Tier) is
   begin
      Put_Line("Ich bewege mich!");
   end Bewegen;
   
   procedure Bewegen (Ein_Vogel : in out Vogel) is
   begin
      Put_Line("Ich fliege!");
      
      -- Hier sieht man sehr deutlich, dass die Informationen
      -- dass es sich hier um ein "Vogel-Objekt" handelt 
      -- erhalten bleiben.
      
      -- Abbruchvariable eingefuhert um Rekursion zu verhindern.
      if Abbruch < 5 then
         Abbruch := Abbruch+1;
         AlleBewegen(Ein_Vogel);
      end if;
   end Bewegen;
   
   procedure AlleBewegen (Ein_Tier: in out Tier) is
   begin
      
      -- Dies sorgt dafuer, dass der EIGENTLICHE
      -- Typ (Entlang der Klassenhierarchie) genutzt
      -- wird, welcher bei der Uebergabe mit implizit
      -- uebergeben wird.
      Tier'Class(Ein_Tier).Bewegen; --> REDISPATCHING CALL
      
      -- Um einen weiteren Schritt hinzuzufuegen kann man die
      -- AlleBewegen Methode in der Bewegen Methode von Vogel
      -- Hinzufuegen um zu sehen ob Vogel "erhalten" bleibt
      -- als Typ. (Ja wird er)
      
      -- Dies sorgt IMMER dafuer, dass die Methode
      -- der Parameterliste ausgefuhert wird.
      -- In diesem Fall Ein_Tier (Tier) und ruft
      -- somit immer das Bewegen des Typs Tier auf.
      -- Durch die Verwendung von 'Class erhalte 
      -- ich immer das richtige Ergebnis.
      Ein_Tier.Bewegen;
         
      
   end AlleBewegen;
   

end O9XRedispatching;

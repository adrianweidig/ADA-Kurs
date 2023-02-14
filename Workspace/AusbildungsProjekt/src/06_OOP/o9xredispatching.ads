package O9XRedispatching is

   type Tier is tagged null record;
   procedure Bewegen (Ein_Tier : in out Tier);
   procedure AlleBewegen (Ein_Tier: in out Tier);
   
   type Vogel is new Tier with null record;
   procedure Bewegen (Ein_Vogel : in out Vogel);
   
   Ein_Tier     : Tier;
   Ein_Tier_Ref : Tier'Class:= Ein_Tier; 
   
   Ein_Vogel     : Vogel;
   Ein_Vogel_Ref : Vogel'Class := Ein_Vogel; 
   
   -- Ist ebenfalls moeglich. Das obige Beispiel
   -- dient nur zur Veranschaulichung. Denn
   -- Tier'Class laesst ja den Zugriff auch auf
   -- ALLE Erben zu.
   
   -- Ein_Vogel_Ref : Tier'Class := Ein_Vogel;
   
   
   Abbruch : Integer := 0;

end O9XRedispatching;

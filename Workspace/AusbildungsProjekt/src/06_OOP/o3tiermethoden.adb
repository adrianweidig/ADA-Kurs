-- Im Body werden die Unterprogramme bzw.
-- alle naeher zu definierenden Inhalte aus
-- der Spezifikation naeher beschrieben.
package body O3TierMethoden is

   procedure Schwimmen ( Ein_Fisch : Fisch ) is
   begin
      -- Zugriffsmoeglichkeit auf die kompletten
      -- Informationen ueber das Ein_Fisch Objekt
      if Ein_Fisch.Schwimmfaehigkeit then
         Put_Line("Ich schwimme.");
      else 
         Put_Line("Ich kann nicht mehr schwimmen.");
      end if;
      
   end Schwimmen;
   
   procedure Fliegen ( Ein_Vogel : Vogel ) is
   begin
      if Ein_Vogel.Flugfaehigkeit then   
         Put_Line("Ich fliege.");
      else 
         Put_Line("Ich kann nicht mehr fliegen.");
      end if;
      
   end Fliegen;
   
   procedure Atmen ( Ein_Lebewesen : Lebewesen ) is
   begin
      Put_Line("Atmen durch Lunge");
   end Atmen;
   
   overriding procedure Atmen ( Ein_Fisch : Fisch ) is
   begin
      Put_Line("Atmen durch Kiemen");
   end Atmen;
   

end O3TierMethoden;

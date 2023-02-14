with Ada.Text_IO, Genimals;

use Ada.Text_IO;

procedure GenerischeTiere is
   --------------- Loewe --------------
   procedure Loewen_Bruellen is
   begin
      New_Line;
      Put_Line("Loewen ROAAAAR!");
   end Loewen_Bruellen;
   
   -- Auspraegen des packages um das richtige Bruellen zu uebergeben
   package Loewe is new Genimals(Tierbruellen => Loewen_Bruellen);
   
   -- Auspraegen der Bruellen Prozedur um das richtige Tier zu erfahren
   procedure Loewen_Roar is new Loewe.Bruellen(Tier => Loewe.Loewe);
   
   
   --------------- Baer --------------
   procedure Baer_Bruellen is
   begin
      New_Line;
      Put_Line("                                               Baeren ROAAAAR!");
   end Baer_Bruellen;
   
   -- Auspraegen des packages um das richtige Bruellen zu uebergeben
   package Baer is new Genimals(Tierbruellen => Baer_Bruellen);
   
   -- Auspraegen der Bruellen Prozedur um das richtige Tier zu erfahren
   procedure Baeren_Roar is new Baer.Bruellen(Tier => Baer.Baer);
   
   
begin
   
   Loewen_Roar;
   
   Baeren_Roar;

end GenerischeTiere;

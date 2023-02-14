with Ada.Text_IO; use Ada.Text_IO;

procedure g33typvertraeglichkeit is
   type LITER_T         is range 0 .. 100;
   type KILOMETER_T     is range 0 .. 100;
   
   subtype MILLILITER_T is LITER_T     range 0 .. 10;
   subtype METER_T      is KILOMETER_T range 0 .. 10;
   
   Getraenk    : LITER_T;
   GlasVolumen : MILLILITER_T;
   Tasse       : MILLILITER_T;
   
   Laufstrecke : KILOMETER_T;
   Autolaenge  : METER_T;
   Tischlaenge : METER_T;
   
begin

   -- Typ und Subtyp
   Getraenk    := GlasVolumen;
   GlasVolumen := Getraenk;
   
   Laufstrecke := Autolaenge;
   Autolaenge  := Laufstrecke;
   
   -- Gleiche Subtypen
   Tasse       := GlasVolumen;
   Autolaenge  := Tischlaenge;
   
   -- Unterschiedliche Typen und Subtypen mischen (FEHLER!)
   -- Getraenk    := Laufstrecke;
   -- GlasVolumen := Autolaenge;
   -- GlasVolumen := Laufstrecke;
 
end g33typvertraeglichkeit;

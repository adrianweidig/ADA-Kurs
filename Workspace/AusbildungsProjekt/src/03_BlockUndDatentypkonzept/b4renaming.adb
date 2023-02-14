with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure b4renaming is
   
   -- Erklaeren (Falls nicht schon geschehen), dass ein Initialwert moeglich ist
   -- fuer den Fall, dass im Parameter kein Wert uebergeben wird.
   procedure hochzaehlen ( Zahl : in out Integer; Wert : in Integer := 50) is
   begin
      Zahl := Zahl + Wert;
      Put(Zahl);
   end hochzaehlen;
   
   -- Das Renaming von Prozeduren erlaubt es auch im Nachhinein diese Initialwerte
   -- zu veraendern. Somit ist auch eine kuerzere Schreibweise moeglich, sollte man
   -- das Unterprogramm mehrmals aufrufen und die gleichen Eingabeparameter nutzen
   -- wollen.
   procedure plusEins (Zahl : in out Integer; Wert : in Integer := 1) renames hochzaehlen;
  
   Zahl : Integer; -- 0 / not initialized
   
begin
   
   -- Standardwert 50
   hochzaehlen(Zahl); -- Zahl = 0 / N.I. + Wert = 50
   
   -- Standardwert 1
   plusEins(Zahl); -- Zahl = 50 + Wert = 1
   
end b4renaming;

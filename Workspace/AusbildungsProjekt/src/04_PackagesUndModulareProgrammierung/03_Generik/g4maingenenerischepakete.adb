with g4GenerischesPaket, g4LeeresGenerischesPaket;

-- Generische Pakete sind in der use Klausel nicht erlaubt
-- Logisch, da diese immer ausgepraegt werden muessen.
-- use g4GenerischesPaket;

procedure g4MainGenenerischePakete is
   
   Zahl : Integer := 50;
   
   -- Auspraegen des Paketes
   -- Dies sorgt dafuer, dass die Inhalte des Paketes ihr entsprechenden Werte erhalten
   -- und diese nutzen
   package Integer_Generik is new g4GenerischesPaket(Welcher_Typ   => Integer,
                                                     InhaltsObjekt => Zahl);
   
   -- Das bedeutet ebenfalls, dass ich je nach Angaben meiner generischen Parameter
   -- das Paket und deren Inhalte mehrfach, getrennt von anderen Package Auspraegungen
   -- nutzen kann.
   package LeeresPaket1 is new g4LeeresGenerischesPaket;
   
   package LeeresPaket2 is new g4LeeresGenerischesPaket;
   
   -- Anschliessend kann ich die inneren Inhalte ueber den Zugriff auf das ausgepraegte Paket
   -- weiter auspraegen um diese letztendlich zu nutzen.
   procedure Integer_Rueckgabe is new Integer_Generik.Rueckgabe(Als_String => Integer'Image);
   
begin
   ---- Leeres Paket
   LeeresPaket1.Zahl := 10;
   
   LeeresPaket1.Ausgabe;
   
   LeeresPaket2.Zahl := 50;
   
   LeeresPaket2.Ausgabe;
   
   
   ---- Befuelltes Paket
   Integer_Rueckgabe; -- Initalwert 50
   
   Zahl := 10;
   
   Integer_Rueckgabe; -- Bei in out 10 sonst 50
   
   Zahl := 40;
   
   Integer_Rueckgabe; -- Bei in out 40 sonst 50
end g4MainGenenerischePakete;

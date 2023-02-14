-- Quasi wie ein Import aus anderen Sprachen. Jedoch muss bei der reinen 
-- Verwendung von with dieser Import immer extra explizit mit angegeben
-- werden. (Vollqualifizierung)

-- Um dies zu umgehen und quasi den bekannten Import zu nutzen kann man 
-- zusaetzlich use Ada.Text_IO; verwenden.

-- ACHTUNG: 
-- Wenn nur Text_IO genutzt wird sind Inhalte von Ada. nicht ersichtlich
-- "not visible". Dies macht sich erst bei generischer Auspraegung bemerkbar.
with Ada.Text_IO;

-- Bezeichnet quasi unsere "Klasse" als G1helloworld
procedure G1helloworld is
   
-- Der Beginn aller Anweisungen dieser Klasse
begin
   
   -- Unter Nutzung des Imports Ada.Text_IO wird der Text
   -- Hello World! ausgegeben. Wenn with ... nicht genutzt
   -- worden waere wuerde ein "not visible" Fehler erscheinen.
   
   -- Nutzt man use, kann man auf Ada.Text_IO als Vorhang
   -- verzichten.
   Ada.Text_IO.Put_Line("Hello World!");
   
-- Das angegebene Ende der Anweisungen
end G1helloworld;

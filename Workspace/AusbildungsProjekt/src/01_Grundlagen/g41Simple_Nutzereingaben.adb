with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

-- Die Nutzung der XXX_Text_IO packages als direkten Import
-- dient der Ein- und Ausgabe der simplen Werte OHNE naehere
-- Behandlung des einzugebenden Typs.
-- Dies bietet sich fuer simple Anweisungen an. Besser ist es
-- jedoch unter Zuhilfenahme generischer Auspraegung einen
-- klar definierten Typ zu nutzen durch den die Nutzereingaben
-- klar geregelt sind und lediglich die Falscheingabe abgefangen
-- werden muss.
procedure g41Simple_Nutzereingaben is
   
   A : Integer;
   B : Float;
   
   
begin
   -- Eingaben. Die richtige Get Funktion
   -- wird anhand des zugehoerigen Datentyps gesucht.
   -- ACHTUNG:
   -- Falsche Nutzereingaben werfen einen Fehler
   Get(A); -- Erwartet Ganzzahl als Eingabe (Float auch moeglich wird dann aber auf Integer gerundet)
   Get(B); -- Erwartet Ganzzahl als Eingabe (Integer auch moeglich wird dann als Float angezeigt)
   
   -- Simple Ausgabe
   Put(A); 
   New_Line;
   Put(B);
end g41Simple_Nutzereingaben;

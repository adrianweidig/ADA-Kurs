-- Implementierung der Methoden
-- Hierbei ist zu beachten, dass im nicht sichtbaren Bereich (Body)
-- die Zugriffszahl initialisiert wird und somit ein Objekt davon
-- im Speicher registriert ist. Alle Referenzen auf das Objekt sind
-- somit immer auf "Die_Zahl"
package body p4singleton is

   --------------
   -- Set_Zahl --
   --------------

   procedure Set_Zahl (Zahl : Integer) is
   begin
      EinzigeInstanz.Inhalt := Zahl;
   end Set_Zahl;

   --------------
   -- Get_Zahl --
   --------------

   function Get_Zahl return Integer is
   begin
      return EinzigeInstanz.Inhalt;
   end Get_Zahl;


end p4singleton;

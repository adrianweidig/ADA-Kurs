with Ada.Text_IO, Ada.Strings.Unbounded, O4Datenkapselung;

use Ada.Text_IO, Ada.Strings.Unbounded, O4Datenkapselung;

procedure O4MainDatenkapselung is

   -- Ist nicht moeglich, da private
   -- Taube : Tier := (True, "Taube");
    Taube : Tier;

begin
   -- Nicht moeglich. Vorinitialisierte private Werte
   -- einer Klasse koennen von einem Objekt nicht
   -- per Direktzugriff geaendert werden.

   -- Taube.Lebendig := False;
   --  Taube.Bezeichnung := To_Unbounded_String("Taube");

   -- Ausgabe der aktuellen Inhalte
   Put_Line(Boolean'Image(Taube.getLebendig));
   Put_Line(Taube.getBezeichnung); --> Tier, da nicht veraendert

   -- Aenderung der Inhalte ueber Unterprogramme
   Taube.setLebendig(Ist_Lebendig => False);
   Taube.setBezeichnung(Tier_Bezeichnung => To_Unbounded_String("Tote Taube"));

   -- Ausgabe neuer Werte
   Put_Line(Boolean'Image(Taube.getLebendig));
   Put_Line(Taube.getBezeichnung);

end O4MainDatenkapselung;

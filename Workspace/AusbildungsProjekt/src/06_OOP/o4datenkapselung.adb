
package body O4Datenkapselung is

   -----------------
   -- setLebendig --
   -----------------

   procedure setLebendig ( Das_Tier : in out Tier ; Ist_Lebendig : Boolean) is
   begin
      Das_Tier.Lebendig := Ist_Lebendig;
   end setLebendig;

   --------------------
   -- setBezeichnung --
   --------------------

   procedure setBezeichnung ( Das_Tier : in out Tier ; Tier_Bezeichnung : Unbounded_String) is
   begin
      Das_Tier.Bezeichnung := Tier_Bezeichnung;
   end setBezeichnung;

end O4Datenkapselung;

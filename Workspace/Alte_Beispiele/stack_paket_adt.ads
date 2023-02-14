-- Spezifikationen fuer das Stack-Paket
-- Keller ausgelagert in Paket, wegen Wiederverwendbarkeit und Datenkapselung
package Stack_Paket_ADT is

   -- Typen
   type INDEX_T is range 0 .. 100;
   type KOMPONENT_T is range -100 .. 100;

   type KELLER (Laenge : INDEX_T ) is limited private;

   -- Unterprogramme
   procedure Push (In_den_Keller : in out KELLER; Das_Element : in KOMPONENT_T);
   procedure Pop (Aus_dem_Keller : in out KELLER; Das_Element : out KOMPONENT_T);
   function Ist_Leer (Der_Keller : in KELLER) return BOOLEAN;

   -- bei limited private
   procedure Zuweisung(Nach : out KELLER; Von : in KELLER);
   function "=" (Left, Right : in KELLER) return Boolean;

   -- Ausnahmen
   Keller_Ueberlauf, Keller_Unterlauf : Exception;

private

   -- Abstrakter Daten Typen
   type KELLER_TA is array (INDEX_T range <>) of KOMPONENT_T;
   type KELLER (Laenge : INDEX_T) is record
      Int_Keller : KELLER_TA (1 .. Laenge) := (others => 0);
      Zeiger     : INDEX_T                 := 0;
   end record;

end Stack_Paket_ADT;

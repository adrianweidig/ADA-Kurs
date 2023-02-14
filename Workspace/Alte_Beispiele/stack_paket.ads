-- Spezifikationen fuer das Stack-Paket
-- Keller ausgelagert in Paket, wegen Wiederverwendbarkeit
package Stack_Paket is

   -- Typen
   type INDEX_T is range 0 .. 100;
   type KOMPONENT_T is range -100 .. 100;
   type KELLER_TA is array (INDEX_T range <>) of KOMPONENT_T;
   type KELLER_TR (Laenge : INDEX_T) is record
      Int_Keller : KELLER_TA (1 .. Laenge) := (others => 0);
      Zeiger     : INDEX_T                 := 0;
   end record;

   -- Unterprogramme
   procedure Push (In_den_Keller : in out KELLER_TR; Das_Element : in KOMPONENT_T);
   procedure Pop (Aus_dem_Keller : in out KELLER_TR; Das_Element : out KOMPONENT_T);
   function Ist_Leer (Der_Keller : in KELLER_TR) return Boolean;

   -- Ausnahmen
   Keller_Ueberlauf, Keller_Unterlauf : Exception;

   -- Objekte
   Globaler_Keller : KELLER_TR (10);

end Stack_Paket;

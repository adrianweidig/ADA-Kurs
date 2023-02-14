-- Spezifikationen fuer das Stack-Paket
-- Keller ausgelagert in Paket, wegen Wiederverwendbarkeit und Datenkapselung
------------------------------------------------------------------------------
generic
--   Leer
package Stack_Paket_ADO_Gen is
   -- Konstanten

   -- Typen
   type KOMPONENT_T is range -100 .. 100;

   -- Unterprogramme
   procedure Push (Das_Element : in KOMPONENT_T);
   procedure Pop (Das_Element : out KOMPONENT_T);
   function Ist_Leer return BOOLEAN;

   -- Ausnahmen
   Keller_Ueberlauf, Keller_Unterlauf : Exception;

private

    -- Typen
   type INDEX_T is range 0 .. 100;
   type KELLER_TA is array (INDEX_T range <>) of KOMPONENT_T;

   type KELLER_TR (Laenge : INDEX_T) is record
      Int_Keller : Keller_TA (1 .. Laenge) := (others => 0);
      Zeiger     : INDEX_T                 := INDEX_T'First;
   end record;

   -- Abstraktes Daten Objekte ADO
   Globaler_Keller : KELLER_TR(10);

end Stack_Paket_ADO_Gen;

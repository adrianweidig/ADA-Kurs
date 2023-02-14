-- Spezifikationen fuer das Stack-Paket
-- Keller ausgelagert in Paket, wegen Wiederverwendbarkeit und Datenkapselung
package Stack_Paket_ADO is
   -- Konstanten

   -- Typen
   type Komponent_T is range -100 .. 100;

   -- Unterprogramme
   procedure Push (Das_Element : in Komponent_T);
   procedure Pop (Das_Element : out Komponent_T);
   function Ist_Leer return Boolean;

   -- Ausnahmen
   Keller_Ueberlauf, Keller_Unterlauf : Exception;

private

    -- Typen
   type Index_T is range 0 .. 100;
   type Keller_TA is array (Index_T range <>) of Komponent_T;

   type Keller_TR (Laenge : Index_T) is record
      Int_Keller : Keller_TA (1 .. Laenge) := (others => 0);
      Zeiger     : Index_T                 := 0;
   end record;

   -- Abstraktes Daten Objekte ADO
   Globaler_Keller : Keller_TR(10);

end Stack_Paket_ADO;

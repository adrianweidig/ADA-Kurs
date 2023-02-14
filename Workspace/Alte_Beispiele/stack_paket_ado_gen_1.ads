-- Spezifikationen fuer das Stack-Paket
-- Keller ausgelagert in Paket, wegen Wiederverwendbarkeit und Datenkapselung
-----------------------------------------------------------------------------
generic
   type KOMPONENTE is private;
   InitWert : in KOMPONENTE;
package Stack_Paket_ADO_Gen_1 is
   -- Konstanten

   -- Typen


   -- Unterprogramme
   procedure Push (Das_Element : in KOMPONENTE);
   procedure Pop (Das_Element : out KOMPONENTE);
   function Ist_Leer return BOOLEAN;

   -- Ausnahmen
   Keller_Ueberlauf, Keller_Unterlauf : Exception;

private

    -- Typen
   type INDEX_T is range 0 .. 100;
   type KELLER_TA is array (INDEX_T range <>) of KOMPONENTE;

   type KELLER_TR (Laenge : INDEX_T) is record
      Int_Keller : KELLER_TA (1 .. Laenge) := (others => InitWert);
      Zeiger     : INDEX_T                 := INDEX_T'First;
   end record;

   -- Abstraktes Daten Objekte ADO
   Globaler_Keller : KELLER_TR(10);

end Stack_Paket_ADO_Gen_1;

with Ada.Text_IO;

package body Stack_Paket_ADO_Gen_Schleife is

   ----------
   -- Push --
   ----------

   procedure Push (Das_Element : in KOMPONENTE) is
   begin
      If Globaler_Keller.Zeiger < Globaler_Keller.Int_Keller'Last then
         Globaler_Keller.Zeiger := Globaler_Keller.Zeiger + 1;
         Globaler_Keller.Int_Keller(Globaler_Keller.Zeiger) := Das_Element;
      else
         raise Keller_Ueberlauf;
      end if;
   end Push;

   ---------
   -- Pop --
   ---------

   procedure Pop (Das_Element : out KOMPONENTE) is
   begin
     if not Ist_Leer then
         Das_Element := Globaler_Keller.Int_Keller(Globaler_Keller.Zeiger);
         Globaler_Keller.Zeiger := Globaler_Keller.Zeiger - 1;
      else
         raise Keller_Unterlauf;
      end if;
   end Pop;

   --------------
   -- Ist_Leer --
   --------------

   function Ist_Leer return BOOLEAN is
   begin
	return Globaler_Keller.Zeiger = 0;
   end Ist_Leer;


   -- generische Schleife, alle Elemente des Keller besuchen
   procedure Fuer_Alle_Elemente is

   begin
      Ada.Text_IO.Put_Line("Paket: Alle Elemente des Kellers besuchen ..");
      for Index in Globaler_Keller.Int_Keller'First .. Globaler_Keller.Zeiger loop
      	Aktion(Globaler_Keller.Int_Keller(Index));
      end loop;

   end Fuer_Alle_Elemente;

   function Summe_Alle_Elemente return KOMPONENTE is
	erg : KOMPONENTE := init;
   begin
      Ada.Text_IO.Put_Line("Paket: Alle Elemente des Kellers summieren ..");
      for Index in Globaler_Keller.Int_Keller'First .. Globaler_Keller.Zeiger loop
      	erg := Aktion(Globaler_Keller.Int_Keller(Index), erg);
      end loop;
	return erg;
   end Summe_Alle_Elemente;
end Stack_Paket_ADO_Gen_Schleife;

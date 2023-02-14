package body Stack_Paket_ADO_Gen is

   ----------
   -- Push --
   ----------

   procedure Push (Das_Element : in KOMPONENT_T) is
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

   procedure Pop (Das_Element : out KOMPONENT_T) is
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

end Stack_Paket_ADO_Gen;

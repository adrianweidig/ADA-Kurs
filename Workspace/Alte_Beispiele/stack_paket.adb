package body Stack_Paket is

   ----------
   -- Push --
   ----------

   procedure Push (In_den_Keller : in out KELLER_TR; Das_Element : in KOMPONENT_T) is
   begin
      If In_den_Keller.Zeiger < In_den_Keller.Int_Keller'Last then
         In_den_Keller.Zeiger := In_den_Keller.Zeiger + 1;
         In_den_Keller.Int_Keller(In_den_Keller.Zeiger) := Das_Element;
      else
         raise Keller_Ueberlauf;
      end if;
   end Push;

   ---------
   -- Pop --
   ---------

   procedure Pop (Aus_dem_Keller : in out KELLER_TR; Das_Element : out KOMPONENT_T) is
   begin
      if not Ist_Leer(Aus_dem_Keller) then
         Das_Element := Aus_dem_Keller.Int_Keller(Aus_dem_Keller.Zeiger);
         Aus_dem_Keller.Zeiger := Aus_dem_Keller.Zeiger - 1;
      else
         raise Keller_Unterlauf;
      end if;
   end Pop;

   --------------
   -- Ist_Leer --
   --------------

   function Ist_Leer (Der_Keller : in KELLER_TR) return Boolean is
   begin
      return Der_Keller.Zeiger = 0;
   end Ist_Leer;

end Stack_Paket;

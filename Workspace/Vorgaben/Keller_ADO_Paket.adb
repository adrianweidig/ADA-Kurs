package body Keller_ADO_Paket is


   --  UNTERPROGRAMME
   procedure Push (Wert : in ELEMENT) is
   begin
      if Keller.Zeiger > Groesse then
         raise Ueberlauf;
      else
         Keller.Eintraege (Keller.Zeiger) := Wert;
         Keller.Zeiger                    := Keller.Zeiger + 1;
      end if;
   end Push;

   function Pop return ELEMENT is
   begin
      if Keller.Zeiger = 1 then
	 raise Unterlauf;

      else
         Keller.Zeiger := Keller.Zeiger - 1;
      end if;
      return Keller.Eintraege (Keller.Zeiger);
   end Pop;

   function Is_Empty return Boolean is
   begin
      return Keller.Zeiger = 1;
   end Is_Empty;
end Keller_ADO_Paket;

generic
   type ELEMENT is private;
   Groesse : Positive;
package Keller_ADO_Paket is

   procedure Push (Wert : in ELEMENT);
   function Pop return ELEMENT;
   function Is_Empty return Boolean;

   Unterlauf, Ueberlauf : exception;
   private
   
   --  TYPEN
   type REIHE_T is array (1 .. Groesse) of ELEMENT;
   type KELLER_T is record
      Eintraege : REIHE_T;
      Zeiger    : Natural := 1;
   end record;

   --  OBJEKTE
   Keller : KELLER_T;   
   
end Keller_ADO_Paket;
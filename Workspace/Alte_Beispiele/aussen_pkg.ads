package Aussen_Pkg is

   subtype STRING_5_TA is STRING(1..5);
   -- eingebettetes Paket
   package Innen_Pkg is
      Anrede : constant STRING_5_TA := "Hallo";
   end Innen_Pkg;

   function GebeNamen return STRING;

   -- Ueberschrift : STRING_5_TA := Anrede;  - geht so nicht!
   Ueberschrift : STRING_5_TA := Innen_Pkg.Anrede;
private
   type WERTE_T is range 0 ..23;

   Test : INTEGER := 0;
end Aussen_Pkg;

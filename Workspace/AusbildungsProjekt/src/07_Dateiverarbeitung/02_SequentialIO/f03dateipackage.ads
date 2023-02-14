package F03DateiPackage is

   type Lebewesen is tagged null record;
   
   type Vogel is new Lebewesen with record
      Bezeichnung : String (1..10);
   end record;

end F03DateiPackage;

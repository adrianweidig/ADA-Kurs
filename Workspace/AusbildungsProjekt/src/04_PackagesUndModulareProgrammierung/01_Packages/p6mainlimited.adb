with P6LimitedPackage, Ada.Text_IO; use P6LimitedPackage;
procedure P6MainLimited is
   S1, S2 : Stack ;
begin
   Reinlegen(EinStack => S1,
             Inhalt   => S2);
   
   --  Reinlegen(EinStack => S2,
   --            Inhalt   => 20);
   
   Auslesen(S1);
   
   Auslesen(S2);
   
--   S1 := 10;
end P6MainLimited;

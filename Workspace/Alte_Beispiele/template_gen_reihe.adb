with Ada.Text_IO;

procedure Template_Gen_Reihe is

   -- Tpyen
   type PERSON_TR is record
      Name : STRING(1..10) := (others => ' ');
      Gehalt : INTEGER := 0;
   end record;

   -- -- Indextyp
   subtype GROESSE_T is INTEGER range 1 .. 10;
   -- -- Komponententyp => INTEGER
   -- Reihungstyp
   type INTEGER_REIHE_TA is array (GROESSE_T range <>) of INTEGER;

   type PERSONEN_TA is array(GROESSE_T range <>) of PERSON_TR;
 -- -- generisches Paket
   package I_IO is new Ada.Text_IO.Integer_IO (INTEGER);

   function "<" (A,B: PERSON_TR) return BOOLEAN;
   function "<" (A,B: PERSON_TR) return BOOLEAN is

   begin
   	return A.Gehalt < B.Gehalt;
   end "<";

   procedure Ausgabe(Person : in PERSON_TR);
   procedure Ausgabe(Person : in PERSON_TR) is
   begin
      Ada.Text_IO.Put(Person.Name & " ");
      I_IO.Put(Person.Gehalt, 5);
      Ada.Text_IO.New_Line;
   end Ausgabe;


--     generic
--        type INDEX_T is (<>);
--        type REIHE_TA is array (INDEX_T) of INTEGER;
--     function Sort( Wert : in INTEGER) return REIHE_TA;
--
--     function Sort( Wert : in INTEGER) return REIHE_TA is
--        Reihe : REIHE_TA := (others => 0);
--     begin
--        return Reihe;
--     end Sort;
--
--     type INT_REIHE_TA is array ( GROESSE_T range <>) of INTEGER;
--
--     subtype INDEX_GRO_T is GROESSE_T range 1..4;
--     subtype REIHE_1_TA is INT_REIHE_TA(INDEX_GRO_T);

   -- auspraegen der generischen Funktion
--   function Int_Reihe is new Sort(INDEX_GRO_T , REIHE_1_TA);


   generic
--	type ELEMENT_T is range <>;
      type ELEMENT_T is private;
      InitWert : in  ELEMENT_T;  -- out-Modus nicht moeglich nur in out!
      type INDEX_T is (<>);
      type REIHE_TA is array (INDEX_T range <>) of ELEMENT_T;
      with function "<" (A,B: ELEMENT_T) return BOOLEAN;
   function Min (R : in REIHE_TA) return ELEMENT_T;

   function Min (R : in REIHE_TA) return ELEMENT_T is
--      Erg  : ELEMENT_T := ELEMENT_T'Last;
       Erg  : ELEMENT_T := InitWert; -- oder mit dem ersten Element der Reihe
   begin

      for I in R'Range loop
         if R(I) < Erg  then
            Erg := R(I);
         end if;
      end loop;
      return Erg;
   end Min;

   -- generische Programmeinheiten auspraegen
   -- generische Funktion
   function Min_Int is new Min (ELEMENT_T => Integer,
                                InitWert => Integer'Last,
      				   INDEX_T => GROESSE_T,
				         REIHE_TA => INTEGER_REIHE_TA,
			              "<" => Standard.">");

--     function Min_Person is new Min(Element_T => PERSON_TR,
--                                    InitWert => ("1234567890", INTEGER'LAST),
--                                    INDEX_T => GROESSE_T,
--                                    REIHE_TA => PERSONEN_TA,
--                                    "<"       => "<");


   -- Variablen
   Objekt_Reihe : INTEGER_REIHE_TA := (1, 5, 66, 77, 88, 11, 2, 3, 4, 10);
   Personen_Reihe : PERSONEN_TA := (("HuberHuber", 200), ("MaierMaier",1000));

   Person : PERSON_TR;

begin
   I_IO.Put(Min_Int(Objekt_Reihe),3);
   Ada.Text_IO.New_Line;
--   Person := Min_Person(Personen_Reihe);
--   Ausgabe(Min_Person(Personen_Reihe));

end Template_Gen_Reihe;

with Ada.Text_IO;
with Stack_Paket_ADO_Gen_1; -- use Stack_Paket_ADO_Gen_1; nicht moeglich !!

procedure Main_Stack_Paket_ADO_Gen_1 is

   -- Typen
   type ELEMENT_T is range -100 .. 100;

   subtype STRING_10 is STRING(1..10);
   -- generische Programmeinheiten auspraegen

   -- generische Pakete
   package Keller_1_Ado_Gen is new Stack_Paket_Ado_Gen_1(ELEMENT_T, 0);

   -- Test mit beschraenkten String
   package Keller_2_Ado_Gen is new Stack_Paket_Ado_Gen_1(STRING_10, "          ");

   -- Unterprogramme
   -- -- Spezifikationen
   generic
      type KOMPONENTE_T is private;
      InitWert : in KOMPONENTE_T;
      with function Ist_Leer return Boolean;
      with procedure Pop(Das_Element : out KOMPONENTE_T);
      with procedure Ausgabe_Komponente(Wert : in KOMPONENTE_T);
   procedure Ausgabe_Keller;

   -- generische Prozedur zur Ausgabe von Ganzzahltypen
   generic
      type KOMPONENTE_T is range <>;
   procedure Ausgabe_Komponente(Wert : in KOMPONENTE_T );


   -- -- Bodies
   procedure Ausgabe_Komponente(Wert : in KOMPONENTE_T ) is
      -- Pakete auspraegen
      package I_IO is new Ada.Text_IO.Integer_IO(KOMPONENTE_T);
   begin

      I_IO.Put(Wert,3);
      Ada.Text_IO.New_Line;

   end Ausgabe_Komponente;


   -- generische Prozedur
   procedure Ausgabe_Komponente_1 is new Ausgabe_Komponente(KOMPONENTE_T => ELEMENT_T );


   -- Ausgabe des Kellers ist nur noch mit gleichzeitigem Auslesen moeglich!
   -- Der Keller ist danach leer!
   procedure Ausgabe_Keller is
      Element : Komponente_T := InitWert;
   begin

      Ada.Text_IO.Put_Line("Die Groesse des Kellers ist nicht bekannt!");
      Ada.Text_IO.Put_Line("Die aktuelle Index-Position des Kellers ist nicht bekannt!");
      Ada.Text_IO.New_Line;

      if Ist_Leer then
         Ada.Text_IO.Put_Line("Der Keller ist leer");
      else

         while not Ist_Leer loop
            Pop(Das_Element => Element);
            Ausgabe_Komponente(Wert => Element);
         end loop;

      end if;

   end Ausgabe_Keller;

   -- generische Prozedure auspraegen
   procedure Ausgabe_Keller_1 is new Ausgabe_Keller(KOMPONENTE_T => ELEMENT_T,
						    InitWert => 0,
                                                    Ist_Leer => Keller_1_Ado_Gen.Ist_Leer,
                                                    Pop => Keller_1_Ado_Gen.Pop,
                                                    Ausgabe_Komponente => Ausgabe_Komponente_1);
   -- Variablen
   Wert_1 : ELEMENT_T := -10;


begin

   Ada.Text_IO.Put_Line("Arbeiten mit einem generischen globalen Kellerobjekt.");
   Ada.Text_IO.New_Line;
   -- arbeiten mit einem generischen globalen Kellerobjekt
   Keller_1_Ado_Gen.Push(5);
   Keller_1_Ado_Gen.Push(Wert_1);
   Wert_1 := 20;
   Keller_1_Ado_Gen.Push(Wert_1);

   Ausgabe_Keller_1;

   -- Manipulation der aktuellen Index-Position des Kellers nicht mehr moeglich

   Ausgabe_Keller_1;

   Keller_1_Ado_Gen.Push(Wert_1);
   Wert_1 := 50;
   Keller_1_Ado_Gen.Push(Wert_1);
   Wert_1 := 1;

   Keller_1_Ado_Gen.Pop(Wert_1);
   Ausgabe_Komponente_1(Wert_1);

   Ausgabe_Keller_1;

   ------------------------------------------------------------------------------------
   -- arbeiten mit einem anderen generischen globalen Kellerobjekt
   -------------------------------------------------------------------------------------
   Anderer_Keller:
   declare

      -- generisches Pakete auspraegen
      package Keller_2_Ado_Gen is new Stack_Paket_Ado_Gen_1(NATURAL, 0);

      -- -- generische Prozeduren auspraegen
      procedure Ausgabe_Komponente_2 is new Ausgabe_Komponente(KOMPONENTE_T => NATURAL);

      -- Variablen
      Wert_2 : NATURAL    := 100;

   begin
      Ada.Text_IO.Put_Line("Arbeiten mit einem anderen generischen globalen Kellerobjekt.");
      Ada.Text_IO.New_Line;

      Keller_2_Ado_Gen.Push(40);
      Keller_2_Ado_Gen.Pop(Wert_2);
      Ausgabe_Komponente_2(Wert_2);
   end Anderer_Keller;

end Main_Stack_Paket_ADO_Gen_1;

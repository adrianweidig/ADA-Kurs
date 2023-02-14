with Ada.Text_IO;
with Stack_Paket_ADO_Gen; -- use Stack_Paket_ADO_Gen; nicht moeglich !!

procedure Main_Stack_Paket_ADO_Gen is

   -- generische Programmeinheiten auspraegen
   -- -- generische Pakete
   package Keller_1_Ado_Gen is new Stack_Paket_Ado_Gen;

   -- Unterprogramme
   -- -- Spezifikationen
   procedure Ausgabe_Keller_1;

   generic
      type KOMPONENTE_T is range <>;
   procedure Ausgabe_Komponente(Wert : in KOMPONENTE_T );

   -- -- Bodies
   procedure Ausgabe_Komponente(Wert : in KOMPONENTE_T ) is
      -- Pakete auspraegen
      package I_IO is new Ada.Text_IO.Integer_IO(KOMPONENTE_T);
   begin

      I_IO.Put(Wert);
      Ada.Text_IO.New_Line;

   end Ausgabe_Komponente;


   -- -- generische Prozeduren auspraegen
   procedure Ausgabe_Komponente_1 is new Ausgabe_Komponente(KOMPONENTE_T => Keller_1_Ado_Gen.Komponent_T );


   -- Ausgabe des Kellers ist nur noch mit gleichzeitigem Auslesen moeglich!
   -- Der Keller ist danach leer!
   procedure Ausgabe_Keller_1 is
      Element : Keller_1_Ado_Gen.Komponent_T := 0;
   begin

      Ada.Text_IO.Put_Line("Die Groesse des Kellers ist nicht bekannt!");
      Ada.Text_IO.Put_Line("Die aktuelle Index-Position des Kellers ist nicht bekannt!");
      Ada.Text_IO.New_Line;

      -- Nutzung generisches Paket
      if Keller_1_Ado_Gen.Ist_Leer then
         Ada.Text_IO.Put_Line("Der Keller ist leer");
      else

         while not Keller_1_Ado_Gen.Ist_Leer loop
            Keller_1_Ado_Gen.Pop(Das_Element => Element);
            -- Nutzung generischer Prozedur
            Ausgabe_Komponente_1(Wert => Element);
         end loop;

      end if;

   end Ausgabe_Keller_1;


   -- Variablen
   -- -- Typ ist vom generischen Paket
   Wert_1 : Keller_1_Ado_Gen.Komponent_T := 10;

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
      package Keller_2_Ado_Gen is new Stack_Paket_Ado_Gen;

      -- -- generische Prozeduren auspraegen
      procedure Ausgabe_Komponente_2 is new Ausgabe_Komponente(KOMPONENTE_T => Keller_2_Ado_Gen.Komponent_T );

      -- Variablen
      -- -- Typ ist vom generischen Paket
      Wert_2 : Keller_2_Ado_Gen.Komponent_T := 50;

   begin
      Ada.Text_IO.Put_Line("Arbeiten mit einem anderen generischen globalen Kellerobjekt.");
      Ada.Text_IO.New_Line;

      Keller_2_Ado_Gen.Push(40);
      Keller_2_Ado_Gen.Pop(Wert_2);
      Ausgabe_Komponente_2(Wert_2);
   end Anderer_Keller;

end Main_Stack_Paket_ADO_Gen;

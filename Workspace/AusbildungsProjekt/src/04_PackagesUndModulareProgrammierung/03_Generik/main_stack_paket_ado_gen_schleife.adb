with Ada.Text_IO;
with Stack_Paket_ADO_Gen_Schleife; -- use Stack_Paket_ADO_Gen_Schleife; nicht moeglich !!

procedure Main_Stack_Paket_ADO_Gen_Schleife is

   -- Typen
   type KOMPONENT_T is range -100 .. 100;

   -- generische Programmeinheiten auspraegen

   -- generische Pakete
   package Keller_1_Ado_Gen is new Stack_Paket_Ado_Gen_Schleife(KOMPONENT_T, 0);


   -- Unterprogramme
   -- -- Spezifikationen
   procedure Ausgabe_Keller_1;


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

   -----------

   function Ausgabe_Summe_Zahl is new Keller_1_Ado_Gen.Summe_Alle_Elemente("+",0);

   -----------

   -- generische Prozedur
   procedure Ausgabe_Komponente_1 is new Ausgabe_Komponente(KOMPONENTE_T => KOMPONENT_T );


   -- generische Schleife auspraegen, ohne die Elemente des Kellers zu loeschen !!
   procedure Ausgabe_Keller1 is new Keller_1_Ado_Gen.Fuer_Alle_Elemente(Aktion =>Ausgabe_Komponente_1);


   -- Ausgabe des Kellers ist nur noch mit gleichzeitigem Auslesen moeglich!
   -- Der Keller ist danach leer!
   procedure Ausgabe_Keller_1 is
      Element : Komponent_T := 0;
   begin

      Ada.Text_IO.Put_Line("Folgende Inhalte befinden sich im Keller: ");
      Ada.Text_IO.New_Line;

      if Keller_1_Ado_Gen.Ist_Leer then
         Ada.Text_IO.Put_Line("Der Keller ist leer");
      else

         while not Keller_1_Ado_Gen.Ist_Leer loop
            Ada.Text_IO.Put("Pop => ");
            Keller_1_Ado_Gen.Pop(Das_Element => Element);
            Ausgabe_Komponente_1(Wert => Element);
         end loop;

      end if;

   end Ausgabe_Keller_1;


   -- Variablen
   Wert_1 : Komponent_T := -10;

begin
   Ada.Text_IO.New_Line(2);
   Ada.Text_IO.Put_Line("Arbeiten mit einem generischen globalen Kellerobjekt.");
   Ada.Text_IO.Put_Line("=====================================================");
   Ada.Text_IO.New_Line;
   -- arbeiten mit einem generischen globalen Kellerobjekt
   Keller_1_Ado_Gen.Push(5);
   Keller_1_Ado_Gen.Push(Wert_1);
   Wert_1 := 20;
   Keller_1_Ado_Gen.Push(Wert_1);

   Ada.Text_IO.Put("Summe" & Komponent_T'Image(Ausgabe_Summe_Zahl));
   -- Aufruf der generischen Schleife
   Ausgabe_Keller1;

   Ausgabe_Keller_1;

   Ausgabe_Keller_1;

   Keller_1_Ado_Gen.Push(Wert_1);
   Wert_1 := 50;
   Keller_1_Ado_Gen.Push(Wert_1);
   Wert_1 := 1;

   Keller_1_Ado_Gen.Pop(Wert_1);
   Ausgabe_Komponente_1(Wert_1);

   Ausgabe_Keller_1;

   Ada.Text_IO.Put("Summe" & Komponent_T'Image(Ausgabe_Summe_Zahl));


   ------------------------------------------------------------------------------------
   -- arbeiten mit einem anderen generischen globalen Kellerobjekt
   -------------------------------------------------------------------------------------
   Anderer_Keller:
   declare

      Anzahl_Elemente : NATURAL := 0;

      -- generisches Pakete auspraegen
      package Keller_2_Ado_Gen is new Stack_Paket_Ado_Gen_Schleife(NATURAL, 0);

      -- Unterprogramme
      -- -- Spezifikationen
      procedure Anzahl_Komponenten_2(Element : in NATURAL);
      procedure Push (Das_Element : in NATURAL);
      procedure Pop (Das_Element : out NATURAL);

      -- -- Bodies
      procedure Anzahl_Komponenten_2(Element : in NATURAL) is
      begin
         Anzahl_Elemente := Anzahl_Elemente + 1;
      end Anzahl_Komponenten_2;

      -- -- generische Prozeduren auspraegen
      procedure Ausgabe_Komponente_2 is new Ausgabe_Komponente(KOMPONENTE_T => NATURAL);

      procedure Push (Das_Element : in NATURAL) is
      begin
         Ada.Text_IO.Put("Keller 2: Push => ");
         Ausgabe_Komponente_2(Das_Element);
         Keller_2_Ado_Gen.Push(Das_Element);
      end Push;

      procedure Pop (Das_Element : out NATURAL) is
      begin
         Ada.Text_IO.Put("Keller 2: Pop => ");
         Keller_2_Ado_Gen.Pop(Das_Element);
         Ausgabe_Komponente_2(Das_Element);
      end Pop;

      ---------------------------------------------------------------------------------------------------
      -- generische Schleife auspraegen, ohne die Elemente des Kellers zu loeschen !!
      -- Hinweis: Die Aktion muss nicht generisch sein, sondern nur die Signatur der Aktion erfuellen!
      ---------------------------------------------------------------------------------------------------
      procedure Ausgabe_Keller2 is new Keller_2_Ado_Gen.Fuer_Alle_Elemente(Aktion =>Ausgabe_Komponente_2);
      procedure Anzahl_Elemente_Keller2 is new Keller_2_Ado_Gen.Fuer_Alle_Elemente(Aktion =>Anzahl_Komponenten_2);

      -- Variablen
      Wert_2 : NATURAL    := 100;

   begin
      Ada.Text_IO.New_Line(2);
      Ada.Text_IO.Put_Line("Arbeiten mit einem anderen generischen globalen Kellerobjekt.");
      Ada.Text_IO.Put_Line("=============================================================");
      Ada.Text_IO.New_Line;
      -- arbeiten mit einem anderen generischen globalen Kellerobjekt
      Push(Wert_2);
      Push(40);

      ----------------------------------------------------------------------------------------
      -- Aufruf der generischen Schleife
      ----------------------------------------------------------------------------------------
      Anzahl_Elemente_Keller2;
      Ada.Text_IO.Put_Line("Anzahl Elemente im Keller 2: " & NATURAL'Image(Anzahl_Elemente));
      Ausgabe_Keller2;
      -----------------------------------------------------------------------------------------

      Ada.Text_IO.New_Line;
      Pop(Wert_2);

   end Anderer_Keller;

end Main_Stack_Paket_ADO_Gen_Schleife;

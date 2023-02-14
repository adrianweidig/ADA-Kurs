with Ada.Text_IO;
with Stack_Paket_ADO;

procedure Main_Stack_Paket_ADO is

   -- Variablen
   Wert : Stack_Paket_ADO.KOMPONENT_T := 10;

   -- Objekte
   -- Lokaler_Keller kann nicht mehr angelegt werden !!

   -- Unterprogramme
   -- -- Spezifikationen
   procedure Ausgabe_Keller;
   procedure Ausgabe_Komponente(Wert : in Stack_Paket_ADO.KOMPONENT_T );

   -- -- Bodies
   procedure Ausgabe_Komponente(Wert : in Stack_Paket_ADO.KOMPONENT_T ) is
      -- Pakete auspraegen
      package I_IO is new Ada.Text_IO.Integer_IO(Stack_Paket_ADO.KOMPONENT_T );
   begin

      I_IO.Put(Wert);
      Ada.Text_IO.New_Line;

   end Ausgabe_Komponente;

   -- Ausgabe des Kellers ist nur noch mit gleichzeitigem Auslesen moeglich!
   -- Der Keller ist danach leer!
   procedure Ausgabe_Keller is
      Element : Stack_Paket_ADO.KOMPONENT_T := 0;
   begin

      Ada.Text_IO.Put_Line("Die Groesse des Kellers ist nicht bekannt!");
      Ada.Text_IO.Put_Line("Die aktuelle Index-Position des Kellers ist nicht bekannt!");
      Ada.Text_IO.New_Line;

      if Stack_Paket_ADO.Ist_Leer then
         Ada.Text_IO.Put_Line("Der Keller ist leer");
      else

         while not Stack_Paket_ADO.Ist_Leer loop
            Stack_Paket_ADO.Pop(Das_Element => Element);
            Ausgabe_Komponente(Wert => Element);
         end loop;

      end if;

   end Ausgabe_Keller;

begin

      Ada.Text_IO.Put_Line("Arbeiten mit dem globalen Kellerobjekt.");
      Ada.Text_IO.New_Line;
      -- arbeiten mit dem globalen Kellerobjekt
      Stack_Paket_ADO.Push(5);
      Stack_Paket_ADO.Push(Wert);
      Wert := 20;
      Stack_Paket_ADO.Push(Wert);

      Ausgabe_Keller;

      -- Manipulation der aktuellen Index-Position des Kellers nicht mehr moeglich

      Ausgabe_Keller;

      Stack_Paket_ADO.Push(Wert);
      Wert := 50;
      Stack_Paket_ADO.Push(Wert);
      Wert := 1;

      Stack_Paket_ADO.Pop(Wert);
      Ausgabe_Komponente(Wert);

      Ausgabe_Keller;


end Main_Stack_Paket_ADO;

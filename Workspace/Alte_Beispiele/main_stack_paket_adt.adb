with Ada.Text_IO;
with Stack_Paket_ADT;

procedure Main_Stack_Paket_ADT is

   -- Konstanten
   Max_Elemente_Keller_1 : constant := 5;
   Max_Elemente_Keller_2 : constant := 10;

      -- Variablen
   Wert : Stack_Paket_ADT.KOMPONENT_T := 10;

   -- Objekte
   Lokaler_Keller_5,
   Lokaler_Keller_5_2  : Stack_Paket_ADT.KELLER (Max_Elemente_Keller_1);
   Lokaler_Keller_10   : Stack_Paket_ADT.KELLER (Max_Elemente_Keller_2);

   use type Stack_Paket_ADT.KELLER;

   -- Unterprogramme
   -- -- Spezifikationen
   procedure Ausgabe_Keller( Keller : in out Stack_Paket_ADT.KELLER);
   procedure Ausgabe_Komponente(Wert : in  Stack_Paket_ADT.KOMPONENT_T );

   -- -- Bodies

   procedure Ausgabe_Komponente(Wert : in Stack_Paket_ADT.KOMPONENT_T ) is
      -- Pakete auspraegen
      package I_IO is new Ada.Text_IO.Integer_IO(Stack_Paket_ADT.KOMPONENT_T );
   begin

      I_IO.Put(Wert);
      Ada.Text_IO.New_Line;

   end Ausgabe_Komponente;

   procedure Ausgabe_Keller( Keller : in out Stack_Paket_ADT.KELLER) is
      Element : Stack_Paket_ADT.KOMPONENT_T := 0;
   begin

      Ada.Text_IO.Put_Line("Die aktuelle Groesse des Kellers ist nicht bekannt" );
      Ada.Text_IO.Put_Line("Die aktuelle Index-Position des Kellers ist nicht bekannt ");

      if Stack_Paket_ADT.Ist_Leer(Keller) then
         Ada.Text_IO.Put_Line("Der Keller ist leer");
      else

         while not Stack_Paket_ADT.Ist_Leer(Der_Keller => Keller) loop
            Stack_Paket_ADT.Pop(Aus_dem_Keller => Keller, Das_Element => Element);
            Ausgabe_Komponente(Wert => Element);
         end loop;

      end if;
   end Ausgabe_Keller;

begin

      Ada.Text_IO.Put_Line("Arbeiten mit lokalen Kellerobjekt.");
      Ada.Text_IO.New_Line;
      -- arbeiten mit dem globalen Kellerobjekt
      Stack_Paket_ADT.Push(Lokaler_Keller_5, 5);
      Stack_Paket_ADT.Push(Lokaler_Keller_5, Wert);
      Wert := 20;
      Stack_Paket_ADT.Push(Lokaler_Keller_5, Wert);


      -- Manipulation der aktuellen Index-Position des Kellers nicht mehr moeglich
      -- Constraint_Error
      --Lokaler_Keller_10 := Lokaler_Keller_5;
      Ada.Text_IO.Put_Line("Zuweisung von Kellern");
   --Lokaler_Keller_5_2 := Lokaler_Keller_5; -- bei private
   -- bei limited private
      Stack_Paket_ADT.Zuweisung(Nach => Lokaler_Keller_5_2 ,
				        Von  => Lokaler_Keller_5);

      if Lokaler_Keller_5 = Lokaler_Keller_5_2 then
          Ada.Text_IO.Put_Line("Keller sind gleich!");
      else
          Ada.Text_IO.Put_Line("Keller sind ungleich!");
      end if;


      Ada.Text_IO.Put_Line("Ausgabe: Lokaler_Keller_5:");
      Ausgabe_Keller(Lokaler_Keller_5);

      Ada.Text_IO.Put_Line("Ausgabe: Lokaler_Keller_5_2:");
      Ausgabe_Keller(Lokaler_Keller_5_2);


      Ada.Text_IO.Put_Line("Arbeiten mit dem zweiten lokalem Kellerobjekt.");

      if Lokaler_Keller_5 = Lokaler_Keller_10 then
          Ada.Text_IO.Put_Line("Keller sind gleich!");
      else
          Ada.Text_IO.Put_Line("Keller sind ungleich!");
      end if;

      -- Arbeiten mit dem zweiten lokalem Kellerobjekt
      Stack_Paket_ADT.Push(Lokaler_Keller_10, Wert);
      Wert := 50;
      Stack_Paket_ADT.Push(Lokaler_Keller_10, Wert);
      Wert := 1;

      Stack_Paket_ADT.Pop(Lokaler_Keller_10, Wert);
      Ausgabe_Komponente(Wert);

      Ausgabe_Keller(Lokaler_Keller_10);

   -- fuehrt zu einer Exception
     Stack_Paket_ADT.Pop(Lokaler_Keller_5, Wert);



exception
      when Stack_Paket_ADT.Keller_Unterlauf =>
      Ada.Text_IO.Put_Line("Der Keller beinhaltet keine Daten!");

end Main_Stack_Paket_ADT;

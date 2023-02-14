with Ada.Text_IO;
with Stack_Paket;

procedure Main_Stack_Paket is

   use type Stack_Paket.INDEX_T;
   use type Stack_Paket.KOMPONENT_T;

   -- Pakete auspraegen
   package Index_IO is new Ada.Text_IO.Integer_IO(Stack_Paket.INDEX_T);
   package I_IO is new Ada.Text_IO.Integer_IO(INTEGER);
   package Element_IO is new Ada.Text_IO.Integer_IO(Stack_Paket.KOMPONENT_T);

   -- Objekte
   Lokaler_Keller : Stack_Paket.KELLER_TR (5);
   Element        : Stack_Paket.KOMPONENT_T := -100;

   -- Unterprogramme
   -- -- Spezifikationen
   procedure Ausgabe_Keller_Info( Keller : in Stack_Paket.KELLER_TR);
   procedure Ausgabe_Elemente( Keller : in Stack_Paket.KELLER_TR);
   procedure Push(Keller : in out Stack_Paket.KELLER_TR; Das_Element : in Stack_Paket.KOMPONENT_T);
   procedure IstKellerLeer(Keller : in Stack_Paket.KELLER_TR);

   -- -- Bodies
   procedure Ausgabe_Keller_Info( Keller : in Stack_Paket.KELLER_TR) is
   begin

      Ada.Text_IO.Put("Die Groesse des Kellers ist :");
      I_IO.Put(Keller.Int_Keller'Length,2);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put("Die aktuelle Index-Position des Kellers ist: ");
      Index_IO.Put(Keller.Zeiger,3);
      Ada.Text_IO.New_Line(2);

   end Ausgabe_Keller_Info;

   procedure Ausgabe_Elemente( Keller : in Stack_Paket.KELLER_TR) is
   begin
      Ada.Text_IO.Put("Inhalt des Kellers :");

      for I in Keller.Int_Keller'First .. Keller.Zeiger  loop
	Element_IO.Put(Keller.Int_Keller(I));
      end loop;

      Ada.Text_IO.New_Line(2);

   end Ausgabe_Elemente;

   procedure Push(Keller : in out Stack_Paket.KELLER_TR; Das_Element : in Stack_Paket.KOMPONENT_T) is
   begin
      	Ada.Text_IO.Put_line("Push => " & Stack_Paket.Komponent_T'Image(Das_Element));
        Stack_Paket.Push(In_den_Keller => Keller,
			 Das_Element   => Das_Element);

        Ausgabe_Keller_Info(Keller);
   end Push;

   procedure IstKellerLeer(Keller : in Stack_Paket.KELLER_TR) is
   begin
      if Stack_Paket.Ist_Leer(Der_Keller => Keller) then
	 Ada.Text_IO.Put_Line("Der Keller ist leer");
      else
	 Ada.Text_IO.Put_Line("Der Keller ist  n i c h t  leer");
      end if;
   end IstKellerLeer;

begin

   Ada.Text_IO.Put_Line("Arbeiten mit dem lokalen Kellerobjekt.");
   Ada.Text_IO.New_Line;

   Push(Keller => Lokaler_Keller,
        Das_Element   => Element);


   Push(Keller => Lokaler_Keller,
        Das_Element   => 20);


   Ausgabe_Elemente(Keller => Lokaler_Keller);


   Stack_Paket.Pop(Aus_dem_Keller => Lokaler_Keller,
		   Das_Element    => Element);

   Ada.Text_IO.Put_line("Pop <= " & Stack_Paket.Komponent_T'Image(Element));
   Ausgabe_Keller_Info(Lokaler_Keller);

   Modifikation_Lokaler_Keller:
   begin
      Ada.Text_IO.Put_Line(" Manipulation der aktuellen Index-Position des Kellers");
       -- Manipulation der aktuellen Index-Position des Kellers
      Lokaler_Keller.Zeiger := 3;
   end Modifikation_Lokaler_Keller;

   Ausgabe_Keller_Info(Lokaler_Keller);
   Ausgabe_Elemente(Keller => Lokaler_Keller);

   Globaler_Keller:
   begin

      Ada.Text_IO.Put_Line("Arbeiten mit dem globalen Kellerobjekt.");
      Ada.Text_IO.New_Line;
      -- arbeiten mit dem globalen Kellerobjekt
      Ausgabe_Keller_Info(Stack_Paket.Globaler_Keller);

      IstKellerLeer(Keller => Stack_Paket.Globaler_Keller);

      Ada.Text_IO.Put_Line(" Manipulation der aktuellen Index-Position des Kellers");
      -- Manipulation der aktuellen Index-Position des Kellers
      Stack_Paket.Globaler_Keller.Zeiger := 7;

      IstKellerLeer(Keller => Stack_Paket.Globaler_Keller);

      Ausgabe_Keller_Info(Stack_Paket.Globaler_Keller);

   end Globaler_Keller;

end Main_Stack_Paket;

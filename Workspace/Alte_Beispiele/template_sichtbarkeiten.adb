with Ada.Text_IO;
--with Aussen_Pkg;
with Aussen_Pkg.Child; -- Kind- und Vater-Paket ist eingebunden


procedure Template_sichtbarkeiten is

   -- Paket im Vereinbarungsteil des HP
   -- -- Paket-Spezifikation
   package Funktionen_Pkg is
       procedure Ausgabe(Item : in STRING);
   end Funktionen_Pkg;

   -- -- Paket-Body
   package body Funktionen_Pkg is

      procedure Ausgabe(Item : in STRING) is
      begin
	 Ada.Text_IO.Put_Line("Standard-Ausgabe");
	 Ada.Text_IO.Put_Line("================");
	 Ada.Text_IO.New_Line;

	 Ada.Text_IO.Put_Line( Item );
      end Ausgabe;

   end Funktionen_Pkg;

   -- Zugriff auf innenliegendes Paket,
   -- Einbindung des Pakets beachten
   Anrede : STRING := Aussen_Pkg.Innen_Pkg.Anrede;
   Name : Aussen_Pkg.STRING_5_TA := "Peter";

begin

   Funktionen_Pkg.Ausgabe(Anrede & " " & Name);


end Template_sichtbarkeiten;

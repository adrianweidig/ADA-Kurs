with Keller_ADO_Paket, Ada.Text_IO;

procedure Keller_ADO_Main is
   package Int_Keller is new Keller_ADO_Paket (
      ELEMENT => Integer,
      Groesse => 5);
   package Int_IO is new Ada.Text_IO.Integer_IO (Integer);
begin
   Int_Keller.Push (5);
   Int_Keller.Push (3);
   Int_Keller.Push (1);
   Int_IO.Put (Int_Keller.Pop, 3);
   Int_IO.Put (Int_Keller.Pop, 3);
   Int_IO.Put (Int_Keller.Pop, 3);
   Int_IO.Put (Int_Keller.Pop, 3);
exception
   when Int_Keller.Unterlauf =>
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line ("Keller war schon leer. Pop fuehrte zu Fehler!");
   when Int_Keller.Ueberlauf =>
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line
        ("Ihr Keller war schon voll. Push fuehrte zu Fehler!");
end Keller_ADO_Main;

with Ada.Text_IO, g2zuweisen;
use  Ada.Text_IO, g2zuweisen;

procedure g2generischeInstanziierung is
   
   Zahl1 : Integer := 10;
   Zahl2 : Integer;
   
   procedure Integer_Zuweisen is new Zuweisen(Welcher_Typ_Sind_Die_Inhalte     => Integer,
                                              Welcher_Wert_Soll_Genutzt_Werden => Zahl1,
                                              Wo_Wird_Dieser_Reingespeichert   => Zahl2);
   
begin
   
   Integer_Zuweisen;
   
   Put_Line(Integer'Image(Zahl2));
   
   
end g2generischeInstanziierung;

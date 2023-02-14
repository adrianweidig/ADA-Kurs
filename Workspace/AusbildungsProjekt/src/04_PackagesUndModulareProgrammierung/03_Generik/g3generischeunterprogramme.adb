with Ada.Text_IO, g3unterprogramm;

use Ada.Text_IO, g3unterprogramm;

procedure g3generischeUnterprogramme is
   Zahl1 : Integer := 10;
   Zahl2 : Integer;
   
   function Integer_To_String(Element : Integer) return String is
   begin
      return Integer'Image(Element);
   end Integer_To_String;
   
   procedure Integer_Zuweisen is new Zuweisen(Welcher_Typ_Sind_Die_Inhalte     => Integer,
                                              Welcher_Wert_Soll_Genutzt_Werden => Zahl1,
                                              Wo_Wird_Dieser_Reingespeichert   => Zahl2,
                                              To_String                        => Integer_To_String); -- Alternativ: Integer'Image
begin

   -- Sind Parameter angegeben muessen diese bei der "neuen" Prozedur mit angegeben werden
   -- und logischerweise dann auch beim Aufruf.
   Integer_Zuweisen;  
  
end g3generischeUnterprogramme;

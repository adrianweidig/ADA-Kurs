-- Grundannahme:
-- Man hat ein ADO in das man Sachen reinlegen kann und sich den aktuellen Inhalt
-- komplett ausgeben lassen kann.

with g5GenerischeIteration, Ada.Integer_Text_IO, Ada.Text_IO;

procedure g5MainGenIteration is
   
   -- Hier geben wir eine Standardgroesse der Box an, 
   -- welche definitiv innerhalb unserer Reichweite
   -- des Zeigers ist.
   Boxgroesse : Integer := 10;
   
   Eingabe    : Integer;
   
   package Integer_Box is new g5GenerischeIteration(Wie_Gross_Ist_Die_Box => Boxgroesse,
                                                    Was_Soll_In_Die_Box   => Integer,
                                                    To_String             => Integer'Image);
   
begin
   
   -- Boxgroesse innerhalb des Pakets
   Integer_Box.Boxgroesse;
  
   -- Boxgroesse innerhalb unserer Main
   Ada.Text_IO.Put_Line("Variable Boxgroesse der Main: " & Integer'Image(Boxgroesse));
   
   --------------- AENDERUNG DER BOXGROESSE VON AUSSEN ----------------
   Ada.Text_IO.Put("Neue Boxgroesse: ");
   
   -- ACHTUNG: 
   -- Die Range des bereits initialisierten Arrays
   -- kann im Nachhinein durch aeussere Manipulation
   -- so nicht veraendert werden.
   Ada.Integer_Text_IO.Get(Boxgroesse);
   
   Ada.Text_IO.Skip_Line;
   --------------- AENDERUNG DER BOXGROESSE VON AUSSEN ----------------
   
   -- Boxgroesse innerhalb des Pakets
   Integer_Box.Boxgroesse;
   
   -- Boxgroesse innerhalb unserer Main
   Ada.Text_IO.Put_Line("Variable Boxgroesse der Main: " & Integer'Image(Boxgroesse));
   
   -- Hier wird auch ersichtlich wie man eine entsprechende Exception abfangen koennte.
   begin
      
      loop 
         Ada.Text_IO.Put("Was soll hinzugefuegt werden?: ");
         Ada.Integer_Text_IO.Get(Eingabe);
         Integer_Box.Hinzufuegen(Eingabe);
      end loop;
      
   exception 
      when Integer_Box.Box_Voll => Ada.Text_IO.Put_Line("Eigener Exceptionabfang - Box ist voll.");
      
   end;
   
   
end g5MainGenIteration;

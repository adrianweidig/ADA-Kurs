with Ada.Text_IO; use Ada.Text_IO;

-- Verschiedene Faelle durch Aenderung von A B C durchgehen und erklaeren
procedure g51Kontrollstrukturen_If is
   
   A : Integer := 300;
   B : Integer := 200;
   C : Integer := 50;
   
begin
   -- Verschachtelung erklaert sich durch die Begrifflichkeiten selbst
   
   -- Simples Beispiel
   if A > B then
      Put_Line("A ist groeﬂer als B");
      if A > C then
         Put_Line("A ist auch groeﬂer als C");
      else 
         Put_Line("Aber A ist kleiner C");
      end if;
   elsif A > C then
      Put_Line("A ist groeﬂer als C" & ASCII.LF & "Aber A ist kleiner als B");
   else
      Put_Line("A ist kleiner als C und kleiner als B");
   end if;
   
   -- Erweitertes Beispiel
   if A < B and A < C then
      Put_Line("A ist kleiner als C und B");
   elsif A > B and A > C then 
      Put_Line("A ist groeﬂer als C und B");
   elsif A < B or A < C then
      Put_Line("A ist entweder kleiner als C oder als B");
   end if;
   
   -- Kurzschlussform 
   -- Diese wird verwendet wenn ich eine Pruefreihenfolge festlegen
   -- moechte. Es gibt Faelle da koennte der Fall zu einem Fehler
   -- fuehren, wenn der erste nicht dem Ergebnis entspricht. Im
   -- Normalfall wird die andere Seite dann dennoch geprueft. Diest
   -- ist jedoch nicht immer gewuentscht.
   
      -- Zweiter Operand wird nur dann ausgewertet wenn links true ergibt
   if A < B and then A < C then
      Put_Line("A ist kleiner als C und B");
      -- Zweiter Operand wird nur dann ausgewertet wenn links false ergibt
   elsif A < B or else A < C then
      Put_Line("A ist entweder kleiner als C oder als B");
      -- Sollten and und and then genutzt werden muss der Bereich in Klammern gesetzt werden
   elsif (A > B and A > C) and then A > C then -- darauf hinweisen, dass der rechte Part theoretisch unnoetig ist
      Put_Line("A ist groeﬂer als C und B");
      -- null besagt lediglich, dass nichts passieren soll
   else
      null;
   end if;
   
   -- Konditionale Schreibweise (Erst ab ADA 2012)
   -- Erlaubt die vereinfachte Schreibweise innerhalb einer 
   -- Anweisung.
   Put_Line( if A < B then "A ist kleiner B." else "A ist groeﬂer B.");

end g51Kontrollstrukturen_If;

with Ada.Text_IO;

use Ada.Text_IO;

procedure T003Entry is
   
   -- Die "Entries" werden im jeweiligen
   -- Task bereits bei der Deklaration
   -- festgelegt.
   task Kontrollierter_Task is
      entry Start;
      entry Start2;
   end Kontrollierter_Task;
   
   -- Nach accept koennen wir angeben was nach
   -- dem entsprechenden Entry passieren soll.
   
   -- Entsprechend der gewuenschten Schreibweise
   -- auskommentieren. Verdeutlichen, dass accept ..;
   -- ohne do - end entsprechend der Schreibreihenfolge
   -- darauf wartet, dass die Entries eintreten um den
   -- Task zu quitieren.
   
   --> Schreibweise 1 : Ohne Do-End
   
   task body Kontrollierter_Task is
   begin
      Put_Line("Vor dem accept in Kontrollierter_Task");
      accept Start;
      Put_Line("Nach dem accept (Start) in Kontrollierter_Task");
      accept Start2;
      Put_Line("Nach dem accept (Start2) in Kontrollierter_Task");
   end Kontrollierter_Task;
   
   --> Schreibweise 2 : Mit Do - End (Uebersichtlicher)
   
   --  task body Kontrollierter_Task is
   --  begin
   --     Put_Line("Vor dem accept in Kontrollierter_Task");
   --  
   --     accept Start  do
   --        Put_Line("Nach dem accept (Start) in Kontrollierter_Task");
   --     end Start;
   --  
   --     accept Start2  do
   --        Put_Line("Nach dem accept (Start2) in Kontrollierter_Task");
   --     end Start2;
   --  end Kontrollierter_Task;
   
begin
   -- Moegliche Attribute:
   Put_Line("Task aufrufbar?: " & Boolean'Image(Kontrollierter_Task'Callable));
   Put_Line("Task beendet?  : " & Boolean'Image(Kontrollierter_Task'Terminated));
   
   Put_Line("Main-Prozedur vor den anderen Tasks");
   
   -- AUSBIILDERHINWEIS:
   -- Das .Start einmal auskommentieren um
   -- zu verdeutlichen, dass alles VOR accept
   -- ebenfalls wie gewohnt aufgerufen wird. 
   
   -- Aber ACHTUNG:
   -- Wenn wir dies tun wartet der Task auch
   -- darauf, dass Start irgendwann aufgerufen
   -- wird um die Task Anweisungen entsprechend
   -- abzuschliessen. Dies kann dafuer sorgen,
   -- dass das Programm nicht quitiert.
   
   -- Ebenfalls, wenn wir mehrere Entries haben
   -- wird der Task von oben nach unten abgearbeitet.
   -- Wenn wir also auch vergessen Start2 eintreten
   -- zu lassen wird das Programm wieder darauf warten.
   
   -- WEITERHIN:
   -- Muss man die Reihenfolge entsprechend der Deklaration
   -- beachten. Rufen wir zuerst Start2 auf kommen wir nicht
   -- zur entsprechenden Zeile.
   
   Kontrollierter_Task.Start; 
    
   Kontrollierter_Task.Start2;
   
   -- Verdeutlicht, dass die Main-Prozedur weiterhin
   -- asynchron zu den anderen Tasks weiterlaeuft.
   
   -- AUSBILDERHINWEIS:
   -- Es kann vorkommen, dass dieses Put_Line tatsaechlich
   -- erst am Ende aufgerufen wird. Dann einfach oefters
   -- die Datei bearbeiten und starten bis dieses Put_Line
   -- noch vor Start2 aufgerufen wird.
   Put_Line("Main-Prozedur nach den anderen Tasks");
   
   -- Zeit zum Warten damit der Task definitiv beendet sein wird
   delay 5.0;
   Put_Line("Task aufrufbar?: " & Boolean'Image(Kontrollierter_Task'Callable));
   Put_Line("Task beendet?  : " & Boolean'Image(Kontrollierter_Task'Terminated));
end T003Entry;

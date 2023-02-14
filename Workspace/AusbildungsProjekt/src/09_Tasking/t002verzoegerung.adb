with Ada.Text_IO;

use Ada.Text_IO;

procedure T002Verzoegerung is
   
  
   task Verzoegerungs_Task;
   
   task body Verzoegerungs_Task is
   begin
      -- Mit delay koennen wir den
      -- zugehoerigen Task eine 
      -- vorgegebene Zeit in Sekunden
      -- warten lassen.
      for I in 1 .. 100 loop
         Put_Line("Verzoegerung");
         delay 2.0;
      end loop;  
   end Verzoegerungs_Task;
   
begin
   
   -- Man kann dies sehr schoen ablesen,
   -- dass jede Sekunde "Main-Prozedur"
   -- und alle 2 Sekunden beide Put_Lines
   -- gleichzeitig aufgerufen werden.
   
   -- Dies verdeutlicht noch weiter, dass 
   -- unsere Main-Prozedur ebenfalls ein
   -- Task ist.
   for I in 1 .. 100 loop
      Put_Line("Main-Prozedur");
      delay 1.0;
   end loop; 
   
   
end T002Verzoegerung;

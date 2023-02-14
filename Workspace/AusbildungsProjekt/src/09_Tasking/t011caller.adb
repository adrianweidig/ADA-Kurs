with Ada.Text_IO, Ada.Task_Identification, Ada.Strings.Unbounded;

use Ada.Text_IO, Ada.Task_Identification, Ada.Strings.Unbounded;

procedure T011Caller is
   
   task Warte_Task is
      entry Start;
      entry Stopp;
   end Warte_Task;
   
   task body Warte_Task is
   begin
      loop
         select  
            accept Start  do
               -- Ruft die Image Methode aus Task_Identification
               -- auf und gibt den Typ Task_ID via 'Caller zurueck.
               -- Der Caller ist der Task welcher aktuell Start
               -- versucht zu benutzen.
               Put_Line("Aufruf von Start im Warte_Task durch: " & Image(Start'Caller));
            end Start;
            
         or 
            accept Stopp;
            Put_Line("Task wird beendet.");
            exit;
     
         or   
              -- Wartet maximal 5 Sekunden. Dann wird
              -- Warten... ausgegeben.
            delay 5.0;
            Put_Line("Warten...");
            
         end select;
      end loop;
   end Warte_Task;
   
   task Zwischen_Task is
      entry Start;
      entry Stopp;
   end Zwischen_Task;
   
   task body Zwischen_Task is
   begin
      loop
         select 
            accept Start  do
               Put_Line("Aufruf von Start im Zwischen_Task durch: " & Image(Start'Caller));
               Warte_Task.Start;
            end Start;
            
         or 
            accept Stopp;
            Put_Line("Zwischen_Task wird beendet.");
            Warte_Task.Stopp;
            exit; 
         end select;
      end loop;
   end Zwischen_Task;
   
   Vergleichs_String : Unbounded_String;
   
begin
   
   loop 
      Put_Line("Start?");
      Vergleichs_String := To_Unbounded_String(Get_Line);
      if Vergleichs_String = "Start" then
         Zwischen_Task.Start;
      elsif Vergleichs_String = "Stopp" then
         Zwischen_Task.Stopp;
         
         -- Um zu gewaehrleisten, dass die Tasks vorher beendet ist.
         delay 0.1;
         Put_Line("Programm wird beendet.");
         exit;
      else 
         Put_Line("Falsche Eingabe. Zur Neu-Eingabe beliebige Eingabe taetigen. Zum beenden Stopp eingeben."); 
      end if; 
   end loop;
   
end T011Caller;

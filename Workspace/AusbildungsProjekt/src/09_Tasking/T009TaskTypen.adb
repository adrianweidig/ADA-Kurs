with Ada.Text_IO;

use Ada.Text_IO;

procedure T009TaskTypen is
   
   task type Task_Typ is
      entry Start (Zahl : Integer);
   end Task_Typ;
   
   -- Wenn wir jetzt das Programm starten wird
   -- nichts passieren, denn bei der Nutzung 
   -- des "type" muessen wir erst ein Objekt
   -- vom entsprechenden Typ erzeugen
   task body Task_Typ is 
   begin
      
      accept Start (Zahl : in Integer) do
         Put_Line("Zahlwert: " & Integer'Image(Zahl));
      end Start;
      
   end Task_Typ;
   
   -- Dieser Task wird wie gewohnt dann
   -- AUTOMATISCH ausgefuhert. Wenn dieser
   -- Task ein Entry hat und nicht explizit
   -- aufgerufen wird, wartet der Tag darauf.
   Task_Objekt : Task_Typ;
   
   -- Dadurch, dass wir jetzt einen Typ haben
   -- koennen wir diese auch wie gewohnt 
   -- verwenden. Z.B. in einem Array.
   type Task_Array is array (1 .. 10) of Task_Typ;
   
   -- Die Inhalte des Arrays werden jedoch NICHT
   -- automatisch ausgefuhert. 
   -- ACHTUNG:
   -- Weisst ihr dem Array z.B. fuer alle Stellen
   -- den gleichen Task zu wird dies auch wie der
   -- mehrfache Aufruf des selben Tasks gewertet.
   -- Ist dieser z.B. bereits "terminated", dann
   -- wird dies beim Aufruf zu einem Fehler fuehren.
   
   --> Beim Erzeugen des Arrays werden die Stellen
   --  initial mit ungestarteten Standard-Tasks
   --  entsprechend dem Typ belegt.
   Das_Array : Task_Array;
   
   -- Die Zeiger koennte man wie gewohnt in ein
   -- Array packen und mittels new auch jedes 
   -- Mal neue Tasks erzeugen. Dies bietet
   -- sich bei der Aggregation mittels others
   -- an.
   type Task_Zeiger is access Task_Typ;
   
begin
   
   Put_Line("Innerhalb der Main-Procedure");
   
   Task_Objekt.Start(Zahl => 10);
   
   -- Array Iteration
   for Ein_Array of Das_Array loop
      Ein_Array.Start(Zahl => 5);
   end loop;
   
   -- Iteration durch Nutzung von Zeigern
   for I in Das_Array'Range loop
      declare
         TmpTask : Task_Zeiger := new Task_Typ;
      begin
         TmpTask.Start(Zahl => 50);
      end;
   end loop;
   
end T009TaskTypen;

with Ada.Text_IO;

use Ada.Text_IO;

-- WICHTIG:
-- Es gibt immer einen "Main-Task" alle
-- hier beinhalteten Tasks sind Subtasks
-- des Main-Tasks. Dieser wartet auf die 
-- Beendigung der Subtasks bis er selbst
-- beendet wird.

-- Dies funktioniert auch ebenfalls mit allen
-- Tasks egal von wo diese aus aufgeruft werden.
-- (Pakete, Unterprogramme etc.) Der 
-- Uebergeordnete Task wartet immer auf die
-- Beendigung der Subtasks.

procedure T001ErsterTask is
   
   -- Unterschiedlich zu Prozeduren MUSS
   -- es eine getrennte Deklaration und 
   -- Vereinbarung (body) geben.
   task Erster_Task;
   
   task body Erster_Task is
   begin 
      Put_Line("Innerhalb von Erster_Task");
   end Erster_Task;
   
   task Zweiter_Task; 
    
   task body Zweiter_Task is
   begin 
      Put_Line("Innerhalb von Zweiter_Task");
   end Zweiter_Task;
   
   
begin
   -- Man sieht, dass die Tasks IMMER aufgerufen
   -- werden. 
   
   -- AUSBILDERHINWEIS:
   -- Mehrmals die Datei bearbeiten (z.B. Leerzeichen),
   -- und dann kompilieren. Man sieht, dass die Aufrufreihenfolge
   -- jedes Mal unterschiedlich ist (Gleich = Zufall). Dies
   -- verdeutlicht, dass die Tasks GLEICHZEITIG also asynchron
   -- zueinander starten. 
   
   -- Ebenfalls verdeutlicht uns dies, dass die Prozedur selbst 
   -- (Main-Prozedur) ebenfalls ein eigener Task ist.
   Put_Line("Innerhalb unserer Main-Prozedur");
end T001ErsterTask;

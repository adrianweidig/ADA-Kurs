with Ada.Text_IO;

use Ada.Text_IO;

procedure T004TaskSelection is
   
   task Mehrere_Aufgaben is
      entry Aufgabe1;
      entry Aufgabe2;
   end Mehrere_Aufgaben;
   
   task body Mehrere_Aufgaben is
   begin
      select
         accept Aufgabe1  do
            Put_Line("Mehrere_Aufgaben - Aufgabe1");
         end Aufgabe1;
         
      or 
         accept Aufgabe2  do
            Put_Line("Mehrere_Aufgaben - Aufgabe2");
         end Aufgabe2;
         
      or
           -- Quitiert den Task zwangsweise.
           -- Dies tritt ein wenn keine Selection
           -- ausgeweahlt ist.   
           
         -- Hier darf kein Code stehen, da Befehle
         -- hier nur stehen duerfen wenn ein entsprechendes
         -- accept vorhanden ist.
         terminate;
         
      end select;
   end Mehrere_Aufgaben;
   
   
   task Parallele_Aufgaben is
      entry Aufgabe1;
      entry Aufgabe2;
   end Parallele_Aufgaben;
   
   -- Eine gaengige Vorgehensweise ist es das
   -- select in eine loop (while-true) zu packen.
   -- Dies sorgt dafuer, dass alle Aufrufe erfolgen
   -- konnen bis irgendwann keiner mehr kommt. Dann
   -- wird der Task automatisch terminated.
   task body Parallele_Aufgaben is
   begin
      loop 
         select
            accept Aufgabe1  do
               Put_Line("Parallele_Aufgaben - Aufgabe1");
            end Aufgabe1;
            
         or 
            accept Aufgabe2  do
               Put_Line("Parallele_Aufgaben - Aufgabe2");
            end Aufgabe2;
            
         or 
            terminate;
     
         end select;
      end loop;
   end Parallele_Aufgaben;
   
begin
   
   Put_Line("Main Prozedur - Vor Aufruf");
   
   -- Durch das Select sind einzelne Entries
   -- als Auswahl moeglich ohne, dass auf 
   -- das explizite Starten der anderen Entries
   -- notwendig ist.
   
   -- AUSBILDERHINWEIS:
   -- Verschiedene Aufgaben starten auch Mal gleichzeitig
   -- und auch einmal komplett ohne Aufruf einer Aufgabe aus
   -- dem Task Mehrere_Aufgaben.
   
   Mehrere_Aufgaben.Aufgabe1;
   
   -- ACHTUNG: Wenn der Task bereits einmal abgearbeitet
   -- wurde kann dieser nicht nochmal aufgerufen werden.
   -- da unser Task von der Ausfuehrung her "unten"
   -- angekommen ist. Daher ist Variante Zwei:
   -- Parallele_Aufgaben zu bevorzugen, da der Task
   -- sich in einer permanenten Schleife befindet und
   -- quasi wieder "nach oben springt".
  
   -- Mehrere_Aufgaben.Aufgabe2;
   
   Parallele_Aufgaben.Aufgabe2;
   
   Parallele_Aufgaben.Aufgabe1; 
    
   Parallele_Aufgaben.Aufgabe2;
   
   Put_Line("Main Prozedur - Nach Aufruf");
   
end T004TaskSelection;

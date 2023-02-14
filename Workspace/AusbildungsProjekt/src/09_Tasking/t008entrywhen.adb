with Ada.Text_IO;

use Ada.Text_IO;

procedure T008EntryWhen is
   
   task Ein_Task is
      entry Initialisieren;
      entry Erhoehen;
   end Ein_Task;
   
   task body Ein_Task is
      
      Zahl          : Integer;
      Initialisiert : Boolean := False;
      
   begin
      
      loop 
         select
            when Initialisiert = False =>
               accept Initialisieren  do
                  Zahl := 0;
                  Initialisiert := True;
                  Put_Line("INITIALISIERT!");
               end Initialisieren;
               
         or 
            accept Erhoehen  do
               -- Teilweise ist es sinnvoller und einfacher
               -- eine simple If-Anweisung zu nutzen.
               -- Man sollte auf die "Guards" wenn moeglich
               -- verzichten.
               if Initialisiert then
                  Zahl := Zahl + 1;
                  Put_Line("Zahl-Wert:" & Integer'Image(Zahl));
               else 
                  Put_Line("Noch nicht initialisiert");
               end if;
            end Erhoehen;
            
  
         else
            -- Else wird aufgerufen, wenn ein Eintrag
            -- nicht akzeptiert oder nicht sofort aufgerufen
            -- wird. In unserem Fall jedes Mal solange 
            -- Erhoeht wegen des Blocks nicht aufgerufen
            -- werden kann.
            
            -- Wird auch aufgerufen wenn zu lange keine
            -- Interaktion innerhalb des Tasks stattfindet.
            
            -- Put_Line auskommentieren um zu verdeutlichen
            -- Put_Line("Nicht initialisiert");
            null;
            
            -- Moeglichkeit den Task zu schliessen
            -- exit;
         end select;
      end loop;

   end Ein_Task;
   
begin
   
   for I in 1 .. 100 loop 

      Ein_Task.Erhoehen;
      
      if I = 10 then
         Ein_Task.Initialisieren;
      end if;
      
      Ein_Task.Erhoehen;

   end loop;
 
   
end T008EntryWhen;

with O6Interface, Ada.Text_IO;

use O6Interface, Ada.Text_IO;

procedure O6MainInterface is
   
   Ein_Pferd   : Pferd;
   
   Ein_Pegasus : Pegasus;
   
begin
   
   -- Via Autovervollstaendigung zeigen welche
   -- Moeglichkeiten gegeben sind und welche nicht.
   Put("Pferd: "); Ein_Pferd.Laufen;
   
   -- Nicht moeglich, da nicht dem Typ Pferd zugeordnet.
   -- Ein_Pferd.Fliegen;
   
   Put("Pegasus: " ); Ein_Pegasus.Laufen;
   
   -- Wenn die Methode nicht ueberschrieben oder 
   -- ueberladen ist wird quasi "Nichts" --> " "
   -- ausgegeben.
   Put("Pegasus: " ); Ein_Pegasus.Fliegen;
   

end O6MainInterface;

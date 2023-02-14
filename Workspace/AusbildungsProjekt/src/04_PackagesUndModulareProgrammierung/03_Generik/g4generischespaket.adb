with Ada.Text_IO;

use Ada.Text_IO;

package body g4GenerischesPaket is

   procedure rueckgabe is
   begin
      -- Man beachte:
      -- Put_Line kommt aus dem obigen Text_IO package
      -- Als_String kommt aus dem eigenen Package, aus
      -- dem generischen Part. Da die Funktion Als_String
      -- einen String zurueckliefert ist der Prozess bis
      -- zum String unserem Programm egal.
      
      -- Desweiteren beachte man, dass InhaltsObjekt dem
      -- Typ entspricht den die generische Als_String 
      -- Funktion erwartet, weswegen wir dieses dann auch
      -- als Eingabeparameter fuer diese Funktion nutzen
      -- koennen.
      Put_Line(Als_String(InhaltsObjekt));
   end rueckgabe;

end g4GenerischesPaket;

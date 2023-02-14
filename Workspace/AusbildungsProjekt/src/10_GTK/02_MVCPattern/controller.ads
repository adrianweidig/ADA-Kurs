with View;

with Model;

package Controller is

   -- Startroutine
   procedure Start (Start_Wert : Integer);
   
   -- Irgendeine Aenderung
   procedure Tu_Dinge;
   
private
   
   -- Initialobjekt:
   -- Der Controller bekommt oder erstellt alle
   -- Initialobjekte.
   -- Heisst diese werden entweder vorher erstellt
   -- und im Controller gespeichert oder direkt
   -- im Controller erstellt.
   Erstes_Model_Objekt : Model.Ein_Model;

end Controller;

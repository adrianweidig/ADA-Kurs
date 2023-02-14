-- Das Model ist im Grunde das
-- Inhaltsobjekt, welches der
-- View und dem Controller alle
-- noetigen Informationen liefert
-- mit denen diese umgehen koennen.

package Model is

   type Ein_Model is tagged private;
   
   procedure SetInhalt (this : in out Ein_Model; Wert : Integer);
   
   function GetInhalt  (this : in out Ein_Model) return Integer;
   
private 
   
   type Ein_Model is tagged record
      Inhalt : Integer;
   end record;

end Model;

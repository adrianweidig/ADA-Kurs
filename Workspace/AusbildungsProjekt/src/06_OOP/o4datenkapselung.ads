with Ada.Strings.Unbounded;

use Ada.Strings.Unbounded;

package O4Datenkapselung is

   -- Durch private haben wir den Koerper unserer
   -- Klasse von direkten Zugriffen versteckt. 
   -- Somit koennen Inhalte nur ueber andere Methoden
   -- veraendert werden.
   -- Dies sorgt fuer mehr Sicherheit beim Umgang
   -- mit der Klasse und wird in modernen Programmiersprachen
   -- eigentlich immer genutzt.
   type Tier is tagged private;
   
   procedure setLebendig    ( Das_Tier : in out Tier;  Ist_Lebendig : Boolean );
   procedure setBezeichnung ( Das_Tier : in out Tier;  Tier_Bezeichnung : Unbounded_String );
   
   function getLebendig    (Das_Tier : Tier) return Boolean;
   function getBezeichnung (Das_Tier : Tier) return String;

private 
   -- Hier definieren wir wie gewohnt unseren Typen 
   -- bzw. die Klasse naeher.
   type Tier is tagged record
      Lebendig      : Boolean := True;
      Bezeichnung   : Unbounded_String := To_Unbounded_String("Tier");
   end record;

   -- Diese Schreibweise ist nur bei Funktionen moeglich. In den ersten ADA
   -- Versionen gab es diese nicht, sondern wurden durch procedures mit in out 
   -- als ausreichend angesheen. 
   -- Das Return Statement steht "quasi" fuer eine temporaere out Variable 
   -- welche bei is () dann naeher definiert wird. 
   
   -- WICHTIG: 
   -- Es darf hier nur EINE Angabe vorhanden sein. Daher bietet sich diese
   -- Schreibweise fuer get Methoden an und entlastet den body.
   function getLebendig    (Das_Tier : Tier) return Boolean is (Das_Tier.Lebendig);
   function getBezeichnung (Das_Tier : Tier) return String is (To_String(Das_Tier.Bezeichnung));
end O4Datenkapselung;

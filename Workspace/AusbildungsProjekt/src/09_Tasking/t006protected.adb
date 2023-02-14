with Ada.Text_IO;

use Ada.Text_IO;

-- Protected Objekte haben eine groessere Bedeutung
-- bei Tasking. Kann jedoch auch komplett unabhaengig
-- davon genutzt werden.
procedure T006Protected is
   
   -- Deklarationspart des geschuetzten Objekts
   protected Geschuetztes_Objekt is
      
      -- Hier sind nur Unterprogramme erlaubt
      procedure Set     (Inhalt : Integer);
      function Get      return Integer;
      function ToString return String;
  
      -- Ein geschuetztes Objekt hat Inhaltselemente
      -- im "private" Bereich. Auf diese kann statisch
      -- von aussen nicht zugegriffen werden.
   private
      
      Objektinhalt : Integer := 0;
      
   end Geschuetztes_Objekt;
   
   -- Definitionspart des geschuetzten Objekts
   protected body Geschuetztes_Objekt is
      
      procedure Set (Inhalt : Integer) is
      begin
         -- Unsere Set Methode legt simpel
         -- unseren Objektinhalt fest.
         Objektinhalt := Inhalt;
      end Set;
      
      function  Get return Integer is
      begin
         -- Gibt simpel den Inhalt zurueck
         return Objektinhalt;
      end Get;
      
      function ToString return String is
      begin
         return Integer'Image(Objektinhalt);
      end ToString;
      
   end Geschuetztes_Objekt;
   
begin
   
   Put_Line("Inhalt unseres Objekts: " & Geschuetztes_Objekt.ToString);
   
   Geschuetztes_Objekt.Set(10);
   
   Put_Line("Inhalt unseres Objekts: " & Geschuetztes_Objekt.ToString);
   
   -- Zugriff auf den Inhalt und Nutzung dessen
   Geschuetztes_Objekt.Set(Geschuetztes_Objekt.Get + 10);
   
   Put_Line("Inhalt unseres Objekts: " & Geschuetztes_Objekt.ToString);
   
   -- Was NICHT geht (logischerweise) :
   -- Geschuetztes_Objekt.Get := 666;

end T006Protected;

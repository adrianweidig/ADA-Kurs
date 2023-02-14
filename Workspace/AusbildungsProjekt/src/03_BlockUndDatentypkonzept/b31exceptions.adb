with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure b31Exceptions is
   
   
   
   A               : Integer;
   B               : Float;
   
   -- Zwischenvariable die True gesetzt wird 
   -- sobald die Eingabe korrekt war. 
   -- --> Schleifen-Ausstiegs-Punkt
   Eingabe_Korrekt : Boolean := False;
   
   
   
   
   -- ACHTUNG BEI BLOECKEN -- -- ACHTUNG BEI BLOECKEN --
   
   procedure VORSICHT is
      function GEFAHR return Integer is
      begin
         -- Dieser Error wird provoziert und auch hier abgefangen
         raise Constraint_Error;
         
         -- Hier kommen wir nicht hin da der Error provoziert wird.
         -- Wuerde dieser nicht ausgeloest werden wird 5 zurueckgegeben.
         -- raise Zeile einmal auskommentieren zum Zeigen
         return 5;
      exception
         when Constraint_Error => Put_Line("Wir befinden uns in der GEFAHR Funktion!"); 
      
            return 1337;
      end GEFAHR;
      
   begin
      -- Hier beginnt unser Block
      declare
         -- Fehler die im Deklarationspart entstehen
         -- werden nicht vom Implementierungspart (nach begin)
         -- abgefangen!
         A : Integer := GEFAHR;
      begin
         Put_Line (Integer'Image (A));
      exception
         when Constraint_Error => Put_Line ("Dieser Abfang wird nie ausgeloest!");
      end;
   end VORSICHT;
  

begin
   while not Eingabe_Korrekt loop
      begin
         -- Es sind nur Zahltypen erlaubt (Integer und Float)
         -- Ansonsten wird ein Error geworfen.
         Put("A:");
         Get(A); 
         Put("B:");
         Get(B); 
         
         -- An diese Stelle kommt man NUR, wenn bis jetzt 
         -- keine Exception aufgetaucht ist. Dies bedeutet, 
         -- dass alle Eingaben richtig gewesen sein muessen.
         Eingabe_Korrekt := True;
      exception
         when Data_Error | Constraint_Error => 
            --Skip_Line;
            Put_Line("Falsche Nutzereingabe. Eingabe Wiederholen");
      end;
   end loop;

   -- Simple Ausgabe
   Put(A); 
   New_Line;
   Put(B);
   
   New_Line;
   
   
   -- Achtung bei Bloecken etc.
   VORSICHT;
   
end b31Exceptions;

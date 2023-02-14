with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure b32EigeneExceptions is
   
   -- Bezeichnung der Exception
   ZuGross, ZuKlein : Exception;
   
   A                : Integer;
   
begin
   
   Put("A : ");
   Get(A);
   
   -- Man sieht sehr schoen, dass je nach Fall
   -- die entsprechende Exception ausgeloest wird.
   -- Diese kann weiter bhenadelt werden.
   if A = 0 then
      null;
   elsif A < 10 then
      raise ZuKlein with "Der Wert ist unter 10, bitte geben Sie einen groeﬂeren Wert ein!";
   else
      raise ZuGross with "Der Wert ist ueber 10, bitte geben Sie einen kleineren Wert ein!";
   end if;
   
   -- Weiterreichen einer Exception
   
   declare
      Text : String := "012345";
   begin 
      Text := "0123456";
   exception
      when Constraint_Error => 
         raise; -- Sorgt dafuer, dass der Fehler an die naechst hoehere,
                -- Instanz weitergeleitet wird.
                -- Zum Ausprobieren das Raise auskommentieren.
         Put_Line("Fehler innerhalb des Blocks abgefangen");
   end;
   
exception
      when Constraint_Error => Put_Line("Fehler auﬂerhalb des Blocks erst abgefangen");
   
   
end b32EigeneExceptions;

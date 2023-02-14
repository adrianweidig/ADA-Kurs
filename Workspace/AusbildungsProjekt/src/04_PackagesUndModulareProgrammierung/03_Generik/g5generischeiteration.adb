with Ada.Text_IO;

package body g5GenerischeIteration is
   -- Dinge in meine Box reinlegen
   procedure Hinzufuegen(Inhalt : in Was_Soll_In_Die_Box) is 
   begin
      -- Natuerlich soll dies auch nur funktionieren solange unsere
      -- Box nicht voll ist.
      if Zeiger <= Die_Box'Last then 
         -- Inhalt an die Stelle legen an welche der Zeiger hinzeigt
         Die_Box(Zeiger) := Inhalt;
      
         -- Ausgabe des Passierten
         Ada.Text_IO.Put_Line("An Stelle" & Integer'Image(Zeiger) & " wurde der Inhalt" & To_String(Die_Box(Zeiger)) & " gelegt.");
         
         -- Zeiger um eins nach Rechts verschieben
         Zeiger := Zeiger +1;
         
         -- Normale Ausgabe
         Ada.Text_IO.Put("Boxinhalte Iterativ: ");
         Ausgeben;
         Ada.Text_IO.New_Line;
         
         -- Rekursive Ausgabe
         Ada.Text_IO.Put("Boxinhalte Rekursiv: ");
         Ausgeben_Rekursiv;
         Ada.Text_IO.New_Line;
      else
         Ada.Text_IO.Put_Line("Die Box ist leider voll");
         -- Alternative mit einer Exception
         raise Box_Voll;
      end if;

   end Hinzufuegen;
   
   
   -- Aktuelle Elemente meiner Box ausgeben lassen
   procedure Ausgeben is
   begin
      -- Wir iterieren jetzt von Stelle 1 unserer
      -- Box bis zur Stelle an der sich unser Zeiger-1
      -- gerade befindet und geben uns alles aus.
      
      -- WARUM -1 ???
      -- Unser Zeiger zeigt immer auf die als naechstes
      -- zu belegende Stelle. Diese ist noch nicht befuellt
      -- und somit fuer eine normale Ausgabe irrelevant.
      for I in Die_Box'First .. Zeiger-1 loop
         Ada.Text_IO.Put("[" & To_String(Die_Box(I)) & " ] ");
      end loop;
      
   end Ausgeben;
   
   procedure Ausgeben_Rekursiv is
   begin
      
      Rekursion(Die_Box'First); 
      
   end Ausgeben_Rekursiv;
   
   -- Rekursive Ausgabe aller aktuellen Elemente
   procedure Rekursion(Start_Wert : Integer) is
   
      Linke_Grenze : Integer := Start_Wert;
   
   begin 
      -- WARUM nicht <= ???
      -- Unser Zeiger zeigt immer auf die als naechstes
      -- zu belegende Stelle. Diese ist noch nicht befuellt
      -- und somit fuer eine normale Ausgabe irrelevant.
      if Linke_Grenze < Zeiger then
         Ada.Text_IO.Put("[" & To_String(Die_Box(Linke_Grenze)) & " ] ");
         Linke_Grenze := Linke_Grenze +1;
         Rekursion(Linke_Grenze);
      end if;
 
   end Rekursion;
   
   -- So erhalten wir die aktuelle Groesse unserer Box
   procedure Boxgroesse is
   begin
      -- Boxgroesse innerhalb unseres Pakets
      Ada.Text_IO.Put_Line("Variable Boxgroesse des Pakets: " & Integer'Image(Wie_Gross_Ist_Die_Box));
      Ada.Text_IO.Put_Line("Fassungsvermoegen der Box (Array): " & Integer'Image(Die_Box'Length));
   end Boxgroesse;

end g5GenerischeIteration;

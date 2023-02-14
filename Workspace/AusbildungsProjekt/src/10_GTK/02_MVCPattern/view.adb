package body View is

   procedure Aenderung (Objekt : in out Model.Ein_Model) is
   begin
      
      -- Greift auf die Objektinhalte zu um eine 
      -- dafuer spezifizierte Ausgabe zu taetigen.
      Put_Line("Neuer Model-Inhalt: " & Integer'Image(Objekt.GetInhalt));
      
   end Aenderung;

end View;

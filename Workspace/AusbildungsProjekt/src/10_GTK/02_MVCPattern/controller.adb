package body Controller is
   
   procedure Start (Start_Wert : Integer) is
   begin
      -- Initialisiert alle Model-Objekte
      Erstes_Model_Objekt.SetInhalt(Start_Wert);
      
      -- Fuehrt Routinen durch
      -- Normalerweise aktiviert der Nutzer
      -- nur ein einziges Mal die Main.
      -- (Ausser in Konsolenanwendungen)
      View.Aenderung(Erstes_Model_Objekt);
      
      for I in 1 .. 10 loop
         Tu_Dinge;
      end loop;
      
   end Start;
   
   procedure Tu_Dinge is
   begin
      
      -- Irgendeine Aenderung durch Zugriff auf Model
      Erstes_Model_Objekt.SetInhalt(Erstes_Model_Objekt.GetInhalt + 1);
      
      -- Benachrichtigung der View ueber eine Aenderung
      View.Aenderung(Erstes_Model_Objekt);
      
   end Tu_Dinge;

end Controller;

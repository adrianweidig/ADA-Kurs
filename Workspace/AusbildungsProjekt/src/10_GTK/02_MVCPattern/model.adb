package body Model is
   
   procedure SetInhalt (this : in out Ein_Model; Wert : Integer) is
   begin
      this.Inhalt := Wert;
   end SetInhalt;

   function GetInhalt (this : in out Ein_Model) return Integer is (this.Inhalt);

end Model;

package Dynamische_Speicherverwaltung is

   type VERWEIS is private;
   NULL_Verweis : constant VERWEIS;

   generic
      type ELEMENT is private;
      Speichergroesse : Positive := 10;
   package Element_Paket is
   
      procedure Anfordern (H : out VERWEIS);
      procedure Freigeben (H : in VERWEIS);
      procedure Wert (H : in VERWEIS; E : in ELEMENT);
      function Wert (H : VERWEIS) return ELEMENT;
      Position_Fehlerhaft, Speicher_Voll : exception;
	
	private
	
	-- Muss hier ausnahmsweise im Body sein
	-- Wegen der Sichtbarkeitsregeln
	  
   end Element_Paket;

private

   type VERWEIS is record
      Position : Natural := 0;
   end record;
   
   NULL_Verweis : constant VERWEIS := (Position => 0);

end Dynamische_Speicherverwaltung;

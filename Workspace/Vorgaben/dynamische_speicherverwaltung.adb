package body Dynamische_Speicherverwaltung is

   package body Element_Paket is
 	  
	  -- Privater Teil des internen Pakets --
	  -- Muss hier stehen, weil sonst Verweis nicht sichtbar
	  --ADO-Teil
      type LISTENELEMENT is record
         E : ELEMENT;
         V : VERWEIS;
      end record;

      type REIHUNG is array (1 .. Speichergroesse) of LISTENELEMENT;

      type SPEICHER is record
         Inhalt : REIHUNG;
         Zeiger : VERWEIS := (Position => REIHUNG'First);
      end record;

      S : SPEICHER;
	  -- Ende Privater Teil --
   
      procedure Anfordern (H : out VERWEIS) is
      begin
         if S.Zeiger = NULL_Verweis then
            raise Speicher_Voll;
         else
            H        := S.Zeiger;
            S.Zeiger := S.Inhalt (S.Zeiger.Position).V;
         end if;
      end Anfordern;

      function H_Pruefung_Ok (H : VERWEIS) return Boolean is
         Z : VERWEIS;
      begin
         if H = NULL_Verweis then
            raise Position_Fehlerhaft;
         else
            Z := S.Zeiger;
            while Z /= NULL_Verweis loop
               if H = Z then
                  raise Position_Fehlerhaft;
               end if;
               Z := S.Inhalt (Z.Position).V;
            end loop;
         end if;
         return True;
      end H_Pruefung_Ok;

      procedure Freigeben (H : in VERWEIS) is
      begin
         if H_Pruefung_Ok (H) then
            S.Inhalt (H.Position).V := S.Zeiger;
            S.Zeiger                := H;
         end if;
      end Freigeben;

      procedure Wert (H : in VERWEIS; E : in ELEMENT) is
      begin
         if H_Pruefung_Ok (H) then
            S.Inhalt (H.Position).E := E;
         end if;
      end Wert;

      function Wert (H : VERWEIS) return ELEMENT is
		Elem : Element;
      begin
         if H_Pruefung_Ok (H) then
            Elem := S.Inhalt (H.Position).E;
         end if;
		 return Elem;
      end Wert;

   begin
   
      --  Freiliste initialisieren
      for I in REIHUNG'First .. REIHUNG'Last - 1 loop
         S.Inhalt (I).V := (Position => I + 1);
      end loop;
      
	  S.Inhalt (REIHUNG'Last).V := NULL_Verweis;
	  
   end Element_Paket;

end Dynamische_Speicherverwaltung;

package g3unterprogramm is
   generic 
      type Welcher_Typ_Sind_Die_Inhalte is private;
      -- Diese Werte muessen bei der Auspraegung "vervollstaendigt" werden
      Welcher_Wert_Soll_Genutzt_Werden    : in Welcher_Typ_Sind_Die_Inhalte;
      Wo_Wird_Dieser_Reingespeichert      : in out Welcher_Typ_Sind_Die_Inhalte;
      
      with function To_String(Element : Welcher_Typ_Sind_Die_Inhalte) return String;
  
      -- Parameter die hier angegeben werden muessen entsprechend bei der NUTZUNG der Procedure
      -- angegeben werden. Vorinhalte (with etc.) werden bei der Auspreagung dann als Bedarf
      -- mit gewaehlt werden.
   procedure Zuweisen;

end g3unterprogramm;

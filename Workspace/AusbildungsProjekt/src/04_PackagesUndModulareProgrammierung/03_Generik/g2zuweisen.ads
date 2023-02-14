package g2zuweisen is

   -- Wichtig: Generische Nutzung erlaubt kein reines out
   -- Da dieser Prozess ja erst mit der "Eingabe" des jeweiligen
   -- Objektes funktioniert.
   generic 
      type Welcher_Typ_Sind_Die_Inhalte is private;
      Welcher_Wert_Soll_Genutzt_Werden    : in Welcher_Typ_Sind_Die_Inhalte;
      Wo_Wird_Dieser_Reingespeichert      : in out Welcher_Typ_Sind_Die_Inhalte;
      
   procedure Zuweisen;
   
   -- Diese Schreibweise zeigt, dass eine Ueberladung auch nicht moeglich ist.
   
   -- procedure Zuweisen(Test : Integer);
   
   -- Operatorenueberladung ist ebenfalls nicht erlaubt.
   -- procedure "+"(Links, Rechts : Integer);
      
  

end g2zuweisen;

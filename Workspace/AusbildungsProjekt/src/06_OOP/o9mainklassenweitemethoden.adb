with O9KlassenweiteMethoden;

use O9KlassenweiteMethoden;

procedure O9MainKlassenweiteMethoden is 
   --- Standard-Objekte
   
   Ein_Lebewesen : Lebewesen;
   
   Ein_Fisch     : Fisch;
   
   Ein_Vogel     : Vogel;
   
   --- Objektadressen
   
   Ein_Lebewesen_Ref : aliased Lebewesen := Ein_Lebewesen;
   
   Ein_Fisch_Ref     : aliased Fisch     := Ein_Fisch;
   
   Ein_Vogel_Ref     : aliased Vogel     := Ein_Vogel;
   
begin
   -- Unchecked_Access laesst zu, dass der Zugriff nicht geprueft wird. Dies 
   -- macht es moeglich unsere Referenzen von einem Paket aus dem anderen Paket
   -- mit zu nutzen. 
   -- Warum nutzt man dann Access?:
   -- Access sollte praeferiert werden, da es so nicht passieren kann, dass ploetzlich
   -- auf Inhalte anderer Pakete (Zu vieles nutzen von use-Klausel) oder auf kompatible
   -- Typen zugegriffen wird, welche jedoch nicht in dem zugehoerigen Paket direkt stehen.
   -- Passiert dies macht es sich dadurch bemerkbar, dass nach der Zuweisung der
   -- Zeiger auf eine leere Stelle zeigt (Dangling Pointer / Freihaengender Zeiger)
   O9KlassenweiteMethoden.add(Ein_Lebewesen => Ein_Lebewesen_Ref'Unchecked_Access);
   O9KlassenweiteMethoden.add(Ein_Lebewesen => Ein_Fisch_Ref'Unchecked_Access);
   O9KlassenweiteMethoden.add(Ein_Lebewesen => Ein_Vogel_Ref'Unchecked_Access);
   
   -- Zitat aus RFM:
   -- "This attribute is provided to support the situation where a local object is to be inserted into a global 
   -- linked data structure, when the programmer knows that it will always be removed from the data structure 
   -- prior to exiting the object's scope."
   --> Solange man auch dafuer sorgt (z.B. ueber Finalized / Destruktor), dass die Referenz auch wirklich
   --  entfernt wird und/oder man definitiv nach dem Entfernen nicht mehr auf diese Stelle zugreifen kann
   --  ist es unbedenklich zu nutzen.
  
   O9KlassenweiteMethoden.FliehtIhrNarren;
end O9MainKlassenweiteMethoden;

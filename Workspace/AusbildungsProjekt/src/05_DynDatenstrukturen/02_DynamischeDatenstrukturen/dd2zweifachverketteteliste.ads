generic 
   
   type T is (<>);

package dd2ZweifachverketteteListe is

   -- Logische nuetzliche Anwendungen fuer den NUTZER
   -- dessen Anwendungsfaelle selbsterklaerend sein
   -- sollten durch die Bezeichnung.
   
   -- Funktionen   
   function getFirst return T;
   
   function getLast return T;
   
   function getPos(Inhalt : T) return Integer;
   
   function get(Index : Integer) return T;
   
   function getSize return Integer;
   
   -- Prozeduren
   procedure add(Element : T);
   
   procedure remove(Index : Integer);
   
   procedure remove(Inhalt : T);
   
   procedure print;
   

private 
   -- Zum Entfernen von Elementen aus dem Speicher
   -- (Beim Loechen z.B.)
   
   
   -- unvollstaendige Typdeklaration zur Verwendung
   -- im Zeiger
   type ZweifachListe;
   
   -- Unser Zeiger auf verschiedene Elemente
   type Element_REF is access ZweifachListe;
   
   -- Das Listen ADO kennt seinen
   -- Vorgaenger, den eigenen Inhalt,
   -- sowie den Nachfolger und seine
   -- eigene Position
   type ZweifachListe is record
      Index : Integer;
      Inhalt : T;
      
      Vorgaenger : Element_REF;
      Nachfolger : Element_REF;  
   end record;
   
   -- Das aktuell zu nutzende Element
   -- (Gleichzeitig immer unser letztes Element)
   AktuellesElement : Element_REF;
   
   -- Hier speichern wir das zuerst erstellte
   -- Element um immer einen Zugriff hierauf
   -- zu ermoeglichen.
   Start : Element_REF;

   

end dd2ZweifachverketteteListe;

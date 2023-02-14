procedure O8KlassenweiteZeigerUndTypen is
   --- Standard-Klassen
   type Lebewesen is tagged null record;
   
   type Tier is new Lebewesen with null record;
   
   type Fisch is new Tier with null record;
   
   type Vogel is new Tier with null record;
   
   --- Standard-Objekte
   
   Ein_Lebewesen : Lebewesen;
   
   Ein_Tier      : Tier;
   
   Ein_Fisch     : Fisch;
   
   Ein_Vogel     : Vogel;
   
   --- Objektadressen zugreifbar machen
   -- In den entsprechenden Variablen stecken 
   -- jetzt die entsprechenden Adressen dahinter.
   -- Ueber 'Access erhalten wir dann die direkte
   -- Referenz auf das jeweilige Objekt
   
   Ein_Lebewesen_Ref : aliased Lebewesen := Ein_Lebewesen;
   
   Ein_Tier_Ref      : aliased Tier      := Ein_Tier;
   
   Ein_Fisch_Ref     : aliased Fisch     := Ein_Fisch;
   
   Ein_Vogel_Ref     : aliased Vogel     := Ein_Vogel;
   
   --- REFERENZEN
   
   -- Ermoeglicht das Erstellen von Zeigern auf alle
   -- Unterklassen von Lebewesen ueber den gleichen
   -- Typ (Lebewesen_Pointer). Dies laesst logischerweise
   -- dann auch eine entsprechende Typvertraeglichkeit
   -- zu.
   
   -- Hier waere es moeglich diese Zeiger widerrum in
   -- ein Array einzugeben.
   type Lebewesen_Pointer is access all Lebewesen'Class;
   
   -- Erzeugen einer dynamischen zweifachverketteten Liste
   type Zoo_Element;
   
   type Zoo_Pointer is access Zoo_Element;
   
   type Zoo_Element is record
      Vorgaenger : Zoo_Pointer;
      Tier       : Lebewesen_Pointer;
      Nachfolger : Zoo_Pointer;
   end record;

   -- Zur Orientierung an Anfang und Ende, wobei
   -- Ende immer unser zuletzt genutzter Wert ist.
   Start, Ende : Zoo_Pointer;

   -- Erzeugen unseres Zoos (Erstes Element)
   -- Der Inhalt des Zoos (Tier) wird durch die Nutzung
   -- von Alias als Referenz genutzt. Diese unterscheidet
   -- sich jedoch THEORETISCH vom Lebewesen_Pointer. 
   -- Lebewesen_Pointer /= Ein_Lebewesen_Ref
   -- Jedoch funktioniert dies aufgrund von access all ...'Class
   -- dennoch, da alle Kindelemente von Lebewesen als
   -- Access genutzt werden koennen.
   Zoo : Zoo_Pointer := new Zoo_Element'(Vorgaenger => null,
                                         Tier       => Ein_Lebewesen_Ref'Access,
                                         Nachfolger => null);
 
begin
   
   Start := Zoo;
   Ende := Zoo;
   
   Zoo.Nachfolger := new Zoo_Element'(Vorgaenger => Zoo,
                                      Tier       => Ein_Tier_Ref'Access,
                                      Nachfolger => null);
   
   Ende := Zoo.Nachfolger;
   
   -- Ab hier wird immer nur mit dem Ende gearbeitet
   -- (Wie bei dynamische Listen)
   Ende.Nachfolger := new Zoo_Element'(Vorgaenger => Ende,
                                       Tier       => Ein_Fisch_Ref'Access,
                                       Nachfolger => null);
     
   Ende := Ende.Nachfolger;
   
   -- Dieser Part wuerde sich jetzt immer mit neuem Inhalt wiederholen
   Ende.Nachfolger := new Zoo_Element'(Vorgaenger => Ende,
                                       Tier       => Ein_Vogel_Ref'Access,
                                       Nachfolger => null);
     
   Ende := Ende.Nachfolger;
   
   
   -- Um unnoetige Mengen an Code zu sparen bietet es sich an
   -- hier den Debugger zu verwenden und genauer zu betrachten.
   -- Man sieht hier sehr schoen die komplette Hierarchie der jeweiligen Typen,
   -- sowie die Moeglichkeit alle Access Typen, die dem Klassenweiten
   -- Zeiger und dessen Hierarchie entsprechen zu nutzen.
   
   
end O8KlassenweiteZeigerUndTypen;

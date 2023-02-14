with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

-- Procedures konnten zwar durch das Einlesen
-- unsere Werte veraendern, wenn diese Schreibzugriff
-- hatten. Konnten jedoch nichts "zurueckliefern".

-- Das heisst, dass ich in entsprechenden Faellen z.B.
-- statt der Eingabe einer Variable auch meine 
-- "Function" aufrufen kann die den Datentyp meiner
-- gewuenschten zu nutzenden Variable zurueckliefert.

procedure b22Functions is
             
   -- Hier simples Beispiel zum Addieren. Es werden Integer
   -- A und B eingelesen und es wird irgendein Integer 
   -- zurueckgegeben. Wie dies zurueckgegeben wird und 
   -- was innerhalb der Funktion passiert ist egal.
   -- Der Datentyp ist dabei der wichtige Punkt.
   

   function Addieren (A, B : in Integer) return Integer is
   
   begin
      return A+B;
   end Addieren;

   -- Mgl1 : Direktes return des Ergebnisses
   function Vergleich1(A, B : in Integer) return Boolean is     
   begin  
      return A > B;
   end Vergleich1;
   
   -- Mgl2 : Return einer Variable die als Rueckgabe Variable dient
   function Vergleich2(A, B : in Integer) return Boolean is
      
      IstGroesser : Boolean := false;
      
   begin
      
      if A > B then
         IstGroesser := true;
      end if;
      
      return IstGroesser;
      
   end Vergleich2;
   
   
   -- Mgl3 : Mehrere fallabhaengige returns. Dies ist aufgrund
   --        der Lesbarkeit nicht zu bevorzugen.
   function Vergleich3(A, B : in Integer) return Boolean is
      
   begin
      
      if A > B then
         return true;
      else 
         return false;
      end if;
      
      
   end Vergleich3;
   
   -- Aufzeigen welche Moeglichkeit am uebersichtlichsten ist.
   -- 1 fuer kurze Anweisungen
   -- 2 fuer laengere Anweisungen
   -- 3 sollte nicht verwendet werden
   
   -- Wann sollte 3 verwendet werden?:
   -- Mehrere return sind sinnvoll wenn man an entsprechender
   -- Stelle das return setzt um z.B. die Performance zu erhoehen
   -- indem man zusaetzliche Anweisungen bereits an dieser
   -- Stelle verhindert. Dies sollte jedoch abgewogen werden ob
   -- je nach Fall 0,01ms die schlechtere Lesbarkeit aufwiegen.
   -- Hier ist auf eine entsprechend detaillierte Dokumentation
   -- zu achten.
   
   -- ACHTUNG:
   -- Man kann auch fuer Funktionen in und out benutzen, jedoch ist
   -- es dann nicht meoglich eine Funktion als Eingabeparameter zu
   -- verwenden, da der Inhalt der Funktion nicht veraendlich bzw.
   -- beschreibbar ist. 
   
   -- out kann sich also nur auf eine veraenderbare Variable beziehen.
   
   ------------------ Kombination aus procedure und function ----------
   procedure Ausgabe is 
   
      A        : Integer;
      B        : Integer;
      C        : Integer;
      Wahrheit : Boolean;
      Text     : String := "groesser";
                           
      
      -- In weggelassen = Standard Mode "In" 
      -- (Sollte der Lesbarkeit halber dennoch dazgueschrieben werden)
      function Addieren(A, B : Integer) return Integer is 
         
      begin
         -- Zum Aufzeigen, dass dieses Addieren innerhalb der Procedure bevorzugt wird.
         -- Funktion umbenennen um zu zeigen, dass Zugriff auf die aeussere Function
         -- Addieren ebenfalls moeglich ist. (z.B. Addieren in Addieren2)
         Put_Line("Inneres Addieren");
         return A+B;
      end Addieren;
      
   
   begin
   
      -- Eingabe
      Put("A : ");
      Get(A);
      
      Put("B : ");
      Get(B);
      
      C := Addieren(A, B);
      
      Put_Line("C = " & Integer'Image(A) & " + " & Integer'Image(B) & " = " & Integer'Image(C));
      
      Wahrheit := Vergleich1(A , C);
      
      if Wahrheit = false then
         -- Beachten, dass der String so gross ist
         -- wie der Ursprungsstring (8 Zeichen)
         Text := "kleiner ";
      end if;
      
      Put_Line("A : " & Integer'Image(A) & " ist " & Text & " als C : " & Integer'Image(C));
         
   end Ausgabe;
   
   ------------------ Überladung ----------
   -- Darauf hinweisen, dass Überladung auch bei procedures moeglich ist
   -- aufgrund der Steigerung jedoch erst hier erwaehnt wird.
   
   -- Bedeutet, dass gleiche Funktionen / Prozeduren Bezeichner genutzt
   -- werden koennen solange sich folgende Eigenschaften unterscheiden:
   -- 1. Anzahl der Parameter
   -- 2. Datentyp des Parameters (Auch bei gleicher Bezeichnung)
   -- 3. Art des Unterprogramms (Prozedur oder Funktion)
   --    --> Der Rueckgabewert unerscheidet sich quasi bei einer
   --        Prozedur von einer Funktion. Man nennt dies auch
   --        void, da eine Prozedur quasi einen leeren Rueckgabe
   --        Parameter hat.
   
   -- function Addieren (A, B : in Integer) return Integer is --> Bereits vorhanden
   
   -- Ja auch parameterlos ist moeglich
   function Addieren return Integer is 
   begin
      return 0;
   end Addieren;
   
   function Addieren(A, B, C : Integer) return Integer is
   begin
      return 0;
   end Addieren;
   
   function Addieren(A, B : Integer) return Boolean is
   begin
      return true;
   end Addieren;
   
   function Addieren(A, B : Boolean) return Integer is
   begin
      return 0;
   end Addieren;
   
   function Addieren(A, B : Boolean) return Boolean is
   begin
      return true;
   end Addieren;
   
   -- Keine Implementierung der ueberladenen Funktionen, da
   -- die Kompilierung ausreichend ist um die Funktion aufzuzeigen.
   
   -- Wichtig ist bei der Ueberladung auch wieder die Beruecksichtigung
   -- der Dokumentation und Kommentierung um fuer entsprechende
   -- Klarheit zu sorgen. Oftmals bietet sich Ueberladung an um eine
   -- Beruecksichtigung verschiedener Eingabetypen zu unterscheiden.
   -- z.B. Get konnete man in Text_IO ueberladen um auch die Eingabe
   --      von Integern moeglich zu machen ohne extra Integer_IO
   --      nutzen zu muessen.
   
   
   ------------- Besonderheit: String-Eingabe am Beispiel einer parameterlosen Funktion ---------------
   -- Man muss nicht wie gewohnt die Laenge des Strings vorgeben.
   function Ausgabe(Text : in String) return Integer is 
   begin
      Put_Line(Text);
      return Text'Length;
      
   end Ausgabe;
   
   -- Es ist auch moeglich eine Function zur Initialisierung zu nutzen
   -- Hier auch schoen zu sehen, dass es auch ohne Parameter geht.
   
   function Eingabe return String is
   begin
      
      return "test";
   
   end Eingabe;
   
   
   Text : String := Eingabe;
   
   -- ACHTUNG:
   -- Der String hat natuerlich dann auch die Laenge 
   -- des entsprechenden eingelesenen Strings.
                  
begin
   Put_Line(Integer'Image(Addieren(5,5)));
   
   
   -- Man sieht, dass auch Kombinationen der verschiedenen Funktionen
   -- moeglich sind und der entsprechende Rueckgabewert der Funktion
   -- entsprechend dem gewuenschten Datentyp genutzt werdne kann.
   
   -- Einschraenkungen der Moeglichkeiten sind gem. der Typisierung
   -- weiterhin moeglich.
   Put_Line("4 > 5? : " & Boolean'Image(Vergleich1(Addieren(2,2), 5)));
   
   Put_Line("8 > 2? : " & Boolean'Image(Vergleich2(8, Addieren(1,1))));
   
   Put_Line("10 > 55? : " & Boolean'Image(Vergleich3(Addieren(5,5), Addieren(33, 22))));
   
   Ausgabe;
   
   -- String-Besonderheit (Keine Laengenangabe moeglich, da diese 
   -- anhand der Eingabelaenge bestimmt wird): 
   Put_Line(Integer'Image(Ausgabe("0123456789")));
   
   
   
end b22Functions;

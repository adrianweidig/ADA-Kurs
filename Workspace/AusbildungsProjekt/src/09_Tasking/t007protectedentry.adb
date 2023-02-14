with Ada.Text_IO, Ada.Task_Identification;

use Ada.Text_IO, Ada.Task_Identification;

-- AUSBILDERHINWEIS:
-- Der hier enthaltene Beispielcode
-- ist teilweise ein wenig verwirrend.
-- Achte darauf die richtigen Zeilen
-- auszukommentieren und ggf. den Code
-- nochmals selbst anhand der Kommentare
-- etc. selbst nachzuprogrammieren. 

-- 1. Fall: Zahl statt Integer_Objekt in den 
--    Tasks erhohen um die Fehler aufzueigen,
--    welche in der Konsole zu sehen sind.
--    (Klassisches Problem wenn 2 Tasks auf 
--     die gleichen Daten zugreifen)
-- 2. Fall: Integer_Objekt benutzen um 
--    anhand der auftretenden Zahlen zu
--    zeigen, dass die Tasks sich "richtig"
--    verhalten. Egal welcher priorisiert
--    wird, es arbeitet definitiv nur ein
--    Task an den Daten. 


procedure T007ProtectedEntry is
   
   -- Vergleichsobjekt
   Zahl : Integer := 100_000;
   
   -- BEGINN GESCHUETZTES OBJEKT
   protected Integer_Objekt is

      -- Entry erlaubt es den Zusatzfaktor
      -- when mit anzuschliessen welcher quasi
      -- einen Schluessel beschreibt, welcher
      -- benoetigt wird.
      entry Set (Inhalt : Integer);
      function  Get return Integer;
      
      -- Zeigen, dass wenn man hier
      -- ohne Einschraenkung Zugang zulaesst,
      -- man einen Deadlock provoziert.
      procedure SetZugang (AufZu : Boolean);
   private
      Objektinhalt : Integer := 1_000;
      
      -- Man kann verschiedene Ansaetze waehlen
      -- um einen entsprechenden Ein- / Ausstieg
      -- zu erlauben. Man koennte z.B. erst den
      -- Zugang wieder zulassen, wenn der Wert
      -- einmal ausgelesen wurde.
      Zugangserlaubnis : Boolean := True;
   end Integer_Objekt;
   
   protected body Integer_Objekt is 
      -- Laesst Set nur zu, wenn Zugangserlaubnis = true
      entry Set (Inhalt : Integer) when Zugangserlaubnis is
      begin
         Zugangserlaubnis := False;
         Objektinhalt := Inhalt;   
         Put_Line("Inhalt festgelegt: " & Integer'Image(Objektinhalt));
      end Set;
      
      function  Get return Integer is
      begin
         -- ACHTUNG:
         -- "Protected function cannot modify protected object"
         -- Zugangserlaubnis := True;
         return Objektinhalt;
      end Get;
      
      procedure SetZugang (AufZu : Boolean) is
      begin
         Zugangserlaubnis := AufZu;
      end SetZugang;
   end Integer_Objekt;
   -- ENDE GESCHUETZTES OBJEKT
   
   task Task1 is
      -- Task1 und 2 die Priority tauschen um zu sehen,
      -- dass wenn gleiche Tasks zur gleichen Zeit versuchen
      -- zuzugreifen anhand der Priority bevorzugt wird. 
      
      -- Je groesser der Priority Unterschied, desto oefter
      -- wird der Task mit der hoeheren Priority bevorzugt.
      pragma Priority(0);
   end Task1;
   
   task body Task1 is 
   begin
      loop
         -- BLOSS KEIN DELAY REINMACHEN
         -- Man braucht die Menge an Werten um
         -- das Ergebnis zu erzielen, dass 
         -- 2 Tasks ploetzlich annaehernd gleichzeitig
         -- auf die Inhalte zugreifen.
         
         -- SetZugang nutzen um Deadlock zu zeigen
         -- Integer_Objekt.SetZugang(False);
         
         Integer_Objekt.Set(Integer_Objekt.Get + 1);
         Integer_Objekt.SetZugang(True);
         
         
         -- VERGLEICH MIT NORMALER ZAHL
         --  Zahl := Zahl -1;
         --  Put_Line("Task 1: " & Integer'Image(Zahl));
      end loop;
   end Task1;
   
   task Task2 is
      pragma Priority(1);
   end Task2;
   
   task body Task2 is
   begin
      loop
         -- BLOSS KEIN DELAY REINMACHEN
         -- Man braucht die Menge an Werten um
         -- das Ergebnis zu erzielen, dass 
         -- 2 Tasks ploetzlich annaehernd gleichzeitig
         -- auf die Inhalte zugreifen.
         
         -- SetZugang nutzen um Deadlock zu zeigen
         --   Integer_Objekt.SetZugang(False);         
         Integer_Objekt.Set(Integer_Objekt.Get - 1);
         Integer_Objekt.SetZugang(True);
         
         --  Zahl := Zahl +1;
         --  Put_Line("Task 2: " & Integer'Image(Zahl));
      end loop;
   end Task2;
   
begin
   null;
end T007ProtectedEntry;

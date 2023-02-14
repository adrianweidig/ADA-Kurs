with Ada.Text_IO; use Ada.Text_IO;

procedure b21Procedures is
   ------------------ Procedure (Void-Methode) ---------------
   
   -- Zu Beachten ist hier, dass das Unterprogramm "Vertauschen"
   -- zugehoerig dem Programm "b21Unterprogramm" ist.

   -- Eine Procedure verarbeitet Parameter oder fuehert auch
   -- etwas ohne Parameter durch. Hierbei geht es um den reinen
   -- Aufruf dessen und des Abarbeitens des Inhaltes.
   
   -- Deklarieren der "Procedure"
   procedure Vertauschen (A, B :  in out Integer);

   -- Initialisieren der "Procedure"
   -- Aufzeigen, dass man ueber den linken Pfeil die 
   -- Definition des Inhaltes minimieren kann.
   procedure Vertauschen (A, B :  in out Integer) is

      Zwischenvariable : Integer;
   begin
      -- A zwischenspeichern
      Zwischenvariable := A;
   
      -- B und A sind jetzt gleich
      A := B;
   
      -- Dadurch sind B und A nun in den Werten vertauscht
      B := Zwischenvariable;
   end Vertauschen;
   
   A : Integer := 10;
   B : Integer := 500;
   
   -- in : Wird in ausgewaehlt duerfen die Parameter innerhalb
   --      der Procedure nicht veraendert werden. 
   -- Man koennte dies als lesenden Zugriff beschreiben.
   -- ACHTUNG: "In"-Mode ist der Standard Zugriff. Das heisst, 
   --          dass Parameter erst veraendert werden koennen,
   --          wenn dies explizit beschrieben ist. 
   
   -- out: Die angegebenen Parameter koennen innen veraendert
   --      werden, jedoch erhalten nicht die Inhalte der Parameter.
   --      Warning: "A / B" may be referenced before it has a value
   --      --> Bedeutet, dass wir nach "aussen" hin Zugriff auswirken
   --          koennen jedoch die Inhalte nicht "rein"  bekommen. 
   -- Man koennte dies als schreibenden Zugriff beschreiben.
   
   -- in out: Bedeutet, dass wir sowohl die Inhalte der Parameter
   --         erhalten, diese "innen" veraendern koennen und wieder
   --         nach "aussen" hin veraendern koennen.
   -- Man koennte dies als lesenden und schreibenden Zugriff beschreiben.
   
   --         Achtung: Zurueckgeben waere hier das falsche Wort.
   
   ------------------ Parameterlose-Procedure ---------------
   -- Deklaration und Initialisierung gleichzeitig
   -- BEACHTE: Da nichts angegeben hat diese Procedure then
   --          "In"-Mode
   procedure Ausgabe is 
      
      -- Diese innere Procedure ist nur innerhalb, der Procedure
      -- Ausgabe nutzbar. Kann jedoch auf alle aeusseren Inhalte
      -- zugreifen. (Vertauschen und A und B sind alles globale bzw.
      -- aeussere Procedure / Variablen)
      procedure Ausgabe2 is 
         
      begin
         Put_Line("Wir befinden uns in Ausgabe2");
         Vertauschen(A, B);
         Put_Line("A = " & Integer'Image(A));
         Put_Line("B = " & Integer'Image(B));
      end Ausgabe2;
      
      
   begin
      Put_Line("A = " & Integer'Image(A));
      Put_Line("B = " & Integer'Image(B));
      Ausgabe2;
      
   end Ausgabe;
   
   
   ------------------ Rekursion ---------------
   procedure Zaehlen is
      A : Integer := 0;
      B : Integer := 10;
      
      -- Beachte: Der Zugriff findet auf das lokale A und B statt
      procedure hochzaehlen(A : in out Integer) is
         
      begin
         A := A + 1;
         Put_Line(Integer'Image(A));
         if A < B then
            -- Hier wird die Methode selbst immer wieder aufgerufen.
            -- Jedoch nur solange bis die Abbruchbedingung erfuellt ist.
            
            -- Eine Abbruchbedingung ist bei der Rekursion essentiell,
            -- da es ansonsten sehr schnell zu einem sogenannten Stack-
            -- Overflow kommen kann der im schlimmsten Fall sogar dem
            -- System schaden kann (Eher bei Mikroprozessoren als bei
            -- modernen Computer). Manche Compiler koennen einen 
            -- Overflow auch erkennen und lassen dies dann gar nicht erst zu
            -- bzw. warnen den Entwickler. 
            hochzaehlen(A);
         end if;
         
         
         -- Zum Vorzeigen die Schleife und Put_Line auskommentieren (Put_Line
         -- Verzoegert. Dadurch entsteht dann der Fehler:
         -- raised STORAGE_ERROR : EXCEPTION_STACK_OVERFLOW
         
         -- Nur wenige Programmiersprachen unterstuetzen sogenannte "Tail Call
         -- Optimization (TCO)", welche darauf ausgelegt ist derartige Rekursion
         -- bereits vor dem eigentlich Ablauf zu optimieren. 
         
         -- Rekursion ist daher in den seltensten Faellen die schnellere Variante.
         -- Jede Rekursion laesst sich durch eine Iteration ersetzen und ist 
         -- aufgrund der moeglichen Vorimplementierungen der Iteration sicherer und
         -- schneller. In wenigen Anwendungsfaellen und nur unter Beruecksichtigung
         -- aller Grenzfaelle kann eien Rekursion schneller sein.
      end hochzaehlen;
      
   begin
      hochzaehlen(A);
      Put_Line("Procedure Zaehlen ist beendet.");
   end Zaehlen;
   
   ------------------ Kombinierte Parameter ---------------
   -- Diese procedure ist deklariert und initialisiert
   -- Wir lesen nun A, B und C ein und veraendern jedoch C innerhalb
   -- unserer procedure.
   
   -- A und B -> Leserechte ,  C -> Schreibrechte
   
   -- ACHTUNG:
   -- Die einzulesenden Namen sind egal. Die Bezeichner der entsprechenden
   -- Variable sind wichtig fuer das Verhalten INNERHALB der procedure.
   procedure C_Addierer(A, B : in Integer; C : out Integer) is
   begin
      C := A + B;
   end C_Addierer;   
   
begin   
   Put_Line("A = " & Integer'Image(A));
   Put_Line("B = " & Integer'Image(B));
   
   -- Aufruf der Procedure / Methode mit
   -- Uebergabe der Parameter
   Vertauschen(A,B);
  
   -- Parameterlos kann ohne Klammen aufgerufen werden
   Ausgabe;
   
   -- Rekursion
   Zaehlen;
   
   -- Kombinierte Parameter
   -- WAS PASSIERT HIER:
   -- 1. Wir lesen A fuer den Parameter A unserer procedure ein
   -- 2. Wir lesen B fuer den Parameter B unserer procedure ein
   -- 3. Wir lesen A fuer den Parameter C unserer procedure ein
   
   -- 4. Uebersetzt wuerde in unserer procedure C_Addierer also stehen:
   -- A := A + B --> A = 10, B = 500 --> A = 510
   
   -- Man sieht also sehr schoen, dass die Uebergabeparameter nicht
   -- entsprechend der "inneren" Parameter sein muessen. Die Bezeichner
   -- der Parameter sind nur wichtig fuer das innere unseres Aufrufs.
   -- Eine mehrmalige Verwendung verschiedener Eingabeparameter ist
   -- hier zulaessig.
   C_Addierer(A,B,A);
   
   Put_Line(Integer'Image(A));

end b21Procedures;

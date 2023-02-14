with Ada.Text_IO, System.Address_Image;

use Ada.Text_IO;

procedure d5AccessUnterprogramme is
   
   procedure Ausgabe1(Zahl : Integer) is 
   begin
   
      Put_Line("Ausgabe1: " & Integer'Image(Zahl));
      
   end Ausgabe1;
   
   procedure Ausgabe2(Zahl : Integer) is 
   begin
   
      Put_Line("Ausgabe2: " & Integer'Image(Zahl));
      
   end Ausgabe2;
   
   ---------------- Schleife -------------
   --- bzw. Sequenzen von Unterprogrammen
   
   -- Jetzt wirds abgefahren
   -- Das heisst, dass Variablen von diesem Typen
   -- lediglich der rechts angegebenen Signatur 
   -- entsprechen muessen um zu funktionieren.
   type Ausgabe_Prozedur is access procedure (Zahl : Integer);
   
   Prozedur_Variable  : Ausgabe_Prozedur;
   
   Prozedur_Variable2 : Ausgabe_Prozedur;
   
   -- Wir legen also quasi ein Array mit mehreren Prozeduren
   -- als Element an. Die Grenzen sind wie gewohnt nutzbar.
   Prozedur_Sequenz  : array (1 .. 10) of Ausgabe_Prozedur;
   
   Zahl : Integer := 1;
   
begin
   -- Ich erhalte Zugriff auf die Referenz im Speicher.
   -- Somit haben wir hier einen Pointer der statt auf
   -- einen Datentyp auf ein Unterprogramm zeigt. Dies
   -- machen Programmierspraachen z.B. auch bei der 
   -- Verwendung von Schleifen. Wird eine Schleife erkannt
   -- in der z.B. ein Unterprogramm aufgerufen wird, wird
   -- die Referenz im Speicher einmalig angelegt und 
   -- dann fuer die Wiederholungsrate der Schleife 
   -- immer wieder aufgerufen.
   
   -- Steht nun Stellvertretend fuer die Referenz der
   -- Ausgabe1
   Prozedur_Variable := Ausgabe1'Access; 
   
   -- .all kann weggelassen werden. Der Aufruf
   -- ueber die Variable funktioniert ganz normal
   -- wie bei jedem anderen Unterprogramm.
   Prozedur_Variable.all(20);
   
   Prozedur_Variable := Ausgabe2'Access;
   
   Prozedur_Variable(50);
   
   -- Wann bietet sich das an?
   -- Es wirkt ein wenig wie die Funktionalitaet von
   -- Generik kann jedoch bei richtigem Verstaendnis
   -- und Anwendung performanter und kuerzer zugleich
   -- sein.
   
   New_Line;
   
   ---------------- Schleife -------------
   Prozedur_Variable := Ausgabe1'Access;
   Prozedur_Variable2:= Ausgabe2'Access;
   
   Prozedur_Sequenz := (1..5 => Prozedur_Variable, 6..10 => Prozedur_Variable2);

   -- Ruft nun die Elemente des Arrays wie gewohnt auf.
   -- Nur, dass die Elemente selbst Unterprogramme sind.
   
   -- ACHTUNG: Bei parameterlosen Unterprogrammen muss
   -- man .all benutzen. Sind Parameter vorhanden kann
   -- wie bei Arrays und Records auf .all verzichtet 
   -- werden. .all macht es jedoch lesbarer.
   for I in Prozedur_Sequenz'Range loop
     
      Prozedur_Sequenz(I).all(I);
      
      -- Auch moeglich, wenn die enthaltenen Unterprogramme
      -- Parameter erwarten.
      
      -- Prozedur_Sequenz(I)(I);
      
   end loop;
   
   New_Line;
   
   ---- Weitere Moeglichkeit der Nutzung ----
   -- Eliminiert alle Inhalte (Zugriffe rufen Constraint Error auf)
   Prozedur_Sequenz := (others => null);
   
   -- Man beachte, dass die Stellen 3-7 nun null sind
   -- Der Zugriff auf allgemein vorhandene Unterpgrogramme
   -- ueber 'Access gibt uns die Moeglichkeit diese hier
   -- einzureihen.
   Prozedur_Sequenz := (1..2 => Ausgabe2'Access, 8..10 => Ausgabe1'Access, others => null);
   
   -- Die For-Each Loesung ist auch wieder nutzbar
   -- Beachte: Kein Zugriff auf den Zaehler
   for Prozedur of Prozedur_Sequenz loop
      if Prozedur /= null then
         Prozedur(Zahl);
         Zahl := Zahl +1;
      end if;
   end loop;
   
   
   
end d5AccessUnterprogramme;

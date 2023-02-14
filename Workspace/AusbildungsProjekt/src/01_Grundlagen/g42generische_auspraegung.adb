with Ada.Text_IO; use Ada.Text_IO;

procedure g42Generische_Auspraegung is
   
   type ZIFFER_T is ('0','1','2','3','4','5','6','7', '8','9','A','B','C','D','E','F');
   
   Ziffer1, Ziffer2 : ZIFFER_T;
   
   type ZAHL_T   is range 0 .. 100;
   
   Zahl1, Zahl2     : ZAHL_T;
   
   type KOMMA_T  is new Float range -10.0 .. 10.0;
   
   Komma1, Komma2  : KOMMA_T;
   
   -- Definiert eigene Pakete welche vom angegebenen Paket alle Eigenschaften erben,
   -- jedoch nur die dem Typ entsprechenden Richtlinien akzeptiert. 
   -- ZIFFER_T --> Enumeration
   -- ZAHL_T   --> Integer
   -- Dies ist mit anderen Datentypen entsprechend ebenfalls moeglich.
   -- Es bietet hoehere Sicherheit bei der Nutzereingabe, da falsche 
   -- Eingaben auf gleiche Weise abgefangen werden ohne eine vorherige 
   -- oder vorangehende Pruefung noetig zu machen. 
   
   package Ziffer_IO is new Ada.Text_IO.Enumeration_IO(ZIFFER_T);
   
   package Zahl_IO   is new Ada.Text_IO.Integer_IO(ZAHL_T);
   
   package Komma_IO is new Ada.Text_IO.Float_IO(KOMMA_T);
   
begin
   
   -- Nutzereingabe (Get und Put Funktionen nun durch die XX_IO packages enthalten)
   -- ACHTUNG: 
   -- Die Nutzereingabe muss wie angegeben mit '' etc. ausgefuehrt werden
   -- abhaengig davon wie der Typ deklariert ist.
   Put("Ziffer1:");
   Ziffer_IO.Get(Ziffer1);
   Put("Ziffer2:");
   Ziffer_IO.Get(Ziffer2);
   
   Put("Zahl1:");
   Zahl_IO.Get(Zahl1);
   Put("Zahl2:");
   Zahl_IO.Get(Zahl2);
   
   Put("Komma1:");
   Komma_IO.Get(Komma1);
   Put("Komma2:");
   Komma_IO.Get(Komma2);
   
   -- Ausgaben weiterhin wie gewohnt moeglich unter Nutzung
   -- des entsprechenden Typs 
   -- ODER durch XXX_IO.Put() --> KEIN Absatz im Anschluss
   Put_Line("Ziffer 1:" & ZIFFER_T'Image(Ziffer1));
   Put_Line("Ziffer 2:" & ZIFFER_T'Image(Ziffer2));
   
   Put_Line("Zahl 1: " & ZAHL_T'Image(Zahl1));
   Put_Line("Zahl 2: " & ZAHL_T'Image(Zahl2));
   
   -- Moeglichkeiten speziell fuer Floats
   -- Stelle 1 --> Variable selbst
   -- Stelle 2 --> Linke Seite des Kommas (Stellen)
   -- Stelle 3 --> Nachkommastellen
   -- Stelle 4 --> Exponent
   -- 2 gleiche Zahlen und +- ausprobieren
   Komma_IO.Put(Komma1, 5, 5, 1);
   
   New_Line;
   
   Komma_IO.Put(Item => Komma2, Fore => 10, Aft  => 2, Exp  => 0);
   
   
   
   
end g42Generische_Auspraegung;

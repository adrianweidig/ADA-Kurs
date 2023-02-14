with Ada.Text_IO; use Ada.Text_IO;

procedure g32untertypen is
   type TAG_T                   is (Montag, Dienstag, Mittwoch, Donnerstag, Freitag, Samstag, Sonntag);
   
   -- Generiert die entsprechenden Untertypen die jedoch nur den festgelegten
   -- Wertebereich akzeptieren.
   subtype WOCHENTAG_T          is TAG_T range Montag .. Freitag;
   subtype WOCHENENDTAG_T       is TAG_T range Freitag .. Sonntag;
   
   -- Verschiedene Moeglichkeiten die entsprechenden Tage zu deklarieren
   -- und zu initialisieren.
   Tag1 : WOCHENTAG_T      := Montag;
   Tag2 : WOCHENTAG_T      := TAG_T'Val(1);
   Tag3 : TAG_T            := TAG_T'Val(2);
   Tag4 : TAG_T            := WOCHENTAG_T'Val(3);
   
   -- Funktioniert, da Val(4) --> Freitag und ist in beiden Typen innerhalb der Reichweite
   Tag5 : WOCHENTAG_T      := WOCHENENDTAG_T'Val(4); 
   Tag6 : WOCHENENDTAG_T   := Samstag;
   
   -- Achtung:
   -- Man sieht sehr schoen, dass sich Val (somit auch Pos)
   -- immer auf den Obertypen beziehen.
   Tag7 : WOCHENENDTAG_T   := WOCHENENDTAG_T'Val(6);
  
begin
   
   -- Der Obertyp ist dennoch immer nutzbar
   Put_Line(TAG_T'Image(Tag1));
   Put_Line(TAG_T'Image(Tag2));
   Put_Line(TAG_T'Image(Tag3));
   Put_Line(TAG_T'Image(Tag4));
   Put_Line(TAG_T'Image(Tag5));
   Put_Line(TAG_T'Image(Tag6));
   Put_Line(TAG_T'Image(Tag7));
   
   New_Line;
   
   -- Nutzung der Position um Werte zu erhalten
   -- Zum Aufzeigen Wochentag / ..Endtag auf einen Wert 
   -- legen der nicht innerhalb der Reichweite ist
   Put_Line(TAG_T'Image(TAG_T'Val(3)));
   Put_Line(TAG_T'Image(TAG_T'Val(4)));
   Put_Line(TAG_T'Image(TAG_T'Val(5)));
   Put_Line(TAG_T'Image(WOCHENTAG_T'Val(4)));
   Put_Line(TAG_T'Image(WOCHENENDTAG_T'Val(5)));
   
   -- Aufzeigen der entsprechenden Positionen und deren
   -- Abhaengigkeit vom Obertyp
   Put_Line(Integer'Image(TAG_T'Pos(Montag)));
   Put_Line(Integer'Image(WOCHENTAG_T'Pos(Dienstag)));
   Put_Line(Integer'Image(TAG_T'Pos(Mittwoch)));
   Put_Line(Integer'Image(WOCHENTAG_T'Pos(Donnerstag)));
   Put_Line(Integer'Image(WOCHENTAG_T'Pos(Freitag)));
   Put_Line(Integer'Image(TAG_T'Pos(Samstag)));
   Put_Line(Integer'Image(WOCHENENDTAG_T'Pos(Sonntag)));
   
   -- Zuweisungen
   Tag1 := Tag4; -- Funktioniert da ein Wochentag auch ein Tag ist
   Tag4 := Tag1; -- Wie zuvor.
   
   -- Wird kompiliert aber wird zur Laufzeit einen CONSTRAINT_ERROR
   -- werfen, da Tag7 nicht innerhalb der Reichweite von Wochentage
   -- ist. 
   -- Tag1 := Tag7; 
   
   -- Menge der Typelemente (Beispielhaft) [+1 da man bei 0 anfaengt zu zaehlen]
   -- Hier sieht man schoen, dass First und Last sich auf den subtyp selber beziehen
   Put_Line(Integer'Image(WOCHENTAG_T'Pos(WOCHENTAG_T'Last)-WOCHENTAG_T'Pos(WOCHENTAG_T'First)+1));
   Put_Line(Integer'Image(WOCHENENDTAG_T'Pos(WOCHENENDTAG_T'Last)-WOCHENENDTAG_T'Pos(WOCHENENDTAG_T'First)+1));
 
    
end g32untertypen;

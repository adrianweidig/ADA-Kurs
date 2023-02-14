with Ada.Text_IO; use Ada.Text_IO;

-- Switch Case Anweisungen bieten sich gerade im Bezug 
-- auf Fallunterscheidungen mit Enumerationen an. Es
-- sind selbstverstaendlich auch moeglich.

procedure g52Kontrollstrukturen_Switch_Case is
   
   -- Enumerationstyp
   type TAG_T is (Montag, Dienstag, Mittwoch, Donnerstag, Freitag, Samstag, Sonntag);
   
   -- Festlegung der Nutzereingaben durch Zuhilfenahme generischer Auspraegung
   package TAG_IO is new Ada.Text_IO.Enumeration_IO(TAG_T);
   
   -- Speichervariable fuer die Nutzereingabe
   Nutzereingabe : TAG_T;
   
begin
   
   -- Die Nutzereingabe selbst
   TAG_IO.Get(Nutzereingabe);
  
   -- Was wurde eingegeben?
   Put_Line("Es ist also " & TAG_T'Image(Nutzereingabe));
   
   -- Fallunterscheidung mit Angabe des zu ueberpruefenden Wertes
   case Nutzereingabe is 
      -- Wertebereiche koennen wie bei der Nutzung von range genutzt werden
      when Dienstag .. Donnerstag
         => Put_Line("Noch viel zu lange bis zum Wochenende!");
      when Freitag
         => Put_Line("Bald ist Wochenende!");
         -- Das oder Zeichen ( | ) ist hier zu nutzen statt or
      when Samstag | Sonntag
         => Put_Line("HOCH DIE HÄNDE WOCHENENDE!");
      when others
         => Put_Line("Montag....");
   end case;
   
   -- Konditionale Schreibweise (Erst ab ADA 2012)
   -- Erlaubt die vereinfachte Schreibweise innerhalb einer 
   -- Anweisung.
   Put_Line(case Nutzereingabe is
               when Montag => "Montag",
               when Dienstag | Mittwoch => "Dienstag oder Mittwoch",
               when Donnerstag .. Freitag => "Donnerstag oder Freitag",
               when others => "Samstag oder Sonntag");
   
   
end g52Kontrollstrukturen_Switch_Case;

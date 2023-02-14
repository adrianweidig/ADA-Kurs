with Ada.Text_IO, dd2ZweifachverketteteListe;

use Ada.Text_IO;

procedure dd2MainZweifachListe is
   
   package IntegerListe is new dd2ZweifachverketteteListe(T => Integer);
   
begin
   
   -- Elemente hinzufuegen
   IntegerListe.add(Element => 10);
   IntegerListe.add(Element => 9);
   IntegerListe.add(Element => 8);
   IntegerListe.add(Element => 7);
   IntegerListe.add(Element => 6);
   IntegerListe.add(Element => 5);
   
   -- Liste ausgeben
   IntegerListe.print;
   
   -- Groesse unserer Liste
   Put_Line("Groesse der Liste:" & IntegerListe.getSize'Image & " Elemente");
   
   -- Wo ist ein Element?
   Put_Line("Der Wert 9 taucht an der Index-Position" & IntegerListe.getPos(Inhalt => 9)'Image & " auf.");  

   -- Nicht enthaltene Elemente
   IntegerListe.remove(Index  => 8);
   IntegerListe.remove(Inhalt => 20);
   
   -- Enthaltene Elemente
   IntegerListe.remove(Index  => 2); -- Entfernt Element mit Inhalt 8
   
   -- Liste ausgeben
   IntegerListe.print;
   
   IntegerListe.remove(Inhalt => 6); -- Entfernt Element DANN an Stelle 3
   
   -- Liste ausgeben
   IntegerListe.print;
   
   Put_Line("Erste  Stelle nun: " & IntegerListe.getFirst'Image);
   Put_Line("Letzte Stelle nun: " & IntegerListe.getLast'Image);
   
   -- Erste und Letzte Stelle entfernen
   IntegerListe.remove(Index => 0);
   
   -- Liste ausgeben
   IntegerListe.print;
   
   IntegerListe.remove(Index => 2);
   
   -- Liste ausgeben
   IntegerListe.print;

   IntegerListe.remove(Index => 1);
   
   -- Liste ausgeben
   IntegerListe.print;
   
   IntegerListe.remove(Index => 0);
   
   -- Liste ausgeben
   IntegerListe.print;
   
end dd2MainZweifachListe;

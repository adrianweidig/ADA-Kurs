with Ada.Real_Time, Ada.Text_IO;

use Ada.Real_Time, Ada.Text_IO;

procedure T005VerzoegerungBis is
   
   -- Einfach eine Prozedur welche Zeit 
   -- fuer die Durchfuehrung benoetigt.
   -- Hier mit delay veranschaulicht.
   procedure Verzoegern is
   begin 
      -- AUSBILDERHINWEIS:
      -- Wert aendern und anhand des Outputs
      -- mit LTn besprechen.
      delay 0.5;
   end Verzoegern;
   
   -- Standardverzoegerung, bei der die 
   -- angegebene Zeit fest gewartet wird.
   -- Egal welche Zeit fuer die Ausfuehrung
   -- restlicher Befehle benoetigt wird.
   task Verzoegerung is
      entry Start;
   end Verzoegerung;
   
   task body Verzoegerung is
      
      -- Die aktuelle Zeit zu der der Task startet
      Startzeit : Time := Clock;  
      
      -- Zum Errechnen der vergangenen Zeit
      Aktuelle_Zeit   : Time; 
      Vergangene_Zeit : Time_Span;
    
   begin 
      select
         
         accept Start  do
            for I in 1 .. 10 loop
               -- Feste Wartezeit
               delay 1.0;
                 
               -- Zeitintensive Ausfuehrungen
               Verzoegern;
               
               -- Wir nehmen immer den Startzeitpunkt des Tasks,
               -- sowie die aktuelle Zeit. Die Differenz daraus
               -- ist die seit dem Startpunkt vergangene Zeit.
               Aktuelle_Zeit := Clock;
               Vergangene_Zeit := Aktuelle_Zeit - Startzeit;
               
               Put_Line(Integer'Image(I) & ". Durchlauf");
               Put_Line("Benoetigte Zeit: " & Duration'Image(To_Duration(Vergangene_Zeit)) & " Sekunden.");
                 
            end loop;
         end Start;
         
      or 
           
         terminate;
           
      end select;
      
   end Verzoegerung;
   
   
   task VerzoegerungBis is
      entry Start;
   end VerzoegerungBis;
   
   task body VerzoegerungBis is
       
      -- Die aktuelle Zeit zu der der Task startet
      Startzeit : Time := Clock;
      
      -- Die Zeitspanne die wir fuer die Verzoegerung
      -- einschliesslich Ausfuehrungen benoetigen 
      -- wollen (Je genauer wir die Einheit waehlen,
      -- desto besser)
      Wartezeit : constant Time_Span := Milliseconds(1000);
      
      -- Naechster Zeitpunkt bis zu welchem gewartet
      -- werden soll.
      -- Wir wollen immer vom aktuellen (!) Startzeitpunkt
      -- aus bis zur naechst folgenden Wartezeit warten.
      Zeitpunkt : Time := Startzeit + Wartezeit;
      
      
      -- Zum Errechnen der vergangenen Zeit
      Aktuelle_Zeit   : Time; 
      Vergangene_Zeit : Time_Span;
    
   begin 
      select
         
         accept Start  do
            for I in 1 .. 10 loop
               -- Nun heisst es explizit, dass bis
               -- zum Zeitpunkt X welcher ausgehend von
               -- unserer Startzeit einschliesslich der
               -- gewuenschten Wartezeit geht. 
               
               -- WICHTIG:
               -- Hier handelt es sich um eine Einheit, welche
               -- sich wie eine Uhrzeit zur Laufzeit vorzustellen
               -- ist. Deshalb benoetigen wir die "Uhrzeiten"
               -- zur Laufzeit und addieren zur jeweiligen Uhrzeit
               -- die gewuenschte Wartezeit um den Zeitpunkt in
               -- der "Zukunft" zu erhalten auf welchen gewartet
               -- werden soll.
               delay until Zeitpunkt;
                 
               -- Wir nehmen immer den Startzeitpunkt des Tasks,
               -- sowie die aktuelle Zeit. Die Differenz daraus
               -- ist die seit dem Startpunkt vergangene Zeit.
               Aktuelle_Zeit := Clock;
               Vergangene_Zeit := Aktuelle_Zeit - Startzeit;
               
               Put_Line(Integer'Image(I) & ". Durchlauf");
               Put_Line("Benoetigte Zeit: " & Duration'Image(To_Duration(Vergangene_Zeit)) & " Sekunden.");
      
               -- Zeitintensive Ausfuehrungen
               Verzoegern;
               
               -- Festlegen des neuen / naechsten Zeitpunktes
               -- bis zu welchem gewartet werden soll.
               Zeitpunkt := Zeitpunkt + Wartezeit;
                 
            end loop;
         end Start;
         
      or 
           
         terminate;
           
      end select;
   end VerzoegerungBis;
   
begin
   
   -- Wir sehen, dass bei 10 Durchlaeufen 15 Sekunden
   -- benoetigt werden wenn die innere Prozedur
   -- jedes Mal etwas mehr Zeit benoetigen wuerde obwohl
   -- es anzustreben waere bei 10 Verzoegerungen mit 1s
   -- auch die entsprechende Zeit zu warten.
   Verzoegerung.Start;
   
   -- Mit dieser Moeglichkeit sehen wir, dass abhaengig davon
   -- wie lange die Ausfuehrung benoetigt man die Wartezeit
   -- timen kann.
   
   -- ACHTUNG:
   -- Man kann damit nicht die Geschwindigkeit beeinflussen
   -- (logischerweise). Das heisst, wenn die Ausfuehrungen
   -- laenger brauchen als der naechste Zeitpunkt gewuenscht
   -- waere, dann wird  bis zur Beendigung der Ausfuehrung
   -- gewartet. Man sollte dahingehend sein delay entsprechend
   -- testen und anpassen.
   VerzoegerungBis.Start;
   
end T005VerzoegerungBis;

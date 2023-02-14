-- Als Main wird auch gerne die Datei benannt, welche die
-- hauptsaechlich auszufuehrende Datei ist.

-- Dies laesst den Zugriff auf das entsprechende Package zu
with Ada.Text_IO, Ada.Integer_Text_IO, p2Rechnen, p2konstanten; 

use Ada.Text_IO, Ada.Integer_Text_IO, p2konstanten; 

procedure p2Main_Rechnen is
   
   -- Variablen
   A : Integer;
   B : Integer;
   
begin
   
   -- Eingabe
   Put("A : ");
   Get(A);
      
   Put("B : ");
   Get(B);
   
   -- Schreibweise bei der reinen Verwendung von with
   Ada.Text_IO.Put_Line( p2Rechnen."+"( A , B ) );
   
   -- oder
   Ada.Text_IO.Put_Line(A + B); 
   
   -- Konstante
   Ada.Text_IO.Put_Line(Integer'Image(Konstante1));
   
   -- Schreibweise bei der Verwendung von use
   -- Darauf hinweisen, dass man beim Ueberfahren
   -- der Funktionen das Quellpackage sieht.
   -- Bei Strg + Klick sogar direkt dorthin
   -- springt.
   
   -- Warum wurde use aber so wenig genutzt?
   -- Ada ist mittlerweile schon "etwas" aelter.
   -- Damals gab es derartige Moeglichkeiten wie das
   -- Hervorheben und Aufzeigen der Quelle NICHT
   -- oder nur durch Zusatzprogramme. Somit war es
   -- fuer Entwickler ohne Vollqualifizierung
   -- ungemein schwierig alles nachzuvollziehen.
   -- Heutzutage ist es der Way-To-Go nur in
   -- noetigsten Faellen Vollzuqualifizieren.
   Put_Line("+"(A , B));
   
   -- oder
   Put_Line(A + B);
   
   -- Konstante
   Put_Line(Integer'Image(Konstante1));
   
end p2Main_Rechnen;

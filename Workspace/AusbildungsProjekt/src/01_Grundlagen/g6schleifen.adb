with Ada.Text_IO; use Ada.Text_IO;

-- Einfachste Moeglichkeit der Veranschaulichung:
-- Auf alle Art und Weisen eine Schleife zaehlen lassen
procedure g6Schleifen is
   
   Zahl : Integer := 0;
   
   type ENUM_T is (Montag, Dienstag, Mittwoch, Donnerstag, Freitag, Samstag, Sonntag);
   
begin
   -- While-Schleife (Kopfgesteuerte Schleife)
   -- Wird auch nur dann ausgefuehrt wenn die Bedingung zu Beginn wahr ist
   while Zahl <= 10 loop
      Put_Line(Integer'Image(Zahl));
      Zahl := Zahl +1;
   end loop;
   
   -- "Reset von Zahl"
   Zahl := 0;
   New_Line;
   -- "Reset von Zahl"
   
   -- Do-While Schleife (Fußgesteuerte Schleife)
   -- Fuehrt die Anweisung mindestens 1 Mal aus bevor es ueberprueft 
   loop
      Put_Line(Integer'Image(Zahl));
      exit when Zahl = 10;
      Zahl := Zahl +1;
   end loop;
   
   -- "Reset von Zahl"
   Zahl := 0;
   New_Line;
   -- "Reset von Zahl"
   
   -- Zaehlerschleife mit Integer
   -- Zaehlt in der angegebenen Reichweite. Die Reichweite haengt
   -- vom entsprechenden Typ ab.
   for Zahl in 0 .. 10 loop
      Put_Line(Integer'Image(Zahl));
   end loop;
   
   -- "Reset von Zahl"
   Zahl := 0;
   New_Line;
   -- "Reset von Zahl"
   
   -- Zaehlerschleife mit Integer rueckwaerts
   -- Zaehlt in der angegebenen Reichweite. Die Reichweite haengt
   -- vom entsprechenden Typ ab.
   for Zahl in reverse 0 .. 10 loop
      Put_Line(Integer'Image(Zahl));
   end loop;
   
   -- Sollte die Range von Groeßer .. Kleiner gehen so wird ein Warning
   -- angegeben, dass diese Schleife nicht durchgefuehrt werden wird.
   
   -- ABSATZ
   New_Line;
   -- ABSATZ
   
   -- Zaehlerschleife fuer Aufzaehlung / Enum
   -- ACHTUNG:
   -- Fuer Aufzaehlungstypen muss die Zwischenvariable
   -- nicht vordefiniert sein. Die Werte erschließen
   -- sich aus der Reichweite und den entsprechenden 
   -- Typen. Bei Aehnlichkeit sollte man eine Zwischenvariable
   -- fest deklarieren.
   for Tag in Mittwoch .. Sonntag loop
      Put_Line(ENUM_T'Image(Tag));
   end loop;
   
   -- "Reset von Zahl"
   Zahl := 0;
   New_Line;
   -- "Reset von Zahl"
   
   -- Benannte-Endlos-Schleife
   Endlos_Solange_Nicht_10_Schleife : loop
      Put_Line(Integer'Image(Zahl));
      if Zahl = 10 then
         exit Endlos_Solange_Nicht_10_Schleife;
      else 
         Zahl := Zahl +1;
      end if;
   end loop Endlos_Solange_Nicht_10_Schleife;
   
   
end g6Schleifen;

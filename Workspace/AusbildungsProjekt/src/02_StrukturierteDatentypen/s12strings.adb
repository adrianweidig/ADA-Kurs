with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
  

-- Spezialitaet an Char-Arrays:
-- Koennen als String initialisiert werden.
-- ACHTUNG:
-- Koennen umgekehrt jedoch nicht als String-Typ
-- genutzt werden, sondern nur als reines Array.

procedure s12Strings is
   
   ------------------- Character - Array ------------------------
   
   type NAME_TA is array (1 .. 10) of Character;
   
   Vorname  : NAME_TA := "1234567890"; -- 10 Zeichen
   
   -- Ueberschreitung der vorgegebenen Range ist nicht zulaessig 
   -- Nachname : NAME_TA := "Das hier ist laenger als 10 Zeichen";
  
   ------------------- Strings ------------------------
   
   -- Die Laenge des Strings muss exakt gleich der angegebenen Laenge sein
   Nachname : String (1 .. 8) := "Nachname";
   
   -- Man kann jedoch auch die Range weglassen. Dann muss jedoch die 
   -- Initialisierung definitiv erfolgen. Aus der Initialisierung kann
   -- die gewuenschte Laenge automatisch ermittelt werden.
   
   Nachname2 : String := "Nachname der viel laenger ist.";
   
   -- RENAMING:
   -- Durch rename koennen quasi alle Eigenschaften (Typen, Subtypen, 
   -- Variablen, etc.) auf einen anderen Bezeichner hin verwendet werden.
   -- Der Gedanke dahinter ist, dass die Informationen quasi in das
   -- gleiche Objekt, jedoch mit gleichem Namen, abgelegt werden.
   
   -- ACHTUNG:
   -- Die Objektreferenz bleibt erhalten. Aendert sich Nachname2
   -- aendert sich N ebenfalls.
   N : String renames Nachname2;
   
   ------------------- Unbounded Strings ------------------------
   -- Keine Grenzen --> Bevorzugt
   
   Text_Ohne_Grenzen : Unbounded_String;

   
begin
   
   ------------------- Character - Array ------------------------
   
   -- Waere konsequent. Ist aber nicht moeglich.
   -- Put_Line(Vorname);
   
   for C of Vorname loop
      Put(C);
   end loop;
   
   New_Line;
   
   ------------------- Strings ------------------------
   -- Strings sind nichts anderse als Char-Arrays 
   
   for I in Nachname'Range loop
      Put(Nachname(I));
   end loop;
   
   New_Line;
   
   -- Dies hingegen ist moeglich, da Put_Line einen String erwartet.
   Put_Line(Nachname);
   
   Put_Line(Nachname2);
   
   Put_Line(N);
   
   -- Slicing - Nutzung eines Teilabschnitts eines Arrays
   -- Fuer andere Array-Typen ebenfalls nutzbar. Jedoch  bei 
   -- einem String am einfachsten zu veranschaulichen.
   
   -- Nachname[ der viel laenger ist.] --> Alles in Klammern wird weggeschnitten.
   Put_Line(Nachname2(1..8));
   
   -- Weitere Operationen
   
   -- Zusammenfuegen durch Bereichszuweisung
   -- Wichtig ist hierbei, dass die Laenge auf beiden Seiten
   -- gleich sein muss. Dies kann durch range Angabe angepasst werden.
   Nachname2(9..16) := Nachname;
   Put_Line(Nachname2(1..16));

   -- Vergleiche
   -- Falsch, da die Inhalte der Bereiche unterschiedlich sind
   Put_Line(Boolean'Image(Nachname2 = Nachname));
   
   -- True, da der angegebene Bereich vom Inhalt her der gleiche
   -- wie des Vergleichsobjekts ist.
   Put_Line(Boolean'Image(Nachname2(1..8) = Nachname));
   
   -- Veranschaulichung, dass durch die Objektreferenz der Inhalt von N
   -- ebenfalls mitveraendert wurde.
   Put_Line(N);
   
   -- Konkatenation:
   -- Zusammenfuegen von Inhalten explizit
   
   -- Reset auf Standard
   Nachname2 := "Nachname der viel laenger ist.";
   
   -- Konkatenation. Am Ende muss jedoch die entsprechende Laenge
   -- des zu veraendernden Typens vorhanden sein.
   Nachname2 := Nachname2(1..8) & Nachname & Nachname2(17..29);
   
   --------------- Strings einlesen ------------------
   -- Um unnoetige Schleifen und Grenzen fuer die Nutzereingabe
   -- zu umgehen. (Gerade bei der Eingabe eines Strings)
   -- Gibt es das Package Ada.Strings.Unbounded und das
   -- das dazugehoerige Text_IO.Unbounded_IO package.
   -- Dort ist gerade hinsichtlich Effizienz bereits entsprechende
   -- Mechaniken eingebaut.
   
   -- Seit Ada95 moeglich
   
   -- Unbounded Package
   Put_Line("Geben Sie ihren Text ein:");
   
   Text_Ohne_Grenzen := To_Unbounded_String(Get_Line);
   
   Put_Line(To_String(Text_Ohne_Grenzen));
   
   -- Moeglichkeit Text_IO.Unbounded_IO
   Put_Line("Geben Sie ihren Text ein:");
   
   Get_Line(Text_Ohne_Grenzen);
    
   Put_Line(Text_Ohne_Grenzen);
   
   
   
   
   
end s12Strings;

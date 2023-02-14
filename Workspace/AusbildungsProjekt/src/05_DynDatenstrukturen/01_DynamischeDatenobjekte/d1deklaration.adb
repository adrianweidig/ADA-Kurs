-- Beachte: System.Adress_Image ist GNAT spezifisch
with Ada.Text_IO, System.Address_Image;

use Ada.Text_IO;

procedure d1Deklaration is
   
   -- WICHTIG VORAB:
   -- Es gilt auch bei den Dynamischen Datenobjekte das
   -- klassische Typisierungsverhalten. Wir koennen auch
   -- nur Dinge zueinander zuweisen welche vom gleichen
   -- Typstamm sind. Also Positive und Integer waere z.B.
   -- moeglich solange die Grenzen eingehalten werden,
   -- jedoch kann ich eine Zeichenkette nicht meinem
   -- Integerwert zuweisen.
   
   -- REF steht hierbei fuer Reference, da wir jetzt
   -- den Zugriff auf die Referenz des Objekts im Stack
   -- (Festen Speicher) erhalten.
   
   -- Zugriffstyp = POSITIVE_REF
   -- Zielunteryp = POSITIVE
   -- Zieltyp     = INTEGER
   --> Wir greifen als Nutzer auf den Zugriffstyp zu.
   -- Dahinter versteckt sich unser Zieluntertyp oder wenn
   -- dort keiner vorhanden ist auf den Zieltyp.
   type POSITIVE_REF is access POSITIVE;
   
   
   -- Zugriffstyp auf Zielobjekte als ENUMS:
   
   -- Zugriffstyp		=  FARBEN_REF
   -- Zieluntertyp   =  FARBEN_T
   -- Zieltyp			=  FARBEN_T
   type FARBEN_T is (Rot, Gruen, Blau);
   type FARBEN_REF is access FARBEN_T;
   
   -- Zugriffstyp auf Zielobjekte vom diskreten 
   -- Untertyp STRING_20:
   subtype STRING_20 is STRING (1 .. 20);
   type STRING_20_REF is access STRING_20;

   -- Der Zugriff hierauf wuerde jetzt einen Constraint
   -- Error werfen, da die Referenz im Speicher "null"
   -- betraegt. In anderen Sprachen wuerde hier eine
   -- klassische Null-Pointer Exception auftauchen.
 
   Test_Zahl_Null : POSITIVE_REF;
   
   Positiv_1, Positiv_2 : POSITIVE_REF;
   
   -- Hier haben wir den Speicher anhand der expliziten
   -- Vorinitialisierung bereits allokiert. 
   -- Durch die Nutzung von constant kann ebenfalls
   -- ganz normal wieder keine Wertaenderung geschehen.
   -- Andere Werte jedoch die Referenz zuzuweisen ist
   -- weiterhin moeglich (Die Bearbeitung dann aber
   -- wieder nicht)
   
   Rote_Farbe       : constant FARBEN_REF := new FARBEN_T'(Rot);
   Irgendeine_Farbe : FARBEN_REF := new FARBEN_T;
   
   
begin
   
   -- Unter die Nutzung von .all greife ich auf ALLE
   -- Inhalte usnerer Referenz zu, da hier also noch
   -- Nichts enthalten ist (null) wirft es uns hier
   -- den Constraint Error.
 
   -- Put_Line(Integer'Image(Test_Zahl_Null.all));
   
   ------ Zuweisungen ------
   -- Das hier wird nicht funktionieren. Wir erzeugen,
   -- quasi nicht den Inhalt unseres Zugriffstyp, sondern
   -- unseres Zielunter oder "Haupt"typen. Hier waere
   -- also nur Positive oder Integer moeglich.
   
   -- Positiv_1 := new POSITIVE_REF'(2);
   -- Ohne '(Wert) erhalten wir ein leeres Objekt. Wichtig
   -- hierbei ist, dass zumindest nicht mehr "null" im Speicher
   -- steht. Die Gewährleistung WAS jedoch enthalten ist, ist
   -- nicht gegeben.
   --> Z.B. Waren bei nicht initialisierten Integer Arrays die 
   --  Werte mit wahllosen noch im Speicher liegenden Werten initialisiert. 
   --  Bei anderen Programmiersprachen werden ja nach Typ in der Regel auch 
   --  den zugehoerigen Standardwert mit initialisiert. 
   Positiv_1 := new Positive;
   Positiv_2 := new Integer;
   
   -- Mit Hilfe des Systems.Adress_Image Pakets kann man
   -- sich die belegenden Adressen ausgeben lassen.
   Put_Line("Adresswert von Positiv_1 : " & System.Address_Image(Positiv_1.all'Address));
   Put_Line("Adresswert von Positiv_2 : " & System.Address_Image(Positiv_2.all'Address));
   
   -- ACHTUNG: Die Referenzen im Speicher werden bei new auch
   -- wirklich NEU angelegt. (Siehe unten)
   
   Positiv_1 := new Positive'(10);
   Positiv_2 := new Integer'(50);
   -- Hier sieht man, dass nach "new" eine neue Adresse zugewiesen wurde
   Put_Line("Adresswert von Positiv_1 : " & System.Address_Image(Positiv_1.all'Address));
   Put_Line("Adresswert von Positiv_2 : " & System.Address_Image(Positiv_2.all'Address));
   
   --- Ausgabe der aktuellen Werte von Positive ---
   -- Wichtig: Wieder nur Zugriff ueber .all (Vorerst)
   Put_Line("Wert von Positive_1: " & Positive'Image(Positiv_1.all));
   Put_Line("Wert von Positive_2: " & Integer'Image(Positiv_2.all));
   
   -- BEACHTE: Hier werden jetzt die Referenzen, nicht
   -- die Inhalte verglichen. (Testweise die Inhalte
   -- auf den gleichen Wert setzen um es zu verdeutlichen)
   Put_Line("P1 = P2 ? : " & Boolean'Image(Positiv_1 = Positiv_2));

   -- Zuweisung der Referenz in ein Typbezogen
   -- gleichwertiges Objekt.
   Positiv_2 := Positiv_1;
   
   -- Nun sind die Adressen identisch, da die entsprechende Variable 
   -- jetzt auf die gleichen Referenzen zeigt.
   Put_Line("Adresswert von Positiv_1 : " & System.Address_Image(Positiv_1.all'Address));
   Put_Line("Adresswert von Positiv_2 : " & System.Address_Image(Positiv_2.all'Address));
   
   Put_Line("P1 = P2 ? : " & Boolean'Image(Positiv_1 = Positiv_2));
   --> In P2 ist jetzt die Referenz quasi der Verweis
   -- auf den Inhalt von P1
   
   -- Soweit noch nicht spektakulär, da man
   -- von der klassischen Annahme ausgeht, dass
   -- die Werte innerhalb unserer Variable
   -- der anderen zugewiesen wurde.
   
   -- Beachte:
   -- P1 ist aktuell 10
   -- P2 ist jetzt ebenfalls 10 (Inhaltsbezogen)
   --> Davor: 30
   Put_Line("Wert von Positive_2: " & Integer'Image(Positiv_2.all));
   
   -- Aenderung der Werte von P2 wirken sich auf
   -- P1 aus und andersrum genauso. Da hinter unseren
   -- Variable die gleiche Referenz steht.
   -- Ueber die Angabe von .all kann nich auf den Typinhalt
   -- unserer aktuellen Referenz zugreifen.
   Positiv_2.all := 300;
   
   -- ACHTUNG: Hier wird P1 < ausgegeben
   -- P1 hat jetzt ebenfalls den Wert 300, da die
   -- Referenz im Speicher durch die Zuweisung
   -- die gleiche ist.
   Put_Line("Wert von Positive_1: " & Integer'Image(Positiv_1.all) & ", denn P1 = P2? : " & Boolean'Image(Positiv_1 = Positiv_2));
            
   -- Um P2 quasi einen neuen Platz im Speicher zuzuweisen nutzen wir
   -- einfach das "new" Schluesselwort in einer neuen Zuweisung.
   Positiv_2 := new Integer'(50);
   
   Put_Line("Wert von Positive_2: " & Integer'Image(Positiv_2.all));
   Put_Line("P1 = P2 ? : " & Boolean'Image(Positiv_1 = Positiv_2));
   
   -- Nun sind die Adressen wieder unterschiedlich
   Put_Line("Adresswert von Positiv_1 : " & System.Address_Image(Positiv_1.all'Address));
   Put_Line("Adresswert von Positiv_2 : " & System.Address_Image(Positiv_2.all'Address));
   
   
end d1Deklaration;

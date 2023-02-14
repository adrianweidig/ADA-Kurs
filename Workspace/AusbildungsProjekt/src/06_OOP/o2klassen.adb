with Ada.Text_IO, Ada.Strings.Unbounded, Ada.Tags;

use Ada.Text_IO, Ada.Strings.Unbounded, Ada.Tags;

procedure O2Klassen is
   
   -- EXTREM WICHTIGER HINWEIS:
   -- In Ada ist es moeglich primitive Klassen
   -- innerhalb einer "Main" Procedure zu
   -- deklarieren und zu erzeugen. 
   -- Unterprogramme zuzuweisen und entsprechend
   -- zu nutzen ist NICHT MOEGLICH. Dazu muss
   -- die Klasse in ein extra Package um dies
   -- zu ermoeglichen.
   --> DAZU IN DEN NAECHSTEN DATEIEN
   
   -- Wir erzeugen hier eine Klasse durch das
   -- Schluesselwort tagged. 
   -- null sagt aus, dass der Inhalt unserer
   -- Klasse nicht vorhanden ist. Somit entfaellt
   -- naehere Definition unserer Klasse.
   type Lebewesen is tagged null record;

   -- Eine Ableitung der Klasse wird auch als
   -- Vererbung bezeichnet. Hierbei erhaelt
   -- der Erbe alle Eigenschaften der
   -- Oberklasse.
   --> Tier ist also auch ein Lebewesen
   type Tier is new Lebewesen with record 
      Bezeichnung : Unbounded_String;
   end record;
   
   -- Hier haben wir einen weiteren Erben
   -- Dabei ist der Vogel ein Tier und
   -- gleichzeitig ein Lebewesen
   type Vogel is new Tier with record
      Flugfaehigkeit : Boolean := true;
   end record;
   
   type Fisch is new Tier with record
      Schwimmfaehigkeit : Boolean := true;
   end record;
   
   -- Eine "Reihenerbung" ist unendlich
   -- weit moeglich. Eine Mehrfachvererbung
   -- jedoch nicht:
   -- type Fisch is new Tier and Lebewesen with record
   -- end record; 
   
   ---- Erzeugen von Objekten unserer Klasse
   Fisch1, Fisch2 : Fisch;
   
   Vogel1, Vogel2 : Vogel;
   
   --- Erst erstellen sobald Zuweisung und Nutzung
   --- Der Objekte erklaert wurde.
   
   Lebewesen1 : Lebewesen;
   
   Tier1      : Tier;
   
   ------------ Eigene Prozedur um die Hierarchie ausgeben zu lassen --------------
   procedure Hierarchie ( Spec_Tag : Ada.Tags.Tag ) is
   begin
      begin 
         -- Nutzung der Moeglichkeiten von Ada.Tags
         Put_Line("   Klasse: " & Expanded_Name(Spec_Tag) & " - Oberklasse: " & Expanded_Name(Parent_Tag(Spec_Tag)));
         Hierarchie(Parent_Tag(Spec_Tag));
      exception    
            -- Einfach um den Programmabbruch bei Auftauchen
            -- des Tag-Errors zu verhindern. 
            -- Auch wenn man mit Exceptions EIGENTLICH keinen
            -- Programmablauf erzeugen soll macht dies hier
            -- tatsaechlich Sinn die Rekursion auf diese
            -- Weise abzubrechen.
         when Ada.Tags.Tag_Error => 
            Put_Line("     Keine weitere Oberklasse"); 
            New_Line;
      end;
   end Hierarchie;
   
   
   -- Start des Mainprogrammes   
begin
   
   --- Nutzung der Objekte ---
   -- Da beide von Tier geerbt haben kann ich
   -- bei beiden Objekten (Fisch1 und Vogel1)
   -- eine Bezeichnung festlegen
   
   Fisch1.Bezeichnung := To_Unbounded_String("Karpfen");
   
   Vogel1.Bezeichnung := To_Unbounded_String("Amsel");
   
   -- Der Zugriff auf einzelne Einheiten eines
   -- Objekts erfolgt ueber die Dot (.) Notation
   Put_Line("Fisch1 ist ein " & To_String(Fisch1.Bezeichnung));
   Put_Line("Vogel1 ist ein " & To_String(Vogel1.Bezeichnung));
   
   -------------- WICHTIGSTE: ---------------
   ----- Vergleichsoperationen um -----------
   -- die entsprechenden Unterschiede -------
   ------------- hervorzuheben --------------
   
   -- Alles nicht moeglich, da die Typvertraeglichkeit
   -- wie gewohnt nicht gegeben ist.
   -- Lebewesen1 := Tier1;
   -- Tier1      := Fisch1;
   -- Fisch1     := Vogel1;
   
   -- Kompilierung zeigt, dass es funktioniert
   Fisch2 := Fisch1;
   
   Vogel2 := Vogel1;
   
   New_Line;
   
   -- Ausgabe der Hierarchien (Ab ADA 2005)
   Put_Line("-- Hierarchie von Fisch beginnend:");
   Hierarchie(Fisch'Tag);
   
   Put_Line("-- Hierarchie von Vogel beginnend:");
   Hierarchie(Vogel'Tag);
     
   Put_Line("-- Hierarchie von Tier beginnend:");
   Hierarchie(Tier'Tag);

   -- Die Hierarchie zeigt schon die Moeglichkeiten.
   -- Type-Casting ist insoweit unter Klassen moeglich,
   -- solange von unten nach oben gecastet wird.
   
   -- Bedeutet:
   -- Ein Fisch ist ein Tier. Ein Tier ein Lebewesen.
   -- Somit kann ich ein Fisch zu einem Tier oder
   -- einem Lebewesen casten.
   -- Ein Lebewesen ist aber nicht automatisch ein 
   -- Tier, selbst wenn es nur eine Moeglichkeit gibt.
   -- Ein Tier ist auch nicht automatisch ein Fisch.

   -- Auftauchender Fehler:
   -- Downward conversion of tagged objects not allowed
   
   -- Fisch1:= Fisch(Tier1);
   -- Tier1 := Tier(Lebewesen1);
   
   Lebewesen1 := Lebewesen(Tier1);
   Tier1      := Tier(Fisch1);
   
   -- Man sieht sehr schoen, dass man nun die Informationen
   -- des Fischs in Tier1 gespeichert hat. Zusaeztliche
   -- Informationen die jedoch nur fuer den Fisch-Typ zur
   -- Verfuegung stehen gehen dabei in Tier1 verloren, da
   -- der Typ Tier nicht auf die Informationen von Fisch
   -- zugreifen kann.
   Put_Line("Tier1 ist ein " & To_String(Tier1.Bezeichnung));
   
   -- Nicht moeglich, da ueber Tier1 kein Zugriff ermoeglicht
   -- wird. 
   
   -- "No selector "Schwimmfaehigkeit" for type "Tier defined...."
   -- Put_Line(Boolean'Image(Tier1.Schwimmfaehigkeit));
   
 
   
   
end O2Klassen;

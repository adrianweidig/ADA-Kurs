with Ada.Text_IO, Ada.Unchecked_Deallocation, System.Address_Image;

use Ada.Text_IO;

procedure d3Deallokation is
   
   -- Um einen Vergleich zwischen 2 AdressWERTEN 
   -- (Also eigentlich nur dem String dahinter)
   -- zu ermoeglichen mittels Infix des = Operators
   use type System.Address;
   
   type String_Ref is access String;
   
   String1, String2 : String_Ref;
   
   -- MAN BEACHTE:
   -- Unsere beiden String_Referenzen sind vom Typ String.
   -- Haben aktuell jedoch noch keinen Inhalt und sind 
   -- somit unbeschraenkt in der Uebergabe.
   
   -- Object entspricht dem "Haupttypen" wobei dieser auch komplett
   -- unbeschraenkt sein kann. 
   -- Name entspricht dem entsprechenden Referenztypen.
   procedure Speicher_Freigeben is new Ada.Unchecked_Deallocation(Object => String,
                                                                  Name   => String_Ref);
   
   type Integer_Ref is access Integer;
   
   type Boolean_Ref is access Boolean;

   type Datensammlung is record
      Eine_Zahl   : Integer_Ref := new Integer;
      Ein_Boolean : Boolean_Ref := new Boolean;
   end record;
   
   type Sammlung_Ref is access Datensammlung;
   
   Sammlung, Sammlung2 : Sammlung_Ref := new Datensammlung;
   
   procedure Record_Freigeben is new Ada.Unchecked_Deallocation(Object => Datensammlung,
                                                                Name   => Sammlung_Ref);
begin
   
   -- Durch die Initialisierung des neuen Objekt-Strings und den
   -- entsprechenden Inhalten haben wir hier auch eine Grenze 
   -- erstmalig festgelegt.
   String1 := new String'("Text Nummer 1");
   
   String2 := new String'("Text Nummer 1_2");
   
   Put_Line("Wert von String1: " & String1.all);
   Put_Line("Wert von String2: " & String2.all);
   
   -- Adressen:
   Put_Line("Adresswert von String1 : " & System.Address_Image(String1.all'Address));
   Put_Line("Adresswert von String2 : " & System.Address_Image(String2.all'Address));
   
   New_Line;
   
   Put_Line("Zuweisung String2 := String1");
   
   New_Line;
   String2 := String1;
   
   -- Obwohl wir zwei unterschiedliche Grenzen
   -- haben ist aufgrund der Typvertraeglichkeit
   -- eine Zuweisung zulaessig.
   Put_Line("Wert von String1: " & String1.all);
   Put_Line("Wert von String2: " & String2.all);
   
   -- Adressen (Jetzt wieder gleich):
   Put_Line("Adresswert von String1 : " & System.Address_Image(String1.all'Address));
   Put_Line("Adresswert von String2 : " & System.Address_Image(String2.all'Address));
   
   Speicher_Freigeben(String1);
   
   -- Dies sorgt nun fuer einen Constraint_Error,
   -- da String1 auf freigegebenen Speicher der
   -- mit keinen Informationen befuellt ist zeigt.
   -- Put_Line("Wert von String1: " & String1.all);
   
   -- Das ist ein sogenannter Frei Haengender
   -- Zeiger / Pointer. Da die Referenz auf das 
   -- letzte Objekt noch vorhanden ist jedoch keine
   -- Informationen enthalten sind wird fuer
   -- die implizite Verwendung der Stringausgabe
   -- fuer den String der Standardwert " " des
   -- verwendeten Typen String genutzt.
   Put_Line("Wert von String2: " & String2.all);
   
   -- Adressen:
   -- Auf die 1. Adresse hat man jetzt ueber DIESE (String1) Referenz
   -- keinen Zugriff mehr, da diese nicht mehr "verbunden" sind.
   -- Put_Line("Adresswert von String1 : " & System.Address_Image(String1.all'Address));
   
   -- Die Adresse in String2 ist tatsaechlich immernoch die gleiche. Jedoch ist der
   -- zuvor referenzierte Inhalt der von String1 in die Adresse initialisiert wurde
   -- ebenfalls entfernt. Dadurch besteht komplette Unklarheit ueber den Inhalt an
   -- dieser Adresse und laesst somit keine Operationen zu.
   
   -- Man Beachte:
   -- Die Ausgabe des Inhaltes ist durch die Art und Weise wie der Typ ausgegeben
   -- wird definiert. Auch wenn kein Inhalt an dieser Stelle ist wird hier dann
   -- bei einem String z.B. " " ausgegeben.
   Put_Line("Adresswert von String2 : " & System.Address_Image(String2.all'Address));
   
   -- Dies ist auch NICHT moeglich. Da die Adresse keine Informationen ueber den
   -- Inhalt haelt. 
   
   --  String1.all := "I'm Back!";
   --  String2.all := "I'm Back!";
   
   -- Was haben wir jetzt getan und was bringt das?
   -- Durch den freigegebenen Speicher haben wir logischerweise diesen
   -- jetzt auch wieder zur Verfuegung und koennen so unser Programm
   -- performanter machen.
   
   -- Man beachte:
   -- Ein frei haengender Zeiger / "Dangling Pointer" zeigt dennoch auf
   -- bereits freigegebenen Speicher. Auch wenn dieser auf eine quasi
   -- nicht vorhandene Referenz zeigt ist der Speicher freigegeben.
   
   
   -----------------------------------------------------------   
   ------------------------  Records  ------------------------   
   ----------------------------------------------------------- 
   New_Line;
   
   Put_Line(Ascii.ESC & "[1m" & Ascii.ESC & "[35m" & "-------------------------- Records --------------------------"& ASCII.ESC & "[0m");
   
   Sammlung.Eine_Zahl.all   := 10;
   Sammlung.Ein_Boolean.all := False;

   Put_Line(Ascii.ESC & "[93m" & "------ Vor der Zuweisung zueinander" & ASCII.ESC & "[0m");
   
   Put_Line("Zahlwert von Eine_Zahl in Sammlung       : " & Integer'Image(Sammlung.Eine_Zahl.all));
   Put_Line("Zahlwert von Ein_Boolean in Sammlung     : " & Boolean'Image(Sammlung.Ein_Boolean.all));
   
   -- Hier sind jetzt logischer Weise zufaellige Werte enthalten
   Put_Line("Zahlwert von Eine_Zahl in Sammlung2      : " & Integer'Image(Sammlung2.Eine_Zahl.all));
   Put_Line("Zahlwert von Ein_Boolean in Sammlung2    : " & Boolean'Image(Sammlung2.Ein_Boolean.all));
   
   New_Line;
   
   Put_Line("Adresswert von Sammlung                  : " & System.Address_Image(Sammlung'Address));
   Put_Line("Adresswert von Eine_Zahl in Sammlung     : " & System.Address_Image(Sammlung.Eine_Zahl'Address));
   Put_Line("Adresswert von Ein_Boolean in Sammlung   : " & System.Address_Image(Sammlung.Ein_Boolean'Address));
   
   New_Line;
   
   Put_Line(Ascii.ESC & "[1m" & Ascii.ESC & "[41m" & ASCII.ESC & "[34m" & "   " & "Adresswert von Sammlung2                 : " & System.Address_Image(Sammlung2'Address) & "   " & ASCII.ESC & "[0m" );
   Put_Line("Adresswert von Eine_Zahl in Sammlung2    : " & System.Address_Image(Sammlung2.Eine_Zahl'Address));
   Put_Line("Adresswert von Ein_Boolean in Sammlung2  : " & System.Address_Image(Sammlung2.Ein_Boolean'Address));
   
   New_Line;
   
   Put_Line("Ist Sammlung = Sammlung2 ?                               --> " & Boolean'Image(Sammlung = Sammlung2));
   Put_Line("  Ist der Wert der jeweiligen Adressen gleich?           --> " & Boolean'Image(Sammlung'Address = Sammlung2'Address));
   Put_Line("Ist Ein_Boolean in Sammlung = Ein_Boolean in Sammlung2 ? --> " & Boolean'Image(Sammlung.Eine_Zahl = Sammlung2.Eine_Zahl));
   Put_Line("  Ist der Wert der jeweiligen Adressen gleich?           --> " & Boolean'Image(Sammlung.Eine_Zahl'Address = Sammlung2.Eine_Zahl'Address));
   Put_Line("Ist Ein_Boolean in Sammlung = Ein_Boolean in Sammlung2 ? --> " & Boolean'Image(Sammlung.Ein_Boolean = Sammlung2.Ein_Boolean));
   Put_Line("  Ist der Wert der jeweiligen Adressen gleich?           --> " & Boolean'Image(Sammlung.Ein_Boolean'Address = Sammlung2.Ein_Boolean'Address));
   
   Sammlung2 := Sammlung;
   
   New_Line;
   
   Put_Line(Ascii.ESC & "[93m" & "------ Nach der Zuweisung zueinander"& ASCII.ESC & "[0m");
   
   Put_Line("Zahlwert von Eine_Zahl in Sammlung       : " & Integer'Image(Sammlung.Eine_Zahl.all));
   Put_Line("Zahlwert von Ein_Boolean in Sammlung     : " & Boolean'Image(Sammlung.Ein_Boolean.all));
   
   -- Hier sind jetzt die Werte von Sammlung enthalten
   Put_Line("Zahlwert von Eine_Zahl in Sammlung2      : " & Integer'Image(Sammlung2.Eine_Zahl.all));
   Put_Line("Zahlwert von Ein_Boolean in Sammlung2    : " & Boolean'Image(Sammlung2.Ein_Boolean.all));
   
   New_Line;
   
   Put_Line("Adresswert von Sammlung                  : " & System.Address_Image(Sammlung'Address));
   Put_Line("Adresswert von Eine_Zahl in Sammlung     : " & System.Address_Image(Sammlung.Eine_Zahl'Address));
   Put_Line("Adresswert von Ein_Boolean in Sammlung   : " & System.Address_Image(Sammlung.Ein_Boolean'Address));
   
   New_Line;
   
   Put_Line("Adresswert von Sammlung2                 : " & System.Address_Image(Sammlung2'Address));
   Put_Line("Adresswert von Eine_Zahl in Sammlung2    : " & System.Address_Image(Sammlung2.Eine_Zahl'Address));
   Put_Line("Adresswert von Ein_Boolean in Sammlung2  : " & System.Address_Image(Sammlung2.Ein_Boolean'Address));
   
   New_Line;
   
   Put_Line("Ist Sammlung = Sammlung2 ?                               --> " & Boolean'Image(Sammlung = Sammlung2));
   Put_Line("  Ist der Wert der jeweiligen Adressen gleich?           --> " & Boolean'Image(Sammlung'Address = Sammlung2'Address));
   Put_Line("Ist Ein_Boolean in Sammlung = Ein_Boolean in Sammlung2 ? --> " & Boolean'Image(Sammlung.Eine_Zahl = Sammlung2.Eine_Zahl));
   Put_Line("  Ist der Wert der jeweiligen Adressen gleich?           --> " & Boolean'Image(Sammlung.Eine_Zahl'Address = Sammlung2.Eine_Zahl'Address));
   Put_Line("Ist Ein_Boolean in Sammlung = Ein_Boolean in Sammlung2 ? --> " & Boolean'Image(Sammlung.Ein_Boolean = Sammlung2.Ein_Boolean));
   Put_Line("  Ist der Wert der jeweiligen Adressen gleich?           --> " & Boolean'Image(Sammlung.Ein_Boolean'Address = Sammlung2.Ein_Boolean'Address));
   
   
   ---------- Freigeben der Adresse von Sammlung -------
   -- Vermutung:
   -- Da Sammlung2 auf Sammlung verweist muesste theoretisch
   -- Sammlung2 ein "dangling Pointer" sein.
   
   Record_Freigeben(Sammlung);
   
   New_Line;
   
   Put_Line(Ascii.ESC & "[93m" & "------ Nach dem Freigeben von Sammlung" & ASCII.ESC & "[0m");
   
   -- Funktioniert seltsamer Weise und hat sogar eine zugewiesene Adresse
   Put_Line("Adresswert von Sammlung                  : " & System.Address_Image(Sammlung'Address));
   
   -- Zugriff auf die Inhalte im Record sind nicht mehr moeglich
   -- Put_Line("Adresswert von Eine_Zahl in Sammlung     : " & System.Address_Image(Sammlung.Eine_Zahl'Address));
   -- Put_Line("Adresswert von Ein_Boolean in Sammlung   : " & System.Address_Image(Sammlung.Ein_Boolean'Address));
   
   New_Line;
   
   Put_Line("Adresswert von Sammlung2                 : " & System.Address_Image(Sammlung2'Address));
   Put_Line("Adresswert von Eine_Zahl in Sammlung2    : " & System.Address_Image(Sammlung2.Eine_Zahl'Address));
   Put_Line("Adresswert von Ein_Boolean in Sammlung2  : " & System.Address_Image(Sammlung2.Ein_Boolean'Address));
   
   -- Man Beachte: Zuvor festgelegt waren als Integer: 10 und fuer Boolean True
   -- Hier sind ploetzlich, obwohl die Adressen zu den vorherigen Objekten zeigen, 
   -- zufaellige Werte enthalten
   Put_Line("Zahlwert von Eine_Zahl in Sammlung2      : " & Integer'Image(Sammlung2.Eine_Zahl.all));
   Put_Line("Zahlwert von Ein_Boolean in Sammlung2    : " & Boolean'Image(Sammlung2.Ein_Boolean.all));
   
   
   New_Line;
   -- Ergibt Sinn. Dadurch, dass Sammlung quasi nicht mehr referenziert ist (eigentlich)
   -- sollte ein Vergleich ergeben, dass diese nicht gleich sind. Verwunderlich ist hierbei
   -- jedoch eher, dass ein Vergleich ueberhaupt moeglich ist obwohl hinter Sammlung eigentlich <
   -- nichts mehr steht.
   Put_Line("Ist Sammlung = Sammlung2 ?                               --> " & Boolean'Image(Sammlung = Sammlung2));
   Put_Line("  Ist der Wert der jeweiligen Adressen gleich?           --> " & Boolean'Image(Sammlung'Address = Sammlung2'Address));
   
   -- Da ein Zugriff auf die Inhalte von Sammlung nicht mehr moeglich ist, ist
   -- somit auch kein Vergleich der Inhalte moeglich.
   --  Put_Line("Ist Ein_Boolean in Sammlung = Ein_Boolean in Sammlung2 ? --> " & Boolean'Image(Sammlung.Eine_Zahl = Sammlung2.Eine_Zahl));
   --  Put_Line("  Ist der Wert der jeweiligen Adressen gleich?           --> " & Boolean'Image(Sammlung.Eine_Zahl'Address = Sammlung2.Eine_Zahl'Address));
   --  Put_Line("Ist Ein_Boolean in Sammlung = Ein_Boolean in Sammlung2 ? --> " & Boolean'Image(Sammlung.Ein_Boolean = Sammlung2.Ein_Boolean));
   --  Put_Line("  Ist der Wert der jeweiligen Adressen gleich?           --> " & Boolean'Image(Sammlung.Ein_Boolean'Address = Sammlung2.Ein_Boolean'Address));
end d3Deallokation;

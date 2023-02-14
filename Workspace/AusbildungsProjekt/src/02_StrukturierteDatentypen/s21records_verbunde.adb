with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure s21records_verbunde is
   
   ----------------------------- Records - Klassische Schreibweise ----------------------------
   
   type ENUMERATION_T    is (Schwarz, Weiﬂ);
     
   type PERSON_TR        is record 
      Name : Unbounded_String;
      Nr   : Integer;
   end record;
   
   -- Ein Array mit spaeter vorgegebener Groeﬂe, welches
   -- widerrum Records von Personen enthaehlt.
   type EIN_ARRAY_TA     is array (Integer range <>) of PERSON_TR;
   
   type DATENSAMMLUNG_TR is record 
      
      -- Ganzzahltyp fuer die komplette Reichweite
      EineZahl      : Integer;
      
      -- Kommazahl mit limitierter Reichweite
      EineKommazahl : Float range -10.0 .. Float'Last;
      
      -- Begrenzter String
      EinWort       : String(1..10);
      
      -- Unbegrenzter String
      EinSatz       : Unbounded_String;
      
      -- Enumeration 
      Irgendetwas   : ENUMERATION_T;
      
      -- Boolean
      Wahrheit      : Boolean;
      
      -- Ein Array (Range muss angegeben werden, da das Array selbst unbeschraenkt ist)
      EinArray      : EIN_ARRAY_TA(1..2);
      
      -- Ein anderer Record
      EinePerson    : PERSON_TR;
      
   end record;
   
   -- Muss nicht initialisiert sein --> Warning
   Sammlung1 : DATENSAMMLUNG_TR;
   
   
   ----------------------------- Diskriminanten Schreibweise (Modulare Ergaenzung) ----------------------------
   
   -- Je nach Definition aendert sich der record.
   -- Verschachtelung mehrerer Diskriminanten ist moeglich
   type STATUS_T is (SaZ, BS, FwD, Zivilist);
   
   type SOLDAT_TR (Status : STATUS_T) is record
      Nr      : Integer;
      
      Name, 
      Vorname : Unbounded_String;
      
      case Status is
         when BS => 
            PK : Unbounded_String;
         when Zivilist => 
            null;
         when others => 
            -- Doppelte Erwaehnungen sind nicht zulaessig. 
            --   PK  : Unbounded_String;
            
            -- Alternative (Anderer Bezeichner):
            PK2 : Unbounded_String;
            
            -- Die rage muss tatsaechlich dennoch angegeben werden
            DZE : String(1..10) := "XX-XX-XXXX";
      end case;
      
   end record;
   
   -- FwD wird nicht extra gelistet, da dieser
   -- die Eigenschaften von SaZ hat.
   Person1 : SOLDAT_TR (SaZ);
   Person2 : SOLDAT_TR (Status => BS) ;
   
   -- Inhalte pre-initialisiert [Alle muessen initialisiert werden.
   -- eine Teilinitialisierung ist nicht moeglich]
   Person3 : SOLDAT_TR (Zivilist) := (Nr      => 1,
                                      Status  => Zivilist,
                                      Name    => To_Unbounded_String(""),
                                      Vorname => To_Unbounded_String(""));
   
   ----------------------------- Un/Beschraenkte Verbundvariablen -----------------------
   -- ACHTUNG:
   -- Der moegliche Wertebereich von Inhalt_Std betraegt die komplette
   -- Reichweite die der Datentyp Integer zulaesst. Daher wird ein Warning
   -- "Warning: creation of "ZAHLEN_TR" object may raise Storage_Error"
   -- ausgegeben. Dies bedeutet, dass man theoretisch den kompletten moeglichen
   -- Bereich von Integer reservieren muesste. 
   
   -- Hier bietet es sich an statt rein z.B. Integer den moeglichen Wertebereich
   -- vorab einzuschraenken.
   
   -- ACHTUNG:
   -- Diskriminanten koennen keinen skalaren Typen begrenzen.
   -- Somit waere der Diskriminant anwendbar fuer Stringtypen aber nicht
   -- fuer Integer.
   subtype BEGRENZT_INT_T is Integer range 0 .. 10_000;
   type ZAHLEN_TR (Inhalt_Std : BEGRENZT_INT_T := 10) is record
      Inhalt : String (1 .. Inhalt_Std);
   end record;
   
   -- Untertypen sind immer beschraenkt und nehmen bei fehlender Angabe
   -- den Standardwert an
   subtype ZAHLEN_SUB_TR is ZAHLEN_TR(500);
   
   -- Initialisierung ist nicht noetig --> Warning
   Inhalt1 : ZAHLEN_TR;      -- Unbeschraenkte Verbundvariable
   Inhalt2 : ZAHLEN_TR (10); -- Beschraenkte Verbundvariable

begin
   
   ----------------------------- Zuweisung / Initialisierung / Zugriff ----------------
   -- Sammlung1. eingeben und ueber Autovervollstaendigung
   -- anzeigen welche Moeglichkeiten dann bereits bestehen.
   Sammlung1.EineZahl      := 1;
   Sammlung1.EineKommazahl := 5.0;
   Sammlung1.EinWort       := "0123456789";
   Sammlung1.EinSatz       := To_Unbounded_String("Das hier ist eine komplett unbegrenzte Laenge");
   Sammlung1.Irgendetwas   := Schwarz;
   Sammlung1.Wahrheit      := True;
   
   -- Es wird erkannt ob im Array ein Record gespeichert ist (. Autovervollstaendigung)
   Sammlung1.EinArray(1).Name := To_Unbounded_String("Bernd");
   Sammlung1.EinArray(1).Nr   := 1;
   Sammlung1.EinArray(2).Name := To_Unbounded_String("Hugo");
   Sammlung1.EinArray(2).Nr   := 2;
   
   Sammlung1.EinePerson.Name  := To_Unbounded_String("Helga");
   Sammlung1.EinePerson.Nr    := 3;
   
   ----------------------------- Diskriminantenzuweisung ----------------------------
   -- Name und Vorname wird weggelassen, da dieser bei allen gleich ist
   
   -- PK Aufruf wird zwar uebersetzt aber sorgt fuer einen Laufzeitfehler
   -- Person1.PK  := To_Unbounded_String("240695-X-88012");
   Person1.PK2  := To_Unbounded_String("240695-X-88012");
   Person1.DZE := "24-06-1995";
   
   Person2.PK  := To_Unbounded_String("130585-W-88046");
   
   -- Entsprechende Ausgaben
   Put_Line(To_String(Person1.PK2));
   Put_Line(Person1.DZE);
   
   Put_Line(To_String(Person2.PK));
   
   -- Veranschaulicht gut, dass die Diskriminantenschreibweise
   -- den Inhalt bereits initialisiert. Dies ist fuer alle Faelle
   -- anwendbar.
   Put_Line(STATUS_T'Image(Person1.Status));
   
   -- Abhaengig vom Datentyp werden auch leere oder Standard
   -- Werte auftauchen. 
   Put_Line(Integer'Image(Person1.Nr));
   
   
   ----------------------------- Ausgabe beschraenkte Verbundvariablen ----------------------------
   -- Nicht initialisiert gibt seltsame Werte zurueck (String range oben anpassen zum
   -- Veranschaulichen) --> Warning: ... may be referenced before it has a value
   Put_Line(Inhalt1.Inhalt);
   Put_Line(Inhalt2.Inhalt);
   
   Inhalt1.Inhalt := "0123456789";
   Inhalt2.Inhalt := "0123456789";
   
   Put_Line(Inhalt1.Inhalt);
   Put_Line(Inhalt2.Inhalt);
   
   -- Weitere Moeglichkeit. Diskriminante spaeter festlegen (Hohe Flexibilitaet)
   -- Nur bei unbeschraenkter Verbundvariable flexibel. Bei der Beschraenkten
   -- Verbundvariable kann nur der Wert angenommen werden der bereits 
   -- vorhanden ist. (10)
   Inhalt2 := (10, "0123456789"); -- z.B. 5 oder 11 nicht zulaessig
   Put_Line(Inhalt2.Inhalt);
   
   Inhalt1 := (5, "01234");       -- z.B. 5 oder 11 zulaessig
   Put_Line(Inhalt1.Inhalt);
   
   -- Weisst dem String 20 moegliche Stellen zu und via others
   -- allen Stellen des Strings a zu.
   Inhalt1 := (20, (others => 'a'));
   Put_Line(Inhalt1.Inhalt);
   
   -- Pruefen ob ein Wert beschraenkt (constrained) ist
   if Inhalt1'Constrained then  
      Ada.Text_IO.Put_Line("Verbundvariable ist beschraenkt");
   else
      Ada.Text_IO.Put_Line("Verbundvariable ist unbeschraenkt");                           
   end if;
   
   if Inhalt2'Constrained then  
      Ada.Text_IO.Put_Line("Verbundvariable ist beschraenkt");
   else
      Ada.Text_IO.Put_Line("Verbundvariable ist unbeschraenkt");                           
   end if;

   
   
   
end s21records_verbunde;

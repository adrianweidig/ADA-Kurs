with Ada.Text_IO;

use Ada.Text_IO;

-- Zu Pack:
-- Ein "gepackter" Typ minimiert den Speicherbedarf, welcher fuer
-- ein Objekt reserviert wird auf Kosten der Zugriffsgeschwindigkeit,
-- da entsprechende Hintergrundprozesse mit der Nutzung von weniger
-- Speicher die gleiche Arbeit verrichten muessen.

-- Die genutzte Schrittweite ist immer das x-fache der entsprechenden
-- Word-Size (Bei uns 8)

procedure H2ArraysUndRecords is
   
   -----------------
   --- Arrays ------
   -----------------
   
   -- Typen und dazugehoerige Objekte
   -- Die Typen muessen zusammengesetzte Typen
   -- sein, wobei der Komponententyp eine
   -- klare Reichweite (festgelegt) haben muss.
   type Komponenten is range 0..10;
   type Array_Type is array (0..20) of Komponenten;
   
   -- Die Groesse der einzelnen Komponenten laesst sich
   -- ebenfalls manipulieren. (Hier uebetrieben gezeigt
   -- um es zu verdeutlichen)
   -- Dabei kann man sehr schoen folgendes Verhalten sehen:
   -- Typesize = Elements*ComponentSize
   for Array_Type'Component_Size use 800;
   -- 
   pragma Pack(Array_Type);
   
   -- AUSBILDERHINWEISE:
   -- pragma vorerst weglassen und zeigen, dass nach
   -- Verwendung des Pragmas die Size optimiert wurde.
   
   Ein_Array : Array_Type := (others => 10);
   
   -- ACHTUNG:
   -- Das pragma MUSS direkt nach der Deklarierung
   -- des Typen gesetzt werden.
   -- pragma Pack(Array_Type); --> Nicht erlaubt
      
   ------------------
   --- Records ------
   ------------------
   
   -- Ein Record kann auch nur "gepackt" werden, wenn
   -- es packbare Inhalte hat. Wenn nur Integer z.B.
   -- enthalten ist wird einfach der entsprechende Size
   -- Wert genutzt. Mit dem Array wird sich auf das 
   -- jeweils groessere Element bezogen.
   type Record_Type is record 
      Ein_Integer : Integer;
      Ein_Array   : Array_Type;
      
      -- Wenn man die Component Size zugewiesen hat, sieht
      -- man, dass die Record Groesse der Groesse der Summe
      -- aller Inhalte ist. (Bei Component Size 800 -> 16832
      --> 16832 = 32(Integer) + 16800(Array)  
   end record;
   pragma Pack(Record_Type);
   
   -- AUSBILDERHINWEISE:
   -- pragma vorerst weglassen und zeigen, dass nach
   -- Verwendung des Pragmas die Size optimiert wurde.
   -- Ebenfalls einmal mit und ohne dem Array als Inhalt
   -- zeigen bzw. dem Integer.
   
   Ein_Record : Record_Type := Record_Type'(Ein_Integer => 10,
                                            Ein_Array   => (others => 10));
   
begin
   
   -----------------
   --- Arrays ------
   -----------------
   
   Put_Line("Speichermenge von Array_Type: " & Integer'Image(Array_Type'Size));
   Put_Line("Speichermenge von Ein_Array : " & Integer'Image(Ein_Array'Size));
   
   Put_Line("Schrittweite von Array_Type: " & Integer'Image(Array_Type'Alignment));
   Put_Line("Schrittweite von Ein_Array : " & Integer'Image(Ein_Array'Alignment));
   
   ------------------
   --- Records ------
   ------------------
   New_Line;
   
   Put_Line("Speichermenge von Record_Type: " & Integer'Image(Record_Type'Size));
   Put_Line("Speichermenge von Ein_Record : " & Integer'Image(Ein_Record'Size));
   
   Put_Line("Schrittweite von Record_Type: " & Integer'Image(Record_Type'Alignment));
   Put_Line("Schrittweite von Ein_Record : " & Integer'Image(Ein_Record'Alignment));
   
   
end H2ArraysUndRecords;

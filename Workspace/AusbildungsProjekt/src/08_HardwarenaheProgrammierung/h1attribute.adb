with Ada.Text_IO, System;

use Ada.Text_IO;

procedure H1Attribute is
      
   -- Nutzvariablen
   Ein_Boolean : Boolean := True;
   
   -- Die Schrittweite / Alignment / Ausrichtung laesst
   -- sich ebenfalls manipulieren.
   for Ein_Boolean'Alignment use 64;
   
   -- AUSBILDERHINWEIS:
   -- die 'Aligment Parts auskommentieren und danach 
   -- zeigen welchen Einfluss dies ebenfalls auf die
   -- benoetigte Speichermenge hat.
   
   Eine_Zahl   : Integer := 10;  
   for Eine_Zahl'Alignment use 64;
   
   -- Erweiterungstypen
   -- Die Use Form auf 'Size ist nur auf EIGENE Typen
   -- anwendbar. NICHT auf Subtypen. 
   -- WICHTIG:
   -- Die Groesse kann nur erhoeht werden oder
   -- gleich dem Standard bleiben. Ist die Groesse
   -- zu hoch wird ein Warning ausgegeben, dass eine
   -- bestimmte Menge an Bits nicht genutzt wird.
   type EigenesBoolean is new Boolean;
   for EigenesBoolean'Size use 11;

   type EigenesInteger is new Integer;
   for EigenesInteger'Size use 100;
   
begin
   -----------------
   --- ATTRIBUTE ---
   -----------------
   
   -- Auszug aus dem Package System:
   --   Storage_Unit : constant := 8;
   --   Word_Size    : constant := Standard'Word_Size;
   --   Memory_Size  : constant := 2 ** Word_Size;
   
   -- Enthaelt systemspezifische Informationen
   -- Speichereinheit: Kleinst moegliche Verwendung EINER Einheit. Heisst
   --                  alle anderen Einheiten muessen durch diesen Wert teilbar sein.
   -- Wort           : Festgelegte Groesse an Informationen die eine Einheit bilden 
   --                  (Prozessorabhaengig) bei uns 64 Bit
   Put_Line("Bits pro Speichereinheit      : " & Integer'Image(System.Storage_Unit));
   Put_Line("Bits pro Wort                 : " & Integer'Image(System.Word_Size));
   
   ------------
   --- SIZE ---
   ------------
   New_Line;
   
   -- Ausgabe der benoetigen Speichermenge in Bits
   -- Mit 'Size kann sich diese fuer den entsprechenden Typen
   -- ausgegeben werden lassen.
   Put_Line("Standard-Speichermenge Boolean: " & Integer'Image(Boolean'Size));
   Put_Line("Standard-Speichermenge Integer: " & Integer'Image(Integer'Size));
   
   -- Diest ist auf einzelne Objekte ebenfalls anwendbar. Man sieht.
   -- Sollte mehr Platz benoetigt werden so wird dieser auch allokiert.
   Put_Line("Speichermenge von Ein_Boolean : " & Integer'Image(Ein_Boolean'Size));
   Put_Line("Speichermenge von Eine_Zahl   : " & Integer'Image(Eine_Zahl'Size));
   
   -- ACHTUNG:
   -- Es wird folgendes dargestellt:
   -- Bei Standardtypen wird angegeben wie viel Bits genutzt werden um den Typen 
   -- zu praesentieren.
   -- Bei Werten / Objekten wird angegeben wie viel Bits genutzt werden um den
   -- Wert in den Speicher zu legen.
   
   -----------------
   --- Alignment ---
   -----------------
   New_Line;
   
   -- Man sieht sehr schoen, dass das Alignment / die Ausrichtung
   -- bei den entsprechenden Objekten gleich dem Standard ist. 
   -- 'Alignment zeigt an welche "Schrittweite", also die minimale
   -- Groesse eines Objekts um in einer Storage_Unit genutzt werden
   -- zu koennen.
   --> Man sagt, dass das Alignment festlegt, dass folgende Anweisung immer true ist
   --> Data'Alignment = x  -/-  Data'Address mod x = 0
   Put_Line("Standard-Schrittweite Boolean : " & Integer'Image(Boolean'Alignment));
   Put_Line("Standard-Schrittweite Integer : " & Integer'Image(Integer'Alignment));
   Put_Line("Schrittweite Ein_Boolean      : " & Integer'Image(Ein_Boolean'Alignment));
   Put_Line("Schrittweite Eine_Zahl        : " & Integer'Image(Eine_Zahl'Alignment));
   
   ------------------------------
   --- SIZE CHANGING WITH USE ---
   ------------------------------
   New_Line;
   
   -- Die Use Form auf 'Size ist nur auf EIGENE Typen
   -- anwendbar. Man sieht hier die entsprechende Size
   -- welche fuer die Art der Typen vorgegeben ist.
   Put_Line("Neue Speichermenge Boolean    : " & Integer'Image(EigenesBoolean'Size));
   Put_Line("Neue Speichermenge Integer    : " & Integer'Image(EigenesInteger'Size));
   
end H1Attribute;

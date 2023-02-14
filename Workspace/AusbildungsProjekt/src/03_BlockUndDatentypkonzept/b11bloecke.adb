with Ada.Text_IO; use Ada.Text_IO;


procedure B11Bloecke is
    
   type ENUM_AUSSEN_T        is (Schwarz, Weiﬂ);
   
   subtype ZAHL_AUSSEN_SUB_T is Integer range 0 .. 100;
   
   Zahl_Aussen     : Integer;
   
   Enum_Aussen     : ENUM_AUSSEN_T;
   
   Sub_Zahl_Aussen : ZAHL_AUSSEN_SUB_T;
   
   
begin
   
   Zahl_Aussen     := 10;
   
   Enum_Aussen     := Schwarz;
   
   Sub_Zahl_Aussen := 50;
   
   -- Benannter Block - Ausgabe
   Ausgabe:
   declare   
      Zahl_Innen : Integer       := Zahl_Aussen+50;
      
      -- ACHTUNG:
      -- Dies ist eine innere Variable mit gleichem
      -- Bezeichner wie er bereits auﬂen vorhanden ist.
      -- Es sind jedoch an sich verschiedene Variablen.
      Zahl_Aussen: Integer       := 300;
      
      Enum_Innen : ENUM_AUSSEN_T := Schwarz;
      
   begin
      
      -- Ausgabe von Zahl_Aussen des BLOCKES
      -- nicht der auﬂen liegenden Procedure
      Put_Line("Zahl_Aussen (Im Block): " & Integer'Image(Zahl_Aussen));
      
      -- Zugriff / Ausgabe der auﬂen liegenden Variable
      Put_Line("Zahl_Aussen (Auﬂerhalb des Blocks): " & Integer'Image(B11Bloecke.Zahl_Aussen));
      
      Put_Line("Zahl_Innen (Im Block): " & Integer'Image(Zahl_Innen));
      
      Put_Line("Enum_Innen (Im Block): " & ENUM_AUSSEN_T'Image(Enum_Innen));
      
   end Ausgabe;
   
   -- Anonymer Block
   
   declare
      
      Zahl_Innen : Integer := Sub_Zahl_Aussen;
      
   begin
      
      Put_Line("Zahl_Innen (Im 2. Block): " & ZAHL_AUSSEN_SUB_T'Image(Zahl_Innen));
      
      -- Zahl_Innen = 50 --> + 10 --> Zahl_Aussen = 60
      -- Somit sieht man sehr schoen, dass man innerhalb
      -- der Bloecke Einfluss nach Aussen auswirken kann.
      Zahl_Aussen := Zahl_Innen +10;
               
   end;             
   
   -- Nicht moeglich. Innere Variablen koennen auﬂerhalb 
   -- von begin / declare nicht aufgegriffen werden.
   
   ------- >  Put_Line(Integer'Image(Zahl_Innen));
      
   Put_Line("Zahl_Aussen (Auﬂerhalb der Bloecke) veraendert durch Zahl_Innen + 10: " & Integer'Image(Zahl_Aussen));
   
   -- Konstanten innerhalb von Bloecken
   for I in 1 .. 5 loop
      declare
         -- Die Variable Konstante ist innerhalb des Blockes 
         -- eine Konstante, jedoch jeweils mit verschiedenem Inhalt,
         -- da diese innerhalb des Blockes quasi immer neu
         -- initialisiert wird.
         Konstante : constant INTEGER := I;

      begin
         Put_Line("Wert der Konstante: " & Integer'Image(Konstante));
      end;
   end loop;
   
   ------------------------- Block im Block --------------------
   Ebene2:
   declare
      type Zahl_Aussen is range 0 .. 10;
   begin -- Beginn von Ebene2
      Ebene3:
      declare
         -- Zahl_Aussen : Zahl_Aussen ist nicht moeglich,
         -- da der Eintrag Zahl_Aussen lokal bereits vorhanden ist
         -- Es wuer versucht werden den Zugriff auf sich selbst
         -- quasi zu schaffen.
         
         -- ACHTUNG:
         -- Sollte der aussen liegende Block (Ebene2) nicht benannt
         -- sein ist logischerweise kein Zugriff moeglich.
         Zahl_Aussen : Ebene2.Zahl_Aussen := 5;
         
         -- Weisst Zahl_Innen den Wert von Zahl_Aussen
         -- in Ebene 3 zu (5) 
         Zahl_Innen  : Ebene2.Zahl_Aussen := Zahl_Aussen;
         
      begin
         
         -- Weisst der auessersten Variable Zahl_Aussen
         -- von B11Bloecke den Wert 10 zu
         B11Bloecke.Zahl_Aussen := 99; -- Globales Objekt
         
         -- Weisst der in Ebene 3 liegenden Variable
         -- Zahl_Aussen den Wert 8 zu
         Zahl_Aussen            := 8; -- Lokales Objekt
      end Ebene3;
      
      -- Zugriff auf Ebene3 Variablen ist bereits hier nicht 
      -- mehr moeglich
      
   end Ebene2;
   
   -- Hier sieht man sehr schoen, dass Zahl_Aussen innerhalb
   -- der Ebene3 veraendert wurde. 
   Put_Line("Zahl_Aussen (Auﬂerhalb des Blocks): " & Integer'Image(Zahl_Aussen));
 
end B11Bloecke;

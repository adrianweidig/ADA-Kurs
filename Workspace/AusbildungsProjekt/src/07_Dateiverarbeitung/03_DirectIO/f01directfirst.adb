-- DirectIO laesst den Zugriff "wahlfrei" zu.
-- Dies bedeutet, dass quasi jede Position
-- innerhalb der Datei greifbar ist.

with Ada.Direct_IO, Ada.Text_IO;

use Ada.Text_IO;

procedure F01DirectFirst is

   package Integer_IO is new Ada.Direct_IO(Element_Type => Integer);
   use Integer_IO;
   
   Datei : Integer_IO.File_Type;
   
   Datei_Name : constant String := "Integer_Datei.dateiendung";
   
   procedure Auslesen is
      Zwischenwert : Integer;
   begin 
      -- Da wir in und out haben und kein Reset
      -- verwenden muessen wir den internen 
      -- Zeiger quasi wieder an den Anfang setzen.
      -- (Anfang = Stelle 1)
      Set_Index(File => Datei,
                To   => 1);
      
      while not End_Of_File (File => Datei) loop
         
         Read(Datei, Zwischenwert);
         Put_Line(Integer'Image(Zwischenwert));
         
      end loop;
   end Auslesen;
   
begin
   
   -- Direct_IO laesst kein Append zu. Gibt einem jedoch
   -- die Moeglichkeit In und Out gleichzeitig zu nutzen
   -- um so permanenten wahlfreien Zugriff zu gewaehrleisten.
   Create(File => Datei,
          Mode => Inout_File,
          Name => Datei_Name,
          Form => "");
   
   Write(Datei, 10);
   Write(Datei, 20);
   Write(Datei, 30);
   Write(Datei, 40);
   Write(Datei, 50);
   Write(Datei, 60);
   
   Auslesen;
   
   -- Direkte Aenderung
   -- Durch den direkten Zugriff und die Anpassung
   -- des Zeigers / Index koennen wir auch einzelne
   -- Stellen anpassen.
   
   Set_Index(File => Datei,
             To   => 3); -- Wert: 30
   
   Write(Datei, 60);

   -- Bezieht sich von Text_IO auch nur
   -- auf die Konsole.
   New_Line; 
   
   Auslesen;
   
   -- Bezieht sich von Text_IO auch nur
   -- auf die Konsole.
   New_Line; 
   
   -- Zeiger auf Stelle 60 legen
   Set_Index(File => Datei,
             To   => 60);
   
   -- An Stelle 60 wird jetzt 100
   -- geschrieben.
   Write(Datei, 100);
   
   -- Man sieht:
   -- Alle nicht befuellten Stellen bis zur
   -- Index Stelle werden mit 0 belegt.
   --> Zitat aus Direct_IO adb:
   --  Zeroes : constant System.Storage_Elements.Storage_Array :=
   --    (1 .. System.Storage_Elements.Storage_Offset (Bytes) => 0);
   --  Buffer used to fill out partial records
   Auslesen;
   
   -- Bezieht sich von Text_IO auch nur
   -- auf die Konsole.
   New_Line; 
   
   -- Ebenfalls ist das direkte Schreiben und Lesen moeglich
   Write(File => Datei,
         Item => 444,
         To   => 44);
   
   -- Schreibe die Zahl 444 an Stelle 44
   
   declare
      Zwischenwert : Integer;
   begin
      Read(File => Datei,
           Item => Zwischenwert,
           From => 44);
      
      Put_Line(Integer'Image(Zwischenwert));
   end;
   
   Delete(Datei);
   
end F01DirectFirst;

with Ada.Text_IO, Ada.Sequential_IO, F03DateiPackage;

use Ada.Text_IO, F03DateiPackage;

procedure F03ReadMain is
   
   Tmp_Vogel : Vogel;
   
   package Vogel_IO is new Ada.Sequential_IO(Element_Type => Vogel);
   
   Datei      : Vogel_IO.File_Type;
   
   Datei_Name : constant String := "Vogel.dat";
   
begin
   
   Vogel_IO.Open(File => Datei,
                 Mode => Vogel_IO.In_File,
                 Name => Datei_Name,
                 Form => "");
      
   -- Deserialisierung:
   -- Liest nun die in der Datei befindlichen
   -- Informationen und deserialisiert anhand
   -- der Typ-Eigenschaften von Vogel das Objekt
   -- und kann somit die Informationen entsprechend
   -- nutzen und auch ausgeben.
   -- Man beachte hierbei, dass die Typen exakt
   -- gleich sein MUESSEN. Sonst kann nicht deserialisiert
   -- werden.
   Vogel_IO.Read(File => Datei,
                 Item => Tmp_Vogel);
   
   Put_Line(Tmp_Vogel.Bezeichnung);
   
   Vogel_IO.Delete(Datei);
   
end F03ReadMain;

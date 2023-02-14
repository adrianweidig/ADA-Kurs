with F03DateiPackage, Ada.Sequential_IO, Ada.Text_IO;

use F03DateiPackage;

procedure F03WriteMain is
   
   Ein_Vogel : Vogel;
   
   Tmp_Vogel : Vogel;
   
   -- Das Warning kann ignoriert werden. Serialisieren und
   -- Deserialisieren von Klassen in Dateien sollte nicht
   -- unbedacht verwendet werden und setzt Verstaendnis
   -- von OOP voraus.
   package Vogel_IO is new Ada.Sequential_IO(Element_Type => Vogel);
   
   Datei      : Vogel_IO.File_Type;
   
   Datei_Name : constant String := "Vogel.dat";
   
begin
   
   Ein_Vogel.Bezeichnung := "Amsel     ";
   
   Vogel_IO.Create(File => Datei,
                   Mode => Vogel_IO.Out_File,
                   Name => Datei_Name,
                   Form => "");
   
   -- Serialisiert die Klasseninformationen zur Laufzeit
   -- in dem Datenstrom zur Datei Vogel.dat
   Vogel_IO.Write(File => Datei,
                  Item => Ein_Vogel);
   
   Vogel_IO.Reset(File => Datei,
                  Mode => Vogel_IO.In_File);
   
   -- Deserialisiert die Klasseninformationen zur Laufzeit
   -- ACHTUNG: 
   -- Deserialisieren nach der Laufzeit siehe F03Readmain
   -- ACHTUNG:
   -- Unbounded_Strings sorgt hier aufgrund der Hintergrund-
   -- funktionalitaet und der Verwendung von Initialize und
   -- Finalize zu Problemen.
   Vogel_IO.Read(File => Datei,
                 Item => Tmp_Vogel);
   
   Ada.Text_IO.Put_Line(Tmp_Vogel.Bezeichnung);

   Vogel_IO.Close(Datei);
   
end F03WriteMain;

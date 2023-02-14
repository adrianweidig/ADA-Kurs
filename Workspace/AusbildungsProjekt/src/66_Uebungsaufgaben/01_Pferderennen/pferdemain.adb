with PferdePackage;

procedure PferdeMain is

   -- Achtung:
   -- Da vorerst ein temporaeres Pferderennen erzeugt wird auch wenn
   -- wir eine bereits vorhandene Datei laden wird der Konstruktor
   -- dennoch aufgerufen. 
   
   -- Variante bei vorhandener Datei (Entsprechend auch eine angeben)
   Rennen1 : PferdePackage.Pferderennen := PferdePackage.Rennen_Laden
     (Pfad => "D:\Entwicklung\_Repos\AnwProgWeidig\ADA Lehrgang\Workspace\AusbildungsProjekt\Pferderennen_HugoRennen.psave");
   
   -- Variante bei fehlender Datei
   Rennen2 : PferdePackage.Pferderennen := PferdePackage.Rennen_Laden(Pfad => "NichtVorhanden");

begin
   PferdePackage.Rennen_Ausgeben(Das_Rennen => Rennen1);
   --PferdePackage.Rennen_Ausgeben(Das_Rennen => Rennen2);
   
   PferdePackage.Rennen_Starten(Das_Rennen => Rennen1);
   
   -- Achtung:
   -- Wenn beide Dateien gleich benannt sind von Anfang
   -- an wird beim Speichern ggf. ueberschrieben.
   PferdePackage.Rennen_Speichern(Das_Rennen => Rennen1);
   
   
   -- Loeschfunktion
   --  PferdePackage.Rennen_Pfad_Loeschen
   --    (Pfad => "D:\Entwicklung\_Repos\AnwProgWeidig\ADA Lehrgang\Workspace\AusbildungsProjekt\Pferderennen_Hugo.psave");
end PferdeMain;

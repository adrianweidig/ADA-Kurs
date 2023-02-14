with Ada.Text_IO;

procedure Template_Gen_Procedure is

   -- Unterprogramme
   -- -- Spezifikation
   -- -- -- Ueberladung

   procedure Ausgabe(Zahl1, Zahl2 : in INTEGER);
   procedure Ausgabe(Zahl1, Zahl2 : in FLOAT);
   -- fuer limited private - Implementierung notwendig
   procedure FloatZuweisung ( Von, Nach : in out FLOAT );
   procedure Zuweisung ( Von, Nach : in out INTEGER );

   -- private  vs. limited private
   -- limited private nur als Erweiterung (optional) vorstellen oder
   -- als Wiederholung fuer den naechsten Tag
   generic
      type ELEMENT is limited private;
      with procedure Zuweisung(Von, Nach : in out ELEMENT) is <>; -- limited private, notwendig
   procedure Tausche ( X, Y : in out ELEMENT);

   -- -- Bodies

   procedure Tausche ( X, Y : in out ELEMENT) is
      Temp : ELEMENT;
   begin
      -- fuer limited private - Implementierung notwendig
      Zuweisung(Nach => Temp,
                Von  => X);
      Zuweisung(Nach => X,
                Von  => Y);
      Zuweisung(Nach => Y,
                Von  => Temp);

      -- private - Implementierung
--        Temp := X;
--        X    := Y;
--        Y    := Temp;
   end Tausche;


   procedure Ausgabe(Zahl1, Zahl2 : in INTEGER) is
   begin
      Ada.Text_IO.Put_Line("Zahl1 = " & INTEGER'Image(Zahl1));
      Ada.Text_IO.Put_Line("Zahl2 = " & INTEGER'Image(Zahl2));
      Ada.Text_IO.New_Line;
   end Ausgabe;


   procedure Ausgabe(Zahl1, Zahl2 : in FLOAT) is
   begin
      Ada.Text_IO.Put_Line("Zahl1 = " & FLOAT'Image(Zahl1));
      Ada.Text_IO.Put_Line("Zahl2 = " & FLOAT'Image(Zahl2));
      Ada.Text_IO.New_Line;
   end Ausgabe;

   -- fuer limited private - Implementierung notwendig
   procedure FloatZuweisung ( Von, Nach : in out FLOAT ) is
   begin
      Nach := Von;
   end FloatZuweisung;

   procedure Zuweisung ( Von, Nach : in out INTEGER ) is
   begin
      Nach := Von;
   end Zuweisung;

   -- generische Prozeduren auspraegen, zweiter Parameter nur fuer limited private - Implementierung notwendig
   procedure Tausche_Int is new Tausche(ELEMENT => INTEGER);
   procedure Tausche_Flo is new Tausche(ELEMENT => FLOAT, Zuweisung => FloatZuweisung);

   -- Variablen
   Int_Zahl1, Int_Zahl2 : INTEGER := 0;
   Flo_Zahl1, Flo_Zahl2 : FLOAT   := 0.0;

begin
   -- Eingabe
   -- -- Werte setzen
   Int_Zahl1 := 10;
   Int_Zahl2 := 20;

   Flo_Zahl1 := 1.0;
   Flo_Zahl2 := 2.0;

   -- -- Inhalte zur Kontrolle ausgeben
   Ausgabe(Int_Zahl1, Int_Zahl2);
   Ausgabe(Flo_Zahl1, Flo_Zahl2);


   -- Bearbeitung
   -- -- Werte tauschen
   Tausche_Int(Int_Zahl1, Int_Zahl2);
   Tausche_Flo(Flo_Zahl1, Flo_Zahl2);

   -- Ausgabe
   -- -- Werte ausgeben
   Ausgabe(Int_Zahl1, Int_Zahl2);
   Ausgabe(Flo_Zahl1, Flo_Zahl2);

end Template_Gen_Procedure;

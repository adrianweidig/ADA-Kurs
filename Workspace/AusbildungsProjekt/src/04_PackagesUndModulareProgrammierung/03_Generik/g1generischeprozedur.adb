with Ada.Text_IO, g1tauschen;
use Ada.Text_IO;

procedure g1generischeProzedur is
   ---- Initialisierung
   Zahl1 : Integer := 10; 
   Zahl2 : Integer := 5;
   
   -- Es können nur bestimmte Typen genutzt werden.
   -- Unbestimmte Typen muessen in einem Subtype als
   -- bestimmte Typen dann genutzt werden, da ansonsten
   -- keine "Klarheit" besteht.
   subtype String_5 is String(1..5);
   String1 : String_5 := "Test1";
   String2 : String_5 := "Test2";
   
   -- Z.B. "Positive range <>" wäre nicht moeglich
   type Int_Array is array (1..10) of Integer; 
   Array1 : Int_Array := (others => 0);
   Array2 : Int_Array := (others => 1);
   
   type Enum is (Tag1, Tag2);
   Enum1 : Enum := Tag1;
   Enum2 : Enum := Tag2;
   
   Float1 : Float := 1.0;
   Float2 : Float := 2.0;
   
   -- HINWEIS:
   -- Bei der Nutzung von Diskriminanten muessen entsprechende Typen
   -- auch kompatibel sein.
   -- Z.B. waere es moeglich einen Record eine Laenge zu uebergeben um
   -- innerhalb verschiedene Arrays anhand der Laenge zu erzeugen. 
   -- Andere Records die ebenfalls mit als generischer Parameter uebergeben
   -- werden muessen dieser Laenge anhand der Diskriminante entsprechen.
   -- Ansonsten wird der sogenannte "Discriminant Check" nicht funktionieren.

   procedure Enum_Tausch is new g1tauschen.Tauschen(Generischer_Typ => Enum);
   
   procedure Float_Tausch is new g1tauschen.Tauschen(Generischer_Typ => Float);
   
   procedure Integer_Tausch is new g1tauschen.Tauschen(Generischer_Typ => Integer);
   
   procedure String_Tausch  is new g1tauschen.Tauschen(Generischer_Typ => String_5);
   
   procedure Array_Tausch   is new g1tauschen.Tauschen(Generischer_Typ => Int_Array);
   
   
   -- Durch die Nutzung der anderen Varianten (z.B. (<>) und digits <>) ist es
   -- moeglich auf die entsprechenden Tick (') Funktionen zuzugreifen die fuer
   -- den entsprechenden Datentypen festgelegt sind.
   -------------- Diskrete Typen ---------
   procedure Enum_Ausgabe is new g1tauschen.Gen_Ausgabe(Gen_Disk_Type => Enum);
   
   -------------- Gleitkommazahl Typen ----
   procedure Float_Ausgabe is new g1tauschen.Float_Ausgabe(Gen_Float_Type => Float);
   
   procedure Ausgabe is
   begin
      -- Vorabausgabe um die aktuellen Inhalte der Variablen zu sehen.
      Put_Line("Wert von Zahl1: " & Integer'Image(Zahl1));
      Put_Line("Wert von Zahl2: " & Integer'Image(Zahl2));
   
      Put_Line("Wert von String1: " & String1);
      Put_Line("Wert von String2: " & String2);
   
      Put("Array1: ");
      for Zahl of Array1 loop
         Put(Integer'Image(Zahl));
      end loop;
       
      New_Line;
   
      Put("Array2: ");
      for Zahl of Array2 loop
         Put(Integer'Image(Zahl));
      end loop;
   
      New_Line;
   
      Put_Line("Wert von Enum1: " & Enum'Image(Enum1));
      Put_Line("Wert von Enum2: " & Enum'Image(Enum2));
   
      Put_Line("Wert von Float1: " & Float'Image(Float1));
      Put_Line("Wert von Float2: " & Float'Image(Float2));
      
      Put_Line("-----------------------------------------------------------------------------------------------------------");
   end Ausgabe;
   

begin
   
   Ausgabe;
   
   -- Tausch der entsprechenden Werte
   Integer_Tausch(Zahl1, Zahl2);
   
   String_Tausch(String1, String2);
   
   Array_Tausch(Array1, Array2);
   
   Enum_Tausch(Enum1, Enum2);
   
   Float_Tausch(Float1, Float2);
   
   Enum_Ausgabe(Enum1);
   
   Enum_Ausgabe(Enum2);
   
   Float_Ausgabe(Float1);
   
   Float_Ausgabe(Float2);
   
   Ausgabe;
  
end g1generischeProzedur;

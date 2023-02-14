with Ada.Text_IO, System.Address_Image;

use Ada.Text_IO;

procedure d2ArraysUndRecords is
   
   -----------------------------------------------------------   
   ------------------------  Arrays  -------------------------   
   -----------------------------------------------------------   
   
   type Ein_Array is array (1.. 10) of Integer;
   
   type Array_Ref is access Ein_Array;
   
   -- Somit alloziieren wir hier bereits den Speicher
   -- fuer unser Array. Die klassischen Moeglichkeiten
   -- der Vorinitialisierung sind auch hier wieder
   -- moeglich und sollten genutz werden, da ansonsten
   -- die nicht initialisierten Stellen wieder mit 
   -- zufaelligen im Speicher liegenden Werten
   -- befuellt werden.
   
   -- Ebenfalls interessant:
   -- Wenn wir keine weitere Range angeben fuer das
   -- neu erzeugte Array wird ebenfalls recht klassisch
   -- die maximal moegliche Menge (hier 1..10) genutzt.
   Int_Array, Int_Array2 : Array_Ref := new Ein_Array'(others => 0);
   
   -----------------------------------------------------------   
   ------------------------  Records  ------------------------   
   ----------------------------------------------------------- 
   
   type Integer_Ref is access Integer;
   
   type Datensammlung is record
      Eine_Zahl   : Integer_Ref := new Integer;
   end record;
   
   type Sammlung_Ref is access all Datensammlung;
   
   Sammlung, Sammlung2 : Sammlung_Ref := new Datensammlung;
   
begin
   
   -----------------------------------------------------------   
   ------------------------  Arrays  -------------------------   
   -----------------------------------------------------------   
   
   -- Besonderheiten von Arrays und Records bei der
   -- Zuweisung von Werten:
   Int_Array.all(5) := 20;
   
   -- WICHTIG: Bei der Iteration muss jedoch wieder
   -- .all genutzt werden. Ebenso kann hier nicht die
   -- ab 2012 moegliche For-Each genutzt werden, da
   -- es sonst zu einem (unerwarteten) Constraint
   -- Error fuehrt.
   for Element in Int_Array.all'Range loop 
      Put(Integer'Image(Int_Array.all(Element)));
   end loop;
   
   New_Line;
   
   -- entspricht (Auﬂer der Zuweisungswert)
   Int_Array(5)     := 30;
   
   for Element in Int_Array.all'Range loop 
      Put(Integer'Image(Int_Array(Element)));
   end loop;
   
   New_Line;
   
   --------- Zuweisung
   
   Int_Array2 := Int_Array;
   
   for Element in Int_Array2.all'Range loop 
      Put(Integer'Image(Int_Array(Element)));
   end loop;
   
   New_Line;
   
   Put_Line("Adresswert von Int_Array  : " & System.Address_Image(Int_Array.all'Address));
   Put_Line("Adresswert von Int_Array2 : " & System.Address_Image(Int_Array2.all'Address));
   
   -----------------------------------------------------------   
   ------------------------  Records  ------------------------   
   ----------------------------------------------------------- 
   
   Sammlung.all.Eine_Zahl.all   := 10;
   
   Put_Line("Adresswert von Eine_Zahl in Sammlung  : " & Integer'Image(Sammlung.Eine_Zahl.all));
   
   Sammlung.Eine_Zahl.all       := 20;
   
   Put_Line("Adresswert von Eine_Zahl in Sammlung  : " & Integer'Image(Sammlung.Eine_Zahl.all));
   
   -- Ansonsten sind die Inhalte von Arrays und Records
   -- wie gewohnt im kompletten Auswahlspektrum nutzbar.
   
   --- ERKLAERUNG:
   -- Ada erkennt, dass bei der Nutzung von (X) oder .X auf den
   -- Inhalt des Arrays bzw. des Records zugegriffen werden moechte.
   -- Somit entfaellt die Notwendigkeit von .all und der Zugriff wird
   -- direkt auf die Elemente erlaubt. Wichtig hierbei ist zu beachten,
   -- dass wenn die Inhalte selbst auch Referenzen sind ich bei diesen
   -- dann wieder ganz klassisch .all nutzen muss (Ausser es sind ebenfalls
   -- Arrays oder Records).
   
   --------- Zuweisung
   -- Hier wird noch "irgendetwas" in Eine Zahl drinstehen wie man es von
   -- nicht initialisierten Integer Array Elementen kennt.
   Put_Line("Wert von Eine_Zahl in Sammlung2    : " & Integer'Image(Sammlung2.Eine_Zahl.all));
   Put_Line("Adresswert von Eine_Zahl in Sammlung2  : " & System.Address_Image(Sammlung2.Eine_Zahl'Address));
   
   Put_Line("Sammmlung = Sammlung2 ? : " & Boolean'Image(Sammlung = Sammlung2));
   
   Sammlung2 := Sammlung;
   
   Put_Line("Sammmlung = Sammlung2 ? : " & Boolean'Image(Sammlung = Sammlung2));
   
   Sammlung.Eine_Zahl.all := 9999;
   
   Put_Line("Adresswert von Sammlung   : " & System.Address_Image(Sammlung'Address));
   Put_Line("Adresswert von Sammlung2  : " & System.Address_Image(Sammlung2'Address));
   
   Put_Line("Adresswert von Eine_Zahl in Sammlung   : " & System.Address_Image(Sammlung.Eine_Zahl'Address));
   Put_Line("Adresswert von Eine_Zahl in Sammlung2  : " & System.Address_Image(Sammlung2.Eine_Zahl'Address));
   
   Put_Line("Wert von Eine_Zahl in Sammlung     : " & Integer'Image(Sammlung.Eine_Zahl.all));
   Put_Line("Wert von Eine_Zahl in Sammlung2    : " & Integer'Image(Sammlung2.Eine_Zahl.all));
   
end d2ArraysUndRecords;

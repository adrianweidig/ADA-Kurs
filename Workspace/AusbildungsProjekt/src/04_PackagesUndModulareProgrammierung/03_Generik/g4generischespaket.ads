generic
   -- Hier deklarierte Typen sorgen dafuer, dass die entsprechende Verwendung
   -- des Paketes mit der generischen Auspraegung zusammenhaengt und somit auch
   -- jedes Mal genutzt werden muss.  

   -- Generische Typen
   type Welcher_Typ is private;
   
   -- Generische Objekte
   -- Man beachte, dass wenn nur in genutzt wird IMMER der Initialwert
   -- genutzt wird. Sollte man den Wert aendern wollen muss out genutzt
   -- werden um auf die veraenderten Werte zuzugreifen.
   -- --> Zeigen in dem man out weglaesst (Dann kommt 50 raus mit in und out 10)
   InhaltsObjekt : in Welcher_Typ;  

package g4GenerischesPaket is

   generic
      -- Generische Unterprogramme
      with function Als_String(Element : Welcher_Typ) return String;
   procedure Rueckgabe;
      

end g4GenerischesPaket;

with Ada.Text_IO, System.Address_Image;

use Ada.Text_IO;

procedure dd1MainListe is
   
   -- Unvollstaendiger Typ der vorerst nur zum
   -- Bekanntmachen zur Verfuegung steht.
   type ListenElement_T;
   
   -- Jedes XXX_REF zeigt nun auf ein ListenElement_T
   type ListenElement_REF is access ListenElement_T;
   
   type ListenElement_T is record
      Element_Info      : Integer;
      Davor_Erstelltes_Element : ListenElement_REF;
      
      -- Was passiert hier:
      -- In dem Record zeigt das Naechste_Element selbst
      -- ebenfalls immer auf den aussenstehenden Record
      -- selbst.
   end record;
   
   ------------ Entsprechende Zeiger ------------ 
   
   -- Wir benoetigen Zwei Zeiger. 
   -- Aktuelles_Element ist der Eingangspunkt. Also das zuletzt
   -- erstellte Listenelement. 
   Aktuelles_Element, Zeiger : ListenElement_REF;
   
begin
   -- Wir Erstellen des neue Element 
   Aktuelles_Element := new ListenElement_T'(1, Aktuelles_Element);
   
   -- Da das Aktuelle Element zum Zeitpunkt der Erstellung noch nicht 
   -- initialisiert oder vorhanden war steht an der Stelle aktuell
   -- noch null
   if Aktuelles_Element.Davor_Erstelltes_Element = null then
      Put_Line("Das zuvor erstellte Element ist noch nicht vorhanden (= null)");
   end if;
   
   -- Inhalte unseres Aktuelles_Element
   Put_Line("Element_Info des aktuellen Elements                : " & Integer'Image(Aktuelles_Element.Element_Info));

   -- Adresse unseres nun initialisierten Elements
   Put_Line("Adresswert von Aktuelles_Element                   : " & System.Address_Image(Aktuelles_Element.all'Address));
   
   -- Geht nicht, da hier Davor_Erstelltes_Element noch nicht erzeugt ist
   -- und somit auf eine Null-Referenz zeigt --> null
   -- Put_Line("Adresswert von Aktuelles_Element.Davor_Erstelltes_Element : " & System.Address_Image(Aktuelles_Element.Davor_Erstelltes_Element.all'Address));
   
   New_Line;
   
   ----------------------- Erzeugen des ersten weiteren Elementes ----------------------------
   
   -- Die Zuweisung zum neuen ListenElement_T erfolgt ueber den Zeiger des Elements
   -- welches VOR der Erstellung noch das Aktuelle_Element war. (Verwirrend)
   
   -- Somit haben wir wörtlich:
   -- "Unser neues "aktuelle Element", welches ein ListenElement_T ist, ist ein neues
   -- ListenElement_T. Dieses erhaelt bei der Erzeugung den Wert unseres "vorherigen
   -- ListenElement_T. (Erst wird der rechte Part der Zuweisung, dann der Linke Teil
   -- quasi ausgefuehrt)
   Aktuelles_Element := new ListenElement_T'(2, Aktuelles_Element);

   Put_Line("Element_Info des aktuellen Elements                : " & Integer'Image(Aktuelles_Element.Element_Info));
   
   Put_Line("Adresswert von Aktuelles_Element                   : " & System.Address_Image(Aktuelles_Element.all'Address));
   
   ----- Naechstes_Element
   Put_Line("Element_Info des davor erstellten Elementes        : " & Integer'Image(Aktuelles_Element.Davor_Erstelltes_Element.Element_Info));
   
   -- Hier sehen wir, dass in Davor_Erstelltes_Element nun die Adresse des vorherigen Elements enthalten ist.
   -- Vom Wording her verwirrend, jedoch bauen wir quasi eine Liste nach rechts hin auf. Aktuelles_Element zeigt 
   -- somit immer auf das zuletzt erstellte Element. 
   Put_Line("Adresswert von Aktuelles_Element.Naechstes_Element : " & System.Address_Image(Aktuelles_Element.Davor_Erstelltes_Element.all'Address));
   
   New_Line;
   
   ----------------------- Erzeugen des zweiten weiteren Elementes ----------------------------
   Aktuelles_Element := new ListenElement_T'(3, Aktuelles_Element);
   
   ----- Das 3. Element
   Put_Line("Element_Info des aktuellen Elements                : " & Integer'Image(Aktuelles_Element.Element_Info));
   
   Put_Line("Adresswert von Aktuelles_Element                   : " & System.Address_Image(Aktuelles_Element.all'Address));
   
   ----- Das 2. Element
   Put_Line("Element_Info des davor erstellten Elementes        : " & Integer'Image(Aktuelles_Element.Davor_Erstelltes_Element.Element_Info));

   Put_Line("Adresswert von Aktuelles_Element.Naechstes_Element : " & System.Address_Image(Aktuelles_Element.Davor_Erstelltes_Element.all'Address));
   
   ----- Das 1. Element
   Put_Line("Element_Info des davor erstellten Elementes        : " & Integer'Image(Aktuelles_Element.Davor_Erstelltes_Element.Davor_Erstelltes_Element.Element_Info));

   Put_Line("Adresswert von Aktuelles_Element.Naechstes_Element : " & System.Address_Image(Aktuelles_Element.Davor_Erstelltes_Element.Davor_Erstelltes_Element.all'Address));
   
   -- Anhand der Adressen sieht man schoen den Zusammenhang.
   
end dd1MainListe;

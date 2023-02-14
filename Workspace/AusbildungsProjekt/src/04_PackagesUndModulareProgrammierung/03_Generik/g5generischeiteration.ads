generic
   -- Wir wollen auch selbst festlegen wie gross unsere Box sein soll.
   Wie_Gross_Ist_Die_Box : in out Integer;
   
   -- Wir wollen unterschiedliche Inhalte hinzufuegen.
   type Was_Soll_In_Die_Box is private;
   
   type Test (<>);
 
   -- Um die Inhalte einfach ausgeben zu lassen moechten wir
   -- direkt eine Moeglichkeite haben unsere Elemente auf
   -- einfache Art und Weise ausgeben zu lassen.
   with function To_String(Inhalt : in out Was_Soll_In_Die_Box) return String;

package g5GenerischeIteration is
   
   -- Dinge in meine Box reinlegen
   procedure Hinzufuegen(Inhalt : in Was_Soll_In_Die_Box);
   
   -- Aktuelle Elemente meiner Box ausgeben lassen
   procedure Ausgeben;
   
   -- Elemente rekursiv ausgeben lassen
   procedure Ausgeben_Rekursiv;
   
   -- So erhalten wir die aktuelle Groesse unserer Box
   procedure Boxgroesse;
   
   Box_Voll : exception;
   
private 
   procedure Rekursion(Start_Wert : Integer);
   
   -- Unsere Box ist eine Array der vorgegebenen Groesse
   type BOX_TA is array(1..Wie_Gross_Ist_Die_Box) of Was_Soll_In_Die_Box;
   
   -- UnsereBox als ADO
   Die_Box : BOX_TA;
   
   -- Unseren Zeiger der einen Constraint_Error wirft sobald wir
   -- ueber seine Grenze hinaus gehen.
   Zeiger  : Integer := 1; 
   
   -- Ein Boolean Wert welcher auf True gesetzt wird wenn meine Box
   -- voll ist um jegliche weitere Operationen direkt verhindern zu
   -- koennen.
   Ist_Voll: Boolean;
   

end g5GenerischeIteration;

with p3schrank.funktionen;

package p3schrank is
  
   -- Sogenannter Anonymer Daten Typ 
   --> Von auﬂen nutzbar, jedoch ohne Informationen
   -- Da der Typ "anonym" ist macht es keinen Sinn
   -- durch Syntaxrichtlinien diesen naeher zu beschreiben.
   
   -- Beim Schritt limited diesen Typ auf limited setzen
   -- um zu zeigen, dass dann keine Zuweisung zueinander
   -- und kein Vergleich zulaessig ist.
   
   -- WARUM?
   -- limited Typen haben die Moeglichkeit eben diese
   -- nicht moeglichen Operatoren zu ueberschreiben
   --> = und /= , Eine Zuweisung bleibt jedoch verwehrt.
   
   -- Wann macht das Sinn?
   -- Z.B. bei Dateien macht es Sinn, dass Datei1 = Datei2
   -- nicht moeglich ist.
   
   -- type SCHRANK is limited private; -- ADT
   type SCHRANK is private; -- ADT
   
   procedure Hinzufuegen (Anzahl : in Integer);
   function  Herausnehmen(Anzahl : in Integer) return Integer;
   
   Schrank_Voll : exception;
   
   -- Nicht moeglich, da hier der Typ Schrank
   -- noch nicht vollstaendig ist.
   
   -- DerSchrank : SCHRANK;
   
   -- Dieser Bereich ist nicht von auﬂen zugaenglich,
   -- jedoch von den Unterpaketen (Children) nutzbar.
private 
   type BUCH_T is (Roman, Krimi, Leer);

   -- Elemente von FACH_TA sind auch ADOs
   type FACH_TA is array (1 .. 10) of BUCH_T; 

   -- Das sich hier ein weiteres Array anbietet ist 
   -- logisch. Dies dient der Veranschaulichung.
   
   -- type SCHRANK is limited record
   type SCHRANK is  record
      Fach1 : FACH_TA; -- ADO
      Fach2 : FACH_TA; -- ADO
      Fach3 : FACH_TA; -- ADO
      Fach4 : FACH_TA; -- ADO
      Fach5 : FACH_TA; -- ADO
   end record;
   
   -- Ab hier ist der Typ Schrank vollstaendig und
   -- somit nutzbar.
   
   
   
   -- Weitere Nutzung ist hier nicht vorgesehen
   DerSchrank : SCHRANK;
   
   DerSchrank2 : SCHRANK;
   -- ADO - Anonymes Daten Objekt - Ist ein in private deklariertes
   -- Objekt. 
end p3schrank;

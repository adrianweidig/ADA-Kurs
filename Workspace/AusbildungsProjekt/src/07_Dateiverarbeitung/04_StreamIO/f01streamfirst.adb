-- Bisher hat man auf den Datenstrom durch die Bekanntgabe
-- des Typen zugegriffen.
-- Mit Stream_IO ist es moeglich den Strom (Stream) selbst
-- zu nutzen und ist dadurch extrem vielseitig anwendbar,
-- da keine Typeinschraenkung vorhanden ist.
-- Wir hatten bei Sequential_IO bereits mit Klassen gearbeitet,
-- welche jedoch aufgrund der Typgenauigkeit und Bekanntheit
-- auch zwischen anderen Dateien genutzt werden konnte.
-- Jedoch ist es mit Stream_IO moeglich auch darueber hinaus
-- Informationen und Stroeme zu nutzen. 
-- (Beispiel: Unbounded_String hat nicht funktioniert aufgrund
-- der Informationen die bei der Nutzung der Konstruktorfunktionen
-- mitgegeben werden)

with Ada.Text_IO, Ada.Streams.Stream_IO, Ada.Strings.Unbounded;

use Ada.Strings.Unbounded;

procedure F01StreamFirst is
   
   -- Um Unterschied zwischen Stream und Text_IO
   -- zu sehen.
   package TIO renames Ada.Text_IO;
   
   package SIO renames Ada.Streams.Stream_IO;
   
   -- Einfaches Beispiel mit simplen Text
   -- um die Verwendung von Stream_IO zu
   -- verdeutlichen.
   
   Datei : SIO.File_Type;

   Datei_Stream : SIO.Stream_Access;
   
   Datei_Name : constant String := "Stream_File.olaf";
   
begin
   
   -- Je nachdem ob die Datei bereits existiert oder
   -- erzeugt werden soll entweder Open oder Create
   SIO.Create(File => Datei,
              Mode => SIO.Out_File,
              Name => Datei_Name,
              Form => "");
   
   -- Nachdem eine Datei geoeffnet (Was ja auch bei Create
   -- passiert) wurde kann man sich die Stream-Informationen
   -- davon holen.
   Datei_Stream := SIO.Stream(Datei);
   
   -- Durch das Nutzen von 'Write koennen wir dies in Verbindung
   -- mit den nun vorhandenen Streaminformationen nutzen und auf
   -- beliebige Typen anwenden. Wichtig ist, dass wir beim
   -- Lesen die bekannte Reihenfolge dann einhalten.
   
   Unbounded_String'Write(Datei_Stream, To_Unbounded_String("Guten Tag!"));
   Boolean'Write(Datei_Stream, True);
   Float'Write(Datei_Stream, 10.0);
   Integer'Write(Datei_Stream, 50);

   SIO.Close(Datei);
   
   -- Weitere Moeglichkeit simpel einfach den
   -- Modus zu wechseln.
   -- ACHTUNG: Hier wird nur der Modus geaendert
   --          ohne den Zeiger auf Anfang zu setzen.
  
   -- SIO.Set_Mode(File => Datei,
   --             Mode => SIO.In_File);
   
   --  SIO.Reset(File => Datei,
   --            Mode => SIO.In_File);
   
   SIO.Open(File => Datei,
            Mode => SIO.In_File,
            Name => Datei_Name,
            Form => "");
   
   Datei_Stream := SIO.Stream(Datei);
   
   declare
      -- ACHTUNG:
      -- Der String erhaelt eine vorgegebene
      -- Laenge von uns und auch nur in diese
      -- kann reingeschrieben werden. Es wird
      -- kein Constraint Error ausgeloest.
      -- Geben wir "" als Initialwert an wird
      -- auch kein Platz belegt werden koennen.
      -- Ist unser String laenger als das war
      -- wir reinschreiben wollen wird ein
      -- END_ERROR ausgeloest.
      -- Hier bietet es sich an Unbounded_Strings 
      -- zu nutzen.
      
      Tmp_String : Unbounded_String;
      Tmp_Boolean: Boolean;
      Tmp_Float  : Float;
      Tmp_Integer: Integer;
      
   begin
      
      Unbounded_String'Read(Datei_Stream, Tmp_String);
      Boolean'Read(Datei_Stream, Tmp_Boolean);
      Float'Read(Datei_Stream, Tmp_Float);
      Integer'Read(Datei_Stream, Tmp_Integer);
      
      TIO.Put_Line(To_String(Tmp_String));
      TIO.Put_Line(Boolean'Image(Tmp_Boolean));
      TIO.Put_Line(Float'Image(Tmp_Float));
      TIO.Put_Line(Integer'Image(Tmp_Integer));
      
      -- ACHTUNG:
      -- Wird an einer Stelle nicht richtig gelesen,
      -- so sind alle folgenden Informationen ebenfalls
      -- "kaputt" und koennen nicht genutzt werden.
      
      -- Die Datei hat also eine komplett festgelegte
      -- Identitaet welche beruecksichtigt werden muss.
      
      SIO.Delete(Datei);
      
   end;

end F01StreamFirst;

with Ada.Numerics.Discrete_Random;

with Ada.Text_IO;

with Ada.Streams.Stream_IO;

with System.Address_Image;

package body PferdePackage is
   -- RENAMES
   package SIO renames Ada.Streams.Stream_IO;
   package TIO renames Ada.Text_IO;
   package Unbound renames Ada.Strings.Unbounded;
   
   -- Pferdekonstruktor
   overriding procedure Initialize(this : in out Pferd) is
      -- Zufallsgeschwindigkeit
      
      package Random_Speed is new Ada.Numerics.Discrete_Random(Result_Subtype => Geschwindigkeit);
      
      Speed_Generator : Random_Speed.Generator;
      
   begin
      Random_Speed.Reset(Speed_Generator);
      
      this.Nummer    := Pferde_Counter;
      
      Pferde_Counter := Pferde_Counter + 1;
      
      this.Renngeschwindigkeit := Random_Speed.Random(Speed_Generator);
      
      this.Position            := 0;
   end Initialize;
   
   -- Rennenkonstruktor
   overriding procedure Initialize(this : in out Pferderennen) is
   begin
      Pferde_Counter := 1; 
      TIO.Put_Line("Wie moechten Sie dieses Rennen benennen?");
      this.Rennen_Bezeichnung := Unbound.To_Unbounded_String(TIO.Get_Line);
   end Initialize;
   
   -- Gibt alle Pferde nacheinander aus mit deren aktuellen
   -- Werten
   procedure Rennen_Ausgeben   (Das_Rennen : in Pferderennen) is 
   begin
      TIO.Put_Line(" ---------------------------------------- ");
      TIO.Put_Line(Unbound.To_String(Das_Rennen.Rennen_Bezeichnung));
      for Ein_Pferd of Das_Rennen.Echtes_Rennen loop
         TIO.Put_Line(" ---------------------------------------- ");
         TIO.Put_Line(" --           Pferdenummer:" & Integer'Image(Ein_Pferd.Nummer));
         TIO.Put_Line(" -- Geschwindigkeit (km/h):" & Geschwindigkeit'Image(Ein_Pferd.Renngeschwindigkeit));
         TIO.Put_Line(" --               Position:" & Integer'Image(Ein_Pferd.Position));
         TIO.Put_Line(" ---------------------------------------- ");
      end loop;
   end Rennen_Ausgeben;
   

   procedure Rennen_Starten    (Das_Rennen : in out Pferderennen) is 
      Sieger : Boolean := False;
      
      procedure Start (Ein_Pferd : in out Pferd) is
      begin
         delay 0.1;
         Ein_Pferd.Position := Ein_Pferd.Position + Ein_Pferd.Renngeschwindigkeit;
         TIO.Put_Line("Pferd Nr." & Integer'Image(Ein_Pferd.Nummer) & " jetzt an Position: " & Integer'Image(Ein_Pferd.Position));
      end Start;
      
      subtype Pferd is Integer range 1..10;
      package Random_Pferd is new Ada.Numerics.Discrete_Random(Result_Subtype => Pferd);
      
      Pferd_Generator : Random_Pferd.Generator;
      
   begin
      
      Random_Pferd.Reset(Pferd_Generator);

      while Sieger = False loop
         declare
            Zahl : Integer := Random_Pferd.Random(Pferd_Generator);
         begin
            
            if Sieger = False then
               Start(Das_Rennen.Echtes_Rennen(Zahl));
            end if;
               
            if Das_Rennen.Echtes_Rennen(Zahl).Position >= 500 then
               TIO.Put_Line("Pferd Nr." & Integer'Image(Das_Rennen.Echtes_Rennen(Zahl).Nummer) & " ist der Sieger!");
               Sieger := True;
            end if;
         end;
      end loop;
    
   end Rennen_Starten;
   
   -- Setzt alle Pferde an den Start
   procedure Rennen_Neustarten (Das_Rennen : in out Pferderennen) is 
   begin
      for Ein_Pferd of Das_Rennen.Echtes_Rennen loop
         Ein_Pferd.Position := 0;
      end loop;
      
      TIO.Put_Line("Rennen neugestartet!");
   end Rennen_Neustarten;
   
   -- Speichert das angegebene Rennen
   procedure Rennen_Speichern  (Das_Rennen : in Pferderennen) is 
      -- Stream-Objekte
      Datei        : SIO.File_Type;
      
      Datei_Stream : SIO.Stream_Access;
      
      Datei_Name   : String := "Pferderennen_" & Unbound.To_String(Das_Rennen.Rennen_Bezeichnung) & ".psave";
 
   begin

      SIO.Create(File => Datei,
                 Mode => SIO.Out_File,
                 Name => Datei_Name);
      
      Datei_Stream := SIO.Stream(Datei);
      
      Pferderennen'Write(Datei_Stream, Das_Rennen);
    
      SIO.Close (Datei);
   end Rennen_Speichern;
      
   -- Läd das angegebene Rennen ueber den absoluten Pfad
   function Rennen_Laden (Pfad : String) return Pferderennen is 
      Datei        : SIO.File_Type;
      
      Datei_Stream : SIO.Stream_Access;
      
      Tmp_Rennen   : Pferderennen;

   begin
      begin
         SIO.Open(File => Datei,
                  Mode => SIO.In_File,
                  Name => Pfad);
      
         Datei_Stream := SIO.Stream(Datei);
      
         Pferderennen'Read(Datei_Stream, Tmp_Rennen);
         
         -- Alternativ:
         -- Tmp_Rennen := Pferderennen'Input(Datei_Stream);
         
         SIO.Close (Datei);
      exception
         when SIO.Name_Error
            => TIO.Put_Line("Keine Datei an angegebenen Pfad gefunden. Neues Rennen initialisiert.");
      end;
      
      return Tmp_Rennen;
   end Rennen_Laden;
   
   -- Loescht ein Rennen am angegebenen Pfad
   procedure Rennen_Pfad_Loeschen   (Pfad : String) is
      Datei        : SIO.File_Type;
   begin
      begin
         SIO.Open(File => Datei,
                  Mode => SIO.In_File,
                  Name => Pfad);
      
         SIO.Delete(Datei);
      exception
         when SIO.Name_Error
            => TIO.Put_Line("Keine Datei an angegebenen Pfad gefunden.");
      end;
   end Rennen_Pfad_Loeschen;
   
end PferdePackage;

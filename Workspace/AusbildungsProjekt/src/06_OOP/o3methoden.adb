with O3TierMethoden, Ada.Strings.Unbounded, Ada.Text_IO;

use O3TierMethoden, Ada.Strings.Unbounded, Ada.Text_IO;

procedure O3Methoden is
   
   -- Karpfen : Fisch;
   
   -- Hier findet keine Zuweisung statt, sondern
   -- die Generierung eines kommplett neuen
   -- Objektes dessen Initialisierungsparameter
   -- ueber eine Vaterklasse gefunden werden.
   
   ------- AGGREGATE --------
   
   -- Hierarchisch gesehen sind die benoetigten Parameter 
   -- von Lebewesen aus gesehen einmal die Bezeichnung
   -- unter der Klasse Tier, sowie der Flugfaehigkeit 
   -- von Vogel
   Amsel      : Vogel := (Lebewesen with (To_Unbounded_String("Amsel")), True);
   
   -- Hierarchisch gesehen sind die benoetigten Parameter
   -- von Tier aus gesehen nur die Flugfaehigkeit von
   -- Vogel
   
   -- BEACHTE:
   -- Die Sicht der Vaterklasse bezieht nicht sich selbst mitein dadurch
   -- kann bei "Tier" nicht die Bezeichnung mit angegeben werden.
   -- Die Verwendung dieses Aggregates macht natuerlich nur Sinn, wenn die
   -- vorherigen Eigenschaften bereits initialisiert sind.
   
   -- z.B. Hat dieser Tote Vogel keine Bezeichnung
   ToterVogel : Vogel := (Tier with (False));
   
   ------- NORMALE INITIALISIERUNG --------
   
   Karpfen : Fisch := (To_Unbounded_String("Karpfen"), True);
   
   -- BEACHTE:
   -- Da wir hier keinen Fisch erzeugen
   -- und diesen an eine Moewe uebergeben
   -- wollen, koennen wir hier die Aggregat
   -- Schreibweise nutzen um ein Fisch-Objekt
   -- mit zu initialisieren.
   -- Dieses verschwindet sobald die Moewe
   -- verschwindet. Das nennt man Komposition.
   Eine_Moewe   : Moewe := (To_Unbounded_String("Moewe"), True, (Tier with (True)));
   
begin
   ------- BEZEICHNUNG ALLER OBJEKTE --------
   Put_Line("Bezeichner:");
   Put_Line("Amsel     : " & To_String(Amsel.Bezeichnung));
   
   -- Hier sieht man sehr schoen, dass durch die Verwendung
   -- des Aggregates auch keine Gewaehrleistung der nicht
   -- beruecksichtigten Inhalte vorhanden ist. Somit hat
   -- unser ToterVogel keine Bezeichnung.
   
   Put_Line("ToterVogel: " & To_String(ToterVogel.Bezeichnung));
   Put_Line("Karpfen   : " & To_String(Karpfen.Bezeichnung));
   Put_Line("Eine_Moewe: " & To_String(Eine_Moewe.Bezeichnung));
   
   New_Line;
   
   ------ AUFRUF ALLER VORHANDENEN METHODEN --------
   
   -- ACHTUNG BEI ADA 95:
   -- Unter ADA 95 muss man wie gewohnt das Paket
   -- ausweahlen. Anschliessend das aufzurufende
   -- Unterprogramm und als Parameter dann das
   -- entsprechende Objekt.
   --  O3TierMethoden.Atmen(Amsel);
   
   Put_Line("-- Amsel:");
   Amsel.Atmen;
   Amsel.Fliegen;
   
   New_Line;
   
   Put_Line("-- ToterVogel:");
   ToterVogel.Atmen;
   ToterVogel.Fliegen;
   
   New_Line;
   
   Put_Line("-- Karpfen:");
   Karpfen.Atmen;
   Karpfen.Schwimmen;
   
   New_Line;
   
   Put_Line("-- Eine_Moewe");
   Eine_Moewe.Atmen;
   Eine_Moewe.Fliegen;
   
   -- Durch die Erzeugung des temporaeren 
   -- Objektes als Zugriff auf die Fischeigenschaften
   -- koennen wir somit unsere Moewe schwimmen 
   -- lassen.
   
   Eine_Moewe.Fischeigenschaften.Schwimmen;
   
   New_Line;
   
   --- Normale Aenderungen von Inhalten ---
   ToterVogel.Flugfaehigkeit := True;
   Put_Line("-- ToterVogel(Wiederbelebt):");
   ToterVogel.Atmen;
   ToterVogel.Fliegen;
   
   
end O3Methoden;

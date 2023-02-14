-- Wir sehen, dass wir auch in eigenen packages
-- Fremdpakete einbinden und nutzen koennen.

-- Generischen Paketen ist es nicht erlaubt die Use-Klausel
-- zu nutzen, da diese explizit ausgepraegt werden muessen.
with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;                  use Ada.Text_IO;

package body p3schrank.funktionen is

   ---------------------------
   -- FaecherInitialisieren --
   ---------------------------

   procedure FaecherInitialisieren is

      -- Generische Auspraegung fuer die Zufallsgenerierung
      -- eines generischen Typs (In unserem Fall BUCH_T)

      -- Wir sehen, dass wir auch im body Zugriff
      -- auf die private Inhalte des Vaterpakets haben (BUCH_T)
      package RANDOM_BUCH is new Ada.Numerics.Discrete_Random(Result_Subtype => BUCH_T);

      Buch_Generator : RANDOM_BUCH.Generator;

   begin

      -- Der Schrank ist im private Bereich unseres Vaterpakets
      -- und fuer uns somit zugaenglich.
      for I in DerSchrank.Fach1'Range loop
         DerSchrank.Fach1(I) := RANDOM_BUCH.Random(Buch_Generator);
      end loop;

      for I in DerSchrank.Fach2'Range loop
         DerSchrank.Fach2(I) := RANDOM_BUCH.Random(Buch_Generator);
      end loop;

      for I in DerSchrank.Fach3'Range loop
         DerSchrank.Fach3(I) := RANDOM_BUCH.Random(Buch_Generator);
      end loop;

      for I in DerSchrank.Fach4'Range loop
         DerSchrank.Fach4(I) := RANDOM_BUCH.Random(Buch_Generator);
      end loop;

      for I in DerSchrank.Fach5'Range loop
         DerSchrank.Fach5(I) := RANDOM_BUCH.Random(Buch_Generator);
      end loop;

   end FaecherInitialisieren;

   ---------------------------
   ----- FaecherAusgeben -----
   ---------------------------

   procedure FaecherAusgeben is

   begin

      Put_Line("Fach 1:");
      for I in DerSchrank.Fach1'Range loop
         Put_Line("     Stelle " & Integer'Image(I) & " : " & BUCH_T'Image(DerSchrank.Fach1(I)));
      end loop;

      Put_Line("Fach 2:");
      for I in DerSchrank.Fach2'Range loop
         Put_Line("     Stelle " & Integer'Image(I) & " : " & BUCH_T'Image(DerSchrank.Fach2(I)));
      end loop;

      Put_Line("Fach 3:");
      for I in DerSchrank.Fach3'Range loop
         Put_Line("     Stelle " & Integer'Image(I) & " : " & BUCH_T'Image(DerSchrank.Fach3(I)));
      end loop;

      Put_Line("Fach 4:");
      for I in DerSchrank.Fach4'Range loop
         Put_Line("     Stelle " & Integer'Image(I) & " : " & BUCH_T'Image(DerSchrank.Fach4(I)));
      end loop;

      Put_Line("Fach 5:");
      for I in DerSchrank.Fach5'Range loop
         Put_Line("     Stelle " & Integer'Image(I) & " : " & BUCH_T'Image(DerSchrank.Fach5(I)));
      end loop;

   end FaecherAusgeben;

end p3schrank.funktionen;

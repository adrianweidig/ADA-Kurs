-- Shift + Linksklick um in die einzelnen Packages zu springen
-- Zeigen, dass man nur Einsicht auf die .ads erhaelt. Erst
-- wenn man dann auf einzelne Functions weiter klickt wird man
-- in die adb weitergeleitet.

-- Elementary_Functions ist z.B. nicht fuer den Nutzer
-- in Ada.Numerics ersichtlich --> Child-Package

-- Im Child Package Numerics --> Elementary_Functions 
--> Generic_Elementary_Functions --> (Irgendeine Funktion)
--> leitet in .adb weiter --> Ersichtliche Nutzung der Inhalte
--> des Vaterpaketes Ada.Numerics

-- Anhand von Ada.Numerics sieht man auch sehr schoen, dass
-- wenn es keine Initialisierung oder Implementierungs-
-- Notwendigkeit gibt, es dann auch keinen Body dazu gibt.

with 
Ada.Text_IO,
     Ada.Numerics,
     Ada.Numerics.Elementary_Functions,
     Ada.Strings.Bounded;

use
  Ada.Text_IO,
    Ada.Numerics,
    Ada.Numerics.Elementary_Functions,
    Ada.Strings.Bounded;

procedure p0Packageuebersicht is 
begin
   null;   
end p0Packageuebersicht;

--------------------------------------------------------------
-- ab Ada 2005
-- Einbindung eines [private] deklariertem Pakets ist erlaubt,
-- da Vater-Paket das gleiche ist.
-- Die Nutzung ist nur mit privaten Teil des Pakets erlaubt.
-- Anmerkung: 
-- Auch Pakete mit public-Scope koennen als private eingebunden
-- werden, jedoch auch dann nur im privaten Teil oder Body 
-- nutzbar!
--------------------------------------------------------------
private with Aussen_Pkg.Child;

-- Dieses Paket ist public
package Aussen_Pkg.Child2 is

   -----------------------------------------------------------
   -- Erlaubt den Zugriff auf das private deklarierte Paket
   -- Zugriff nicht im public- Bereich moeglich und nur
   -- auf Daten, die im public-Bereich des privaten Pakets
   -- deklariert sind!
   -----------------------------------------------------------
private
   -- Zugriff auf public-Daten eines privaten Pakets (Scope- private)
   Farbe : Aussen_Pkg.Child.FARBEN_T;

   -- Zugriff auf private-Daten des Vaterpakets (Scope-public-)
   Zahl : INTEGER := Test;

end Aussen_Pkg.Child2;

-----------------------------------------------------------------------------
-- ab Ada 2005
-- private bewirkt, dass ich auf die
-- [private] Daten der Vaterklasse zugreifen kann.
-- Des Weiteren schraenke ich die Nutzung dieses
-- Paketes ein. Es ist nur noch erlaubt in der
-- Hierachie von Aussen_Pkg... dieses Paket einzubinden.
-- Die Einbindung muss dann mit [private with Aussen_Pkg.Child] erfolgen.
-----------------------------------------------------------------------------
-- private -- nicht pruefungsrelevant, private an dieser Stelle!
package Aussen_Pkg.Child is

   -- Zugriff auf Vater-Paket
   Begruessung : STRING_5_TA := Innen_Pkg.Anrede;
   ---------------------------------------------------------------------------
   -- private an dieser Stelle erlaubt auch auf die [private] Daten der
   -- Vaterklasse zuzugreifen. Dies allerdings ohne weitere Einschraenkungen
   -- fuer die weitere Nutzung des Pakets (ohne private package ..) .
   ---------------------------------------------------------------------------


private
   type FARBEN_T is (rot, gelb, gruen);
    Zahl : INTEGER := Test;  -- Zugriff auf private Vaterklassen-Daten

end Aussen_Pkg.Child;

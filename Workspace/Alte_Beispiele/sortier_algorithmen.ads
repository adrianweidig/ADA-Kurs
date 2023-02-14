package Sortier_Algorithmen is

   -- Typen
   type MESSWERTE_T is range 0 .. 1000;
   subtype INDEX_T is POSITIVE;
   type MESSREIHE_TA is array(INDEX_T range <>) of MESSWERTE_T;

   -----------------------------------------------------------------------------
   -- sortieren durch einfuegen
   -- Das erste Element wird als sortiert angenommen
   -- Index wird hochgezaehlt,
   -- fuer 2. Element wird in die bisherige sortierte Reihe (Index-1) die
   -- Einfuegestelle gesucht und die aktuelle Zahl dort einfuegt.
   -- Dazu muessen dann zuerst die anderen sortierten groesseren Elemente eins
   -- nach rechts verschoben werden.
   -- Dieser Vorgang wird bis zum letzten Index der Reihe wiederholt, danach
   -- sind alle Elemente aufsteigend sortiert.
   -----------------------------------------------------------------------------
   procedure InsertSort(Reihe : in out MESSREIHE_TA);

   -----------------------------------------------------------------------------
   -- Es wird immer paarweise verglichen (Index und Index+1), ist Index groesser
   -- als Index +1 dann wird getauscht. Nach dem ersten Durchlauf ist am
   -- letzten Indes der Reihe der groesste Wert. Danach werden wieder alle
   -- Indizes betrachtet, jedoch um ein Element reduziert. Nach dem letzten
   -- Durchlauf liegen alle sortiert aufsteigend in der Reihe vor.
   -----------------------------------------------------------------------------
   procedure BubbleSort(Reihe : in out MESSREIHE_TA);

   -----------------------------------------------------------------------------
   -- Es wird im 1. Durchlauf das erste Element mit allen anderen Elementen
   -- verglichen und das kleinste Element steht dann am 1. Index.
   -- Im 2. Durchlauf wird der Index erhöht, nun wird dieses Element
   -- mit allen weiteren Elemente verglichen und
   -- das kleinste Element wieder dort abgespeichert usw.
   -----------------------------------------------------------------------------
   procedure SelectionSort(Reihe : in out MESSREIHE_TA);

end Sortier_Algorithmen;

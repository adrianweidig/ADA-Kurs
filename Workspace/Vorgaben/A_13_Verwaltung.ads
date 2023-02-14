generic
   type SCHLUESSEL_T is private;
   type INFO_T is limited private;
   with procedure Zuweisung (Nach : out INFO_T; Von : in INFO_T) is <>;
   with function "<=" (L, R : SCHLUESSEL_T) return Boolean is <>;
package A_13_Verwaltung is

   procedure Aufnahme (Schl : in SCHLUESSEL_T; Info : in INFO_T);
   procedure Loesche (Schl : in SCHLUESSEL_T);

   --  die folgende generische Prozedur sucht Datensaetze gemaess Schluessel
   --  und wendet auf alle so ausgewaehlten Datensaetze die Prozedur Aktion
   --  an:
   generic
      with procedure Aktion (Info : in out INFO_T) is <>;
   procedure Fuer_Ausgewaehlte_Elemente (Schl : SCHLUESSEL_T);

private

   type Komponent_TR is record
      Schluessel : SCHLUESSEL_T;
      Info       : INFO_T; -- limitierte Datentyp !!
   end record;

   type Nat_T is new Natural range 0 .. 200_000;

   type Int_Reihe_TA is array (Nat_T range 1 .. NAT_T'Last) of Komponent_TR;
   -- Anzahl der Elemente
   Anzahl_Elemente : Nat_T := NAT_T'First;
   -- ADO
   Speicher : Int_Reihe_TA;

end A_13_Verwaltung;

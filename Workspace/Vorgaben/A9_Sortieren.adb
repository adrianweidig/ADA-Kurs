-- Problemstellung 1:
type ZAHLENREIHE_TA is array (NATURAL range <>) of INTEGER;
Zahlenliste : ZAHLENREIHE_TA (1 .. 10) :=
   (12,
   3,
   45,
   14,
   99,
   8,
   78,
   1,
   48,
   10);

-- Problemstellung 2:
type PERSON_TR is
record
   Name,       -- Name ist Sortierkriterium
   Adresse : String (1 .. 4);
end record;

type PERSONENTABELLE_TA is array (Positive range <>) of PERSON;

Personenliste : PERSONENTABELLE_TA (1 .. 5) :=
   (("Hans", "Weg1"),
   ("Karl", "Str3"),
   ("Hugo", "Hier"),
   ("Lulu", "Dort"),
   ("Lala", "Hmpf"));

-- Problemstellung 3:
type TAG_T is (
   MONTAG,
   DIENSTAG,
   MITTWOCH,
   DONNERSTAG,
   FREITAG,
   SAMSTAG,
   SONNTAG);

type ZEIT_T is digits 4;

type WOCHENUEBERSICHT_TA is array (TAG_T range <>) of ZEIT_T;

Woche : WOCHENUEBERSICHT_TA (MONTAG .. FREITAG) :=
   (1.123,
   5678.0,
   56.78,
   5.789,
   1.001);
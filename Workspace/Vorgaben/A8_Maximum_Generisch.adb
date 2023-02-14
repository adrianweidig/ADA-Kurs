procedure Maximum_Generisch is

   --  Problemstellung 1:
   type VEKTOR_TA is array (INTEGER range <>) of FLOAT;

   V : VEKTOR_TA (1 .. 5) := (8.0, 7.0, 3.0, 6.0, 5.0);

   Groesste_Zahl : FLOAT;     --  soll unter Verwendung der Funktion den
                              --  Maximalwert aus V bekommen

   --  Problemstellung 2:
   type TEMPERATUR_T is digits 5;

   type TAG_T is (
      MONTAG,
      DIENSTAG,
      MITTWOCH,
      DONNERSTAG,
      FREITAG,
      SAMSTAG,
      SONNTAG);

   type TAGESTEMPERATUR_TA is array (TAG_T range <>) of TEMPERATUR_T;

   T : TAGESTEMPERATUR (MONTAG .. FREITAG) :=
     (15.5,
      16.8,
      3.2,
      -5.0,
      -6.0);

   Max_Temperatur : TEMPERATUR_T;  	--  soll unter Verwendung der Funktion den
									--  Maximalwert aus T bekommen

   --  Ihre Aufgabe: generische Maximumfunktion
begin
   null;
   --  Ihre Aufgabe: Nutzung der Maximumfunktion
   --  Ihre Aufgabe: Ausgabe der beiden Maxima
end Maximum_Generisch;

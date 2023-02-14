type TAG_T is (Mon, Die, Mit, Don, Fre, Sam, Son);
type STUNDEN_T is range 0 .. 2000;
type WOCHE_TA is array (TAG_T range <>) of STUNDEN_T;

function Anzahl_Stunden (W : WOCHE_TA) return STUNDEN_T is
   Summe : STUNDEN_T := 0;
begin -- Anzahl_Stunden
   for Tag in W'range loop
      Summe := Summe + W(Tag);
   end loop;
   return Summe;
end Anzahl_Stunden;


type ZEITUNG_TR is record
  Titel   : String (1 .. 10);
  Auflage : Natural;
end record;



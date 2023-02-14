with Ada.Text_IO;


procedure Umbenennung is

   -- Umbenennung von Paketen
   package Text_Paket renames Ada.Text_IO;
   -- Umbenennung von Exceptions
   Daten_Fehler : exception renames Text_Paket.DATA_ERROR;

   -- Typen
   subtype ZAHLEN_UNTER_ZEHN_T is INTEGER range 1 ..10;


   -- Variablen
   Zahl_nicht_ueber_einhundert : INTEGER range 0 .. 100;

   --------------------------------------------------------------------------------------------
   -- Der Typbezeichner: ZAHLEN_UNTER_ZEHN_T bei der Synonymanweisung
   -- muss lediglich den selben B a s i s t y p : INTEGER haben,
   -- Beschraenkungen (0..100) oder die Eigenschaft eine Konstante zu sein !!!
   -- werden n u r  von dem bereits b e s t e h e n d e n  Objekt: zahl_nicht_ueber_einhundert
   -- uebernommen!
   --------------------------------------------------------------------------------------------
   Kleine_Zahl 	: INTEGER 		renames Zahl_Nicht_Ueber_Einhundert;
   Zahl 	: ZAHLEN_UNTER_ZEHN_T 	renames Zahl_Nicht_Ueber_Einhundert;


   -- Unterprogramme
   -- -- Spezifikation
   procedure Ausgabe(Text : in STRING; Zahl : in INTEGER);

   -- body
   procedure Ausgabe(Text : in STRING; Zahl : in INTEGER) is
      -- Konstanten
      Spalte : constant := 32;
      -- Paketauspraegungen
      package I_IO is new Text_Paket.Integer_IO(INTEGER);
   begin
      Ada.Text_IO.Put(Text);
      Ada.Text_IO.Set_Col(Spalte);
      I_IO.Put(Zahl,3);
      Ada.Text_IO.New_Line;
   end Ausgabe;


begin

   Ada.Text_IO.Put_Line("Setze: Zahl_nicht_ueber_einhundert");
   Zahl_nicht_ueber_einhundert := 50;

   Ausgabe("zahl_nicht_ueber_einhundert = ", Zahl_nicht_ueber_einhundert);

   Ada.Text_IO.Put_Line("Setze: Kleine_Zahl");
   -- nicht moeglich Constraint_Error
   -- Kleine_Zahl := 121;
   Kleine_Zahl := 21;

   Ausgabe("Kleine_Zahl = ", Kleine_Zahl);

   Ausgabe("zahl_nicht_ueber_einhundert = ", Zahl_nicht_ueber_einhundert);

   Ausgabe("Zahl = ", zahl);

   Ada.Text_IO.Put_Line("Setze: Zahl");
   Zahl := 30;

   Ausgabe("Zahl = ", zahl);

   Ausgabe("zahl_nicht_ueber_einhundert = ", Zahl_nicht_ueber_einhundert);


end Umbenennung;

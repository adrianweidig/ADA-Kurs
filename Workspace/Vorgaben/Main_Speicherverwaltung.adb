with Ada.Text_IO, Dynamische_Speicherverwaltung;

procedure Main_Speicherverwaltung is

   subtype ELEMENT is Natural;

   Groesse : constant := 20;

   package Char_Paket is new Dynamische_Speicherverwaltung.Element_Paket (
      ELEMENT,
      Groesse);

   Zaehler   : Natural;
   V, V1, V2 : Dynamische_Speicherverwaltung.VERWEIS;
   E         : ELEMENT;

begin -- Ultimo
   Ada.Text_IO.Put_Line(
"   +-------------------------------------------------------------------+");
   Ada.Text_IO.Put_Line(
"   |                                                                   |");
   Ada.Text_IO.Put_Line(
"   |        Ultimativer dynamischer Allesfresser  :-)                  |");
   Ada.Text_IO.Put_Line(
"   |                                                                   |");
   Ada.Text_IO.Put_Line(
"   +-------------------------------------------------------------------+");
   Ada.Text_IO.New_Line;

   begin
      Char_Paket.Freigeben (V1);
      raise Constraint_Error;
   exception
      when Constraint_Error =>
         Ada.Text_IO.Put_Line
           ("Freigeben von nicht angeforderten Speicher: FALSCH" & ASCII.BEL);
      when others =>
         Ada.Text_IO.Put_Line
           ("Freigeben von nicht angeforderten Speicher: OK");
   end;

   begin
      Char_Paket.Wert (V1, 123);
      raise Constraint_Error;
   exception
      when Constraint_Error =>
         Ada.Text_IO.Put_Line
           ("Wertzuweisung an nicht angeforderten Speicher: FALSCH" &
            ASCII.BEL);
      when others =>
         Ada.Text_IO.Put_Line
           ("Wertzuweisung an nicht angeforderten Speicher: OK");
   end;

   begin
      E := Char_Paket.Wert (V1);
      raise Constraint_Error;
   exception
      when Constraint_Error =>
         Ada.Text_IO.Put_Line
           ("Wertlesen von  nicht angeforderten Speicher: FALSCH" &
            ASCII.BEL);
      when others =>
         Ada.Text_IO.Put_Line
           ("Wertlesen von nicht angeforderten Speicher: OK");
   end;

   Char_Paket.Anfordern (V1);
   Char_Paket.Anfordern (V2);

   Zaehler := 3;
   begin
      loop
         Char_Paket.Anfordern (V);
         Char_Paket.Wert (V, Zaehler);

         Zaehler := Zaehler + 1;
         exit when Zaehler > 999;
      end loop;
      raise Constraint_Error;
   exception
      when Constraint_Error =>
         Ada.Text_IO.Put_Line
           ("Nach" &
            Natural'Image (Zaehler) & 
"-maligem Anfordern ist eine Ausnahme aufgetreten: FALSCH (Soll: 20)" &
            ASCII.BEL);
      when others =>
         Ada.Text_IO.Put
           ("Nach" &
            Natural'Image (Zaehler) &
            "-maligem Anfordern ist eine Ausnahme aufgetreten: ");
         if Zaehler /= Groesse + 1 then
            Ada.Text_IO.Put_Line ("FALSCH" & ASCII.BEL);
         else
            Ada.Text_IO.Put_Line ("OK");
         end if;
   end;

   Ada.Text_IO.Put_Line ("200 x Wertzuweisen");
   for i in reverse 1 .. 200 loop
      Char_Paket.Wert (V1, i);
   end loop;

   Char_Paket.Wert (V1, 1);
   Char_Paket.Wert (V2, 2);

   Ada.Text_IO.Put
     ("Test von Freigeben (letztes Element zuerst beruecksichtigen): ");
   Char_Paket.Freigeben (V1);
   Char_Paket.Freigeben (V2);
   Char_Paket.Anfordern (V1);
   Char_Paket.Anfordern (V2);

   if Char_Paket.Wert (V1) /= 2 or Char_Paket.Wert (V2) /= 1 then
      Ada.Text_IO.Put_Line ("FALSCH" & ASCII.BEL);
      Ada.Text_IO.Put_Line
        ("Wert von V1 (richtig 2) " & Natural'Image (Char_Paket.Wert (V1)));
      Ada.Text_IO.Put_Line
        ("Wert von V2 (richtig 1) " & Natural'Image (Char_Paket.Wert (V2)));
   else
      Ada.Text_IO.Put_Line ("OK");
   end if;

   Char_Paket.Freigeben (V1);
   begin
      Char_Paket.Wert (V1, 1000);
      raise Constraint_Error;
   exception
      when Constraint_Error =>
         Ada.Text_IO.Put_Line
           ("Freigeben von angeforderten Speicher: FALSCH" & ASCII.BEL);
      when others =>
         Ada.Text_IO.Put_Line ("Freigeben von angeforderten Speicher: OK");
   end;

end Main_Speicherverwaltung;

-- Inhalte dieser Datei sind erst ab ADA 95 moeglich

with Ada.Text_IO, System.Address_Image;

use Ada.Text_IO;

procedure d4ZusaetzlicherZugriff is

   use type System.Address;

   -- Wir legen einen normalen Integer Pointer an
   type Integer_Ref is access all Integer;

   Integer_Pointer, Normale_Zahl_Pointer : Integer_Ref := new Integer'(0);

   Normale_Zahl    : aliased Integer := 10;


begin
   -- Geht natuerlich nicht, da wir das eine
   -- Mal einen Integer Pointer quasi haben
   -- und das andere Mal einen normalen Integer

   -- Integer_Pointer := Normale_Zahl;

   -- Somit erzeugen wir die Verbindung zwischen unserem
   -- Pointer und der dazugehoerigen Variable
   Normale_Zahl_Pointer := Normale_Zahl'Access;

   -- Dies ist weiterhin moeglich und daher sehr praktisch,
   -- da alle dazugehoerigen Pointer / Referenzen die auf
   -- Normale_Zahl verweisen ebenfalls diese Aenderung
   -- mitbekommen.
   Normale_Zahl         := 30;
   Put_Line("Wert von Normale_Zahl                                : " & Integer'Image(Normale_Zahl));
   Put_Line("Wert von Normale_Zahl_Pointer                        : " & Integer'Image(Normale_Zahl_Pointer.all));

   -- Interessant ist auch, dass dies in die andere
   -- Richtung ebenfalls funktioniert.
   Normale_Zahl_Pointer.all        := 500;
   Put_Line("Wert von Normale_Zahl                                : " & Integer'Image(Normale_Zahl));
   Put_Line("Wert von Normale_Zahl_Pointer                        : " & Integer'Image(Normale_Zahl_Pointer.all));

   Put_Line(Ascii.ESC & "[93m" & "------ Vor der Zuweisung zueinander" & ASCII.ESC & "[0m");

   Put_Line("Wertausgabe:");
   Put_Line("Wert von Integer_Pointer                             : " & Integer'Image(Integer_Pointer.all));
   Put_Line("Wert von Normale_Zahl                                : " & Integer'Image(Normale_Zahl));
   Put_Line("Wert von Normale_Zahl_Pointer                        : " & Integer'Image(Normale_Zahl_Pointer.all));

   Put_Line("Ist Integer_Pointer = Normale_Zahl_Pointer?          : " & Boolean'Image(Integer_Pointer = Normale_Zahl_Pointer));
   Put_Line("Ist Integer_Pointer = Normale_Zahl'Access?           : " & Boolean'Image(Integer_Pointer = Normale_Zahl'Access));
   Put_Line("Sind die Adress-Werte gleich?                        : " & Boolean'Image(Integer_Pointer'Address = Normale_Zahl_Pointer'Address));

   New_Line;

   Put_Line("Adresse von Integer_Pointer                          : " & System.Address_Image(Integer_Pointer'Address));

   Put_Line("Adresse von Normale_Zahl bzw. Normale_Zahl_Pointer   : " & System.Address_Image(Normale_Zahl_Pointer'Address));

   New_Line;

   Integer_Pointer := Normale_Zahl_Pointer;

   Integer_Pointer := Normale_Zahl'Access;

   Put_Line(Ascii.ESC & "[93m" & "------ Nach der Zuweisung zueinander" & ASCII.ESC & "[0m");

   Put_Line("Wertausgabe:");

   -- Interessant, da man eigentlich davon ausgeht, dass die Adresse des Integer_Pointers nun
   -- auch der der Normalen Zahl entspricht.
   Put_Line("Wert von Integer_Pointer                             : " & Integer'Image(Integer_Pointer.all));
   Put_Line("Wert von Normale_Zahl                                : " & Integer'Image(Normale_Zahl));
   Put_Line("Wert von Normale_Zahl_Pointer                        : " & Integer'Image(Normale_Zahl_Pointer.all));

   Put_Line("Ist Integer_Pointer = Normale_Zahl_Pointer?          : " & Boolean'Image(Integer_Pointer = Normale_Zahl_Pointer));
   Put_Line("Ist Integer_Pointer = Normale_Zahl'Access?           : " & Boolean'Image(Integer_Pointer = Normale_Zahl'Access));
   Put_Line("Sind die Adress-Werte gleich?                        : " & Boolean'Image(Integer_Pointer'Address = Normale_Zahl_Pointer'Address));

   New_Line;

   Put_Line("Adresse von Integer_Pointer                          : " & System.Address_Image(Integer_Pointer'Address));

   Put_Line("Adresse von Normale_Zahl bzw. Normale_Zahl_Pointer   : " & System.Address_Image(Normale_Zahl_Pointer'Address));


end d4ZusaetzlicherZugriff;

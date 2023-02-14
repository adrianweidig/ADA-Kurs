with O7Konstruktor, Ada.Strings.Unbounded, Ada.Text_IO;

use O7Konstruktor, Ada.Strings.Unbounded, Ada.Text_IO;

procedure O7MainKonstruktor is

   -- Hier sieht man sehr schoen,
   -- dass der Konstruktor und
   -- Destruktor aufgerufen werden
   -- ohne diese explizit aufzurufen.
   -- Die Reihenfolge ist ebenfalls
   -- ersichtlich :
   -- 1. Konstruktor
   -- 2. Destruktor
   -- Wird dem Objekt neuer Speicher zugewiesen oder
   -- aus diesem entfernt so wird finalisiert aufgerufen.
   -- (Finalisieren ruft sich beim  erzwungenen
   -- Deallokieren nicht selbst auf)
   Amsel : Tier := O7Konstruktor.Tier_Erzeugen( Art_Des_Tieres => "Amsel");

begin

   Put_Line("Typ-Bezeichnung: " & To_String(Amsel.Tierart));

   --   Ausgabe (Beispiel):
   --  - Neues Objekt (000000000251FC10) initialisiert --> Neues Objekt wird in Tier_Erzeugen erzeugt
   --  --- Name zugewiesen                             --> Put_Line nach der Zuweisung des Namens
   --  - Objekt (000000000045A0A0) kopiert             --> return statement (Neues_Tier wird in das return Statement kopiert)
   --  -- Objekt (000000000251FC10) finalisiert        --> return statement (Neues_Tier wird finalisiert [Hier koennte man deallokieren])
   --  - Objekt (000000000251FD50) kopiert             --> Zwischenspeicher von return statement wird in Amsel kopiert
   --  -- Objekt (000000000045A0A0) finalisiert        --> Zwischenspeicher von return wird finalisiert [Hier koennte man deallokieren])
   --  Typ-Bezeichnung: Amsel                          --> Ausgabe von Put_Line in Zeile 19
   --  -- Objekt (000000000251FD50) finalisiert        --> Ende des Programmes. Da nur noch Amsel vorhanden ist und noch nicht
   --                                                      finalisiert ist wird spaetestens jetzt dieses finalisiert. [Hier findet in
   --                                                      der Regel das Deallokieren der Laufzeitelemente durch die Entwicklungs-
   --                                                      umgebung selbst statt]

end O7MainKonstruktor;

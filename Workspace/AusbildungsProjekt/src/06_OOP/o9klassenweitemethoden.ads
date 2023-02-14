package O9KlassenweiteMethoden is
   --- Standard-Klassen
   type Lebewesen is tagged null record;
   procedure Bewegen(Ein_Lebewesen : in out Lebewesen);

   type Fisch is new Lebewesen with null record;
   procedure Bewegen(Ein_Fisch : in out Fisch);
   
   type Vogel is new Lebewesen with null record;
   procedure Bewegen(Ein_Vogel : in out Vogel);
   
   -- KLASSENWEITER ZEIGER
   -- Dieser Zeiger ermoeglichet es auf ALLE Zeiger
   -- der Unterklassen zu zeigen.
   type Lebewesen_Pointer is access all Lebewesen'Class;
   
   procedure add(Ein_Lebewesen : Lebewesen_Pointer);
   
   procedure FliehtIhrNarren;
   
private
   --- REFERENZEN
   type Zoo_Element;
   
   type Zoo_Pointer is access Zoo_Element;
   
   type Zoo_Element is record
      Vorgaenger : Zoo_Pointer;
      Tier       : Lebewesen_Pointer;
      Nachfolger : Zoo_Pointer;
   end record;

   Start, AktuellesElement : Zoo_Pointer;

end O9KlassenweiteMethoden;

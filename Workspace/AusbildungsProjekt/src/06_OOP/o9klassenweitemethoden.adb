with Ada.Text_IO;

use Ada.Text_IO;
package body O9KlassenweiteMethoden is

   -------------
   -- Bewegen --
   -------------
   procedure Bewegen (Ein_Lebewesen : in out Lebewesen) is
   begin
      Put_Line("Ich bewege mich irgendwie!");
   end Bewegen;

   -------------
   -- Bewegen --
   -------------
   procedure Bewegen (Ein_Fisch : in out Fisch) is
   begin
      Put_Line("Ich schwimme!");
   end Bewegen;

   -------------
   -- Bewegen --
   -------------
   procedure Bewegen (Ein_Vogel : in out Vogel) is
   begin
      Put_Line("Ich fliege!");
   end Bewegen;

   ---------
   -- add --
   ---------
   procedure add (Ein_Lebewesen : Lebewesen_Pointer) is
   begin
      if Start = null then
         Start := new Zoo_Element'(Vorgaenger => null,
                                   Tier       => Ein_Lebewesen,
                                   Nachfolger => null);
         AktuellesElement := Start;
      elsif AktuellesElement.Nachfolger = null then
         AktuellesElement.Nachfolger := new Zoo_Element'(Vorgaenger => AktuellesElement,
                                                         Tier       => Ein_Lebewesen,
                                                         Nachfolger => null);
         AktuellesElement := AktuellesElement.Nachfolger;
      end if;

   end add;

   -------------------------
   -- Bewegen mit Classes --
   -------------------------
   procedure Bewegen (Ein_Lebewesen : in out Lebewesen'Class) is
   begin
      Ein_Lebewesen.Bewegen;
   end Bewegen;

   ---------------------
   -- FliehtIhrNarren --> Dispatching Call
   -- Denn es werden immer die richtig
   -- zugehoerigen Bewegen Methoden aufgerufen.
   ---------------------
   procedure FliehtIhrNarren is
      tmpElement : Zoo_Pointer := Start;
   begin
      while tmpElement /= null loop
         tmpElement.Tier.Bewegen;
         tmpElement := tmpElement.Nachfolger;
      end loop;
   end FliehtIhrNarren;

end O9KlassenweiteMethoden;

with Ada.Text_IO, System.Address_Image;

use Ada.Text_IO;

package body O7Konstruktor is
   ----------------
   -- Initialize --
   ----------------
   overriding procedure Initialize (this : in out Tier) is
   begin

      Put_Line("- Neues Objekt (" & System.Address_Image(A => this'Address) & ") initialisiert");

   end Initialize;

   --------------
   -- Finalize --
   --------------
   overriding procedure Finalize ( this : in out Tier ) is
   begin

      Put_Line("-- Objekt (" & System.Address_Image(A => this'Address) & ") finalisiert");

   end Finalize;

   ------------
   -- Adjust --
   ------------
   overriding procedure Adjust (this : in out Tier) is
   begin

      Put_Line("- Objekt (" & System.Address_Image(A => this'Address) & ") kopiert");

   end Adjust;

   -------------------
   -- Tier_Erzeugen --
   -------------------
   function Tier_Erzeugen ( Art_Des_Tieres : String) return Tier is

      Neues_Tier : Tier;

   begin

      Neues_Tier.Tierart := To_Unbounded_String(Art_Des_Tieres);
      Put_Line("--- Name zugewiesen");
      return Neues_Tier;

   end Tier_Erzeugen;

end O7Konstruktor;

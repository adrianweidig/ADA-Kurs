with Glib;                     use Glib;
with Glib.Error;               use Glib.Error;
with Glib.Object;              use Glib.Object;

with Gtkada.Style;             use Gtkada.Style;
with Gtkada.Canvas_View;       use Gtkada.Canvas_View;
with Gtkada.Canvas_View.Views; use Gtkada.Canvas_View.Views;

with Gdk.Pixbuf;               use Gdk.Pixbuf;
with Gdk.Types;                use Gdk.Types;

with Gtk.Widget;               use Gtk.Widget;

package Schachfelder is
   -----------------------
   ----- Schachfigur -----
   -----------------------

   -- Koenig, Dame, Turm, Laeufer, Springer, Bauer
   type Art is (K, D, T, L, S, B);
   
   -- Schwarz, Weiss
   type Farbe    is (S, W);

   type Schachfigur_Record is new Image_Item_Record with record
      Figurfarbe : Farbe;
      Figurart   : Art;
      
      -- Mittelpunkt = "Objekt".Link_Anchor_Point
   end record;
   
   type Schachfigur is access all Schachfigur_Record'Class;
   -----------------------
   ----- Schachfeld ------
   -----------------------
   
   type Schachfeld_Record is new Rect_Item_Record with record
      Nutzbar     : Boolean := False; 
      Figur       : Schachfigur;
      Feldfarbe   : Farbe;
      -- Mittelpunkt = "Objekt".Link_Anchor_Point
   end record;
 
   type Schachfeld is access all Schachfeld_Record'Class;

   -----------------------
   ----- Schachbrett -----
   -----------------------
 
   -- Model Liste fuer Canvas View
   Canvas_Modelle : List_Canvas_Model;
   
   -- 8x8 Schachbrett mit "Schachfeldern"
   type Felder is array (Positive range 1 .. 8, Positive range 1 .. 8) of Schachfeld;
   
   type Schachbrett_Record is new Canvas_View_Record with record
      -- Standardmaessig auf False
      -- Ladbar wird durch die Save Funktion
      -- festgelegt. Somit kann die InitSchachbrett
      -- auch vom Laden spaeter aufgerufen werden.
      -- Wird dort festgestellt, dass das Schachbrett
      -- "Ladbar" ist werden alle InitialWerte
      -- der Felder, Figuren etc. nicht festgelegt,
      -- sondern die des geladenen Schachbretts
      -- uebernommen.
      Ladbar       : Boolean := False;
      Schachfelder : Felder;
      
   end record;
   
   type Schachbrett is access all Schachbrett_Record'Class;

   --------------------------------------
   ----- Initialisieren des Brettes -----
   -------------------------------------- 
   
   -- Initialisiert das Schachbrett indem das Felder Array
   -- initialisiert wird und ruft dort die Initialisierung
   -- der einzelnen Felder auf. Bis es letztendlich das
   -- fertige Schachbrett angezeigt wird.
   procedure Init_Schachbrett (Brett : in out Schachbrett); 

   
   -----------------
   ----- Tests -----
   -----------------
   procedure Tests(Brett : Schachbrett);

end Schachfelder;

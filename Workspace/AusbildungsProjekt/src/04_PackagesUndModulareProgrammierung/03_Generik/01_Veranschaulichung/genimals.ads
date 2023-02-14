with Ada.Text_IO, mcc.Sounds;

use Ada.Text_IO, mcc.Sounds;

generic
   
   -- Jedes Tier bruellt auf andere Art und Weise
   with procedure Tierbruellen;

package Genimals is
  
   -- Koennte auch private sein um dem
   -- Nutzer nicht zu ermoeglichen ein Objekt
   -- hiervon abzuleiten. Der Einfachheit
   -- halber lassen wir dies weg.
   type Tierart is (Loewe, Baer);
   
   -- Hier fuehren wir das Bruellen aus.
   -- Jedoch muessen wir spaetestens hier
   -- wissen welches Tier es denn ueberhaupt
   -- ist. Um die Moeglichkeiten der Tierwahl
   -- einzuschraenken nutzen wir einen eigens
   -- definierten Typ. Somit hat die Variable
   -- Tier die Einschraenkungen von Tierart.
   -- Der Nutzer muss also nur uebergeben
   -- welches Tier er haben moechte.
   generic 
      Tier : Tierart;
   procedure Bruellen;

end Genimals;

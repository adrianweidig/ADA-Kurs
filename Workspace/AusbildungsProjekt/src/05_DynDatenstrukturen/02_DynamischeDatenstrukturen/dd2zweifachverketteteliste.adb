with Ada.Text_IO, Ada.Unchecked_Deallocation, Ada.Strings.Unbounded;

use Ada.Text_IO, Ada.Strings.Unbounded;

package body dd2ZweifachverketteteListe is
   procedure GenDeallocation is new Ada.Unchecked_Deallocation(Object => ZweifachListe,
                                                               Name   => Element_REF);

   --------------------------------
   -- Eigene Body-Unterprogramme --
   --------------------------------
   function find(Index : Integer) return Element_REF is

      tmpZeiger : Element_REF := Start;

   begin
      while tmpZeiger.Index /= Index loop

         tmpZeiger := tmpZeiger.Nachfolger;

      end loop;

      return tmpZeiger;

   end find;

   function find(Element : T) return Element_REF is

      tmpZeiger : Element_REF := Start;

   begin
      -- Hier muessen wir beruecksichtigen, falls wir
      -- ein Element suchen, dass es garnicht gibt.
      -- Sind wir am letzten Nachfolger (= null)
      -- angekommen, wissen wir, dass wir kein
      -- Element gefunden haben und geben zur
      -- Weiterverarbeitung dieses null zurueck.

      -- ACHTUNG:
      -- and then sorgt dafuer, dass es sofort abbricht
      -- sobald tmpZeiger = null
      while tmpZeiger /= null and then tmpZeiger.Inhalt /= Element loop
         -- Finden wir das Element nicht wird tmpZeiger
         -- am Ende der Liste null sein und bricht die
         -- Schleife somit ab.
         tmpZeiger := tmpZeiger.Nachfolger;

      end loop;

      return tmpZeiger;

   end find;

   procedure indexing is

      tmpZeiger : Element_REF := Start;

   begin

      -- tmpZeiger ware auch moeglich aber
      -- zur Veranschaulichung nutzen wir Start
      if tmpZeiger /= null then
         Start.Index := 0;

         -- Am Ende der Schleife bleibt er an der letzten
         -- Stelle stehen.
         while tmpZeiger.Nachfolger /= null loop
            tmpZeiger := tmpZeiger.Nachfolger;
            tmpZeiger.Index := tmpZeiger.Vorgaenger.Index+1;

         end loop;

         -- Fuer das letzte Element
         if tmpZeiger.Vorgaenger /= null then
            tmpZeiger.Index := tmpZeiger.Vorgaenger.Index+1;
         end if;
      end if;


   end indexing;

   ----------------------
   -- Nutzerfunktionen --
   ----------------------

   --------------
   -- getFirst --
   --------------
   function getFirst return T is
   begin
      return Start.Inhalt;
   end getFirst;

   -------------
   -- getLast --
   -------------
   function getLast return T is
   begin
      return AktuellesElement.Inhalt;
   end getLast;

   -------------
   -- getSize --
   -------------
   function getSize return Integer is
   begin
      -- Da man klassisch den Index
      -- bei 0 beginnt zu setzen.
      return AktuellesElement.Index+1;
   end getSize;

   ------------
   -- getPos --
   ------------
   function getPos(Inhalt : T) return Integer is

      tmpZeiger : Element_REF := find(Inhalt);

   begin

      return tmpZeiger.Index;

   end getPos;

   ---------
   -- get --
   ---------
   function get(Index : Integer) return T is

      tmpZeiger : Element_REF := find(Index);

   begin

      return tmpZeiger.Inhalt;

   end get;

   ----------------------
   -- Nutzerprozeduren --
   ----------------------
   ---------
   -- add --
   ---------
   -- 1. add
   -- Start (0, Ele, null null)
   -- Start.Nachfolger (1, Ele, Start, null)

   -- 2. add
   -- AktuellesElement (1, Ele, Start(AktuellesElement), null)
   -- AktuellesElement.Nachfolger (2, Ele, AktuellesElement, null)

   -- 3. add
   -- AktuellesElement (2, Ele, AktuellesElement, null)
   -- AktuellesElement.Nachfolger ( 3, Ele, AktuellesElement, null)
   procedure add (Element : T) is
   begin
      -- Wenn unsere Liste noch nicht initialisiert ist
      if Start = null then
         Start := new ZweifachListe'(Index      => 0,
                                     Inhalt     => Element,
                                     Vorgaenger => null,
                                     Nachfolger => null);
         AktuellesElement := Start;

         -- Ansonsten wird immer der Nachfolger erzeugt und
         -- unser Zeiger auf eben diesen danach gelegt.
      elsif AktuellesElement.Nachfolger = null then
         AktuellesElement.Nachfolger := new ZweifachListe'(Index      => AktuellesElement.Index+1,
                                                           Inhalt     => Element,
                                                           Vorgaenger => AktuellesElement,
                                                           Nachfolger => null);
         -- Setzt den Zeiger auf unseren Nachfolger den wir
         -- gerade erstellt haben.
         AktuellesElement := AktuellesElement.Nachfolger;

      end if;

   end add;

   ------------
   -- remove --
   ------------
   procedure remove (Index : Integer) is

      tmpElement : Element_REF;

   begin
      -- Verschiedene Removefaelle:
      -- 1. Das letzte Element wird geloescht
      -- 2. Das erste Element wird geloescht
      -- 3. Versuch ein Element ausserhalb der Liste zu loeschen
      -- 4. Element in der Liste loeschen

      -- 3. Fall
      if Index > AktuellesElement.Index then
         Put_Line("Stelle" & Index'Image & " ist nicht in der Liste enthalten.");

         -- 2. Fall
      elsif Index = Start.Index then

         -- Wenn wir nur ein Element haben
         if Start.Nachfolger = null then
            GenDeallocation(Start);
            Start := null;
         else
            -- Start verschieben und den
            -- Vorgaenger eliminieren.
            Start := Start.Nachfolger;
            GenDeallocation(Start.Vorgaenger);
            Start.Vorgaenger := null;

         end if;

         indexing;
         -- 1. Fall
      elsif Index = AktuellesElement.Index then
         Put_Line("Letztes Element");
         -- Zeiger auf das vorletzte Element setzen
         tmpElement := AktuellesElement.Vorgaenger;

         -- Letztes Element (Nachfolger des vorletzten Elementes)
         -- Deallokieren
         GenDeallocation(AktuellesElement);

         -- Und den neuen Nachfollger null setzen und somit
         -- komplett aus unserer Liste eliminieren
         tmpElement.Nachfolger := null;

         -- Aktuelles Element eins zurueckstellen
         AktuellesElement := tmpElement;

         indexing;

         -- 4. Fall
      else
         tmpElement := find(Index);

         -- Nachfolger des Vorgaengers auf den eigentlichen
         -- Nachfolger setzen um sich selbst aus der Liste zu nehmen.
         tmpElement.Vorgaenger.Nachfolger := tmpElement.Nachfolger;

         -- Vorgaenger des vorherigen Nachfolgers aendern
         tmpElement.Nachfolger.Vorgaenger := tmpElement.Vorgaenger;

         -- Speicher freigeben
         GenDeallocation(tmpElement);

         indexing;
      end if;



   end remove;

   ------------
   -- remove --
   ------------
   procedure remove(Inhalt : T) is

      tmpElement : Element_REF := find(Inhalt);

   begin
      -- Find gibt null zurueck wenn wir den Inhalt
      -- nicht finden konnten. Ansonsten erhalten wir
      -- das Element zurueck, dass als erstes dem
      -- Inhalt entspricht.
      if tmpElement = null then
         Put_Line("Element" & Inhalt'Image & " nicht in der Liste enthalten");
      else
         remove(tmpElement.Index);
      end if;

   end remove;

   -----------
   -- print --
   -----------
   procedure print is

      tmpString : Unbounded_String := To_Unbounded_String("Liste: ");
      tmpString2: Unbounded_String := To_Unbounded_String("Index: ");
      tmpZeiger : Element_REF := Start;

   begin

      if Start = null then
         Put_Line("Die Liste ist leer.");
      else

         while tmpZeiger /= null loop
            Append(Source   => tmpString,
                   New_Item => "[" & tmpZeiger.Inhalt'Image & " ]");

            Append(Source   => tmpString2,
                   New_Item => "[" & tmpZeiger.Index'Image & " ]");

            tmpZeiger := tmpZeiger.Nachfolger;
         end loop;

         Put_Line(To_String(tmpString));
         Put_Line(To_String(tmpString2));

         New_Line;
      end if;
   end print;




end dd2ZweifachverketteteListe;


with Ada.Finalization;

with Ada.Strings.Unbounded;

package PferdePackage is
   -- Pferderennen ADT
   type Pferderennen is private;
   
   -- Gibt alle Pferde nacheinander aus mit deren aktuellen
   -- Werten
   procedure Rennen_Ausgeben        (Das_Rennen : in Pferderennen);
    
   -- Laesst die Pferde weiterlaufen
   procedure Rennen_Starten         (Das_Rennen : in out Pferderennen);
   
   -- Setzt alle Pferde an den Start
   procedure Rennen_Neustarten      (Das_Rennen : in out  Pferderennen);
   
   -- Speichert das angegebene Rennen
   procedure Rennen_Speichern       (Das_Rennen : in Pferderennen);
   
   -- Läd das angegebene Rennen ueber den absoluten Pfad
   function Rennen_Laden            (Pfad : String) return Pferderennen;
   
   -- Loescht ein Rennen am angegebenen Pfad
   procedure Rennen_Pfad_Loeschen   (Pfad : String);
    
private
   -- Da Pferde maximal eine Geschwindigkeit von ca. 90 schaffen
   subtype Geschwindigkeit is Integer range 1 .. 90;
   
   -- Das Pferd selbst.
   -- Nummer, Geschwindigkeit und Position wird beim Erzeugen
   -- des Rennens festgelegt, da die Stellen 1..10 des unten
   -- stehenden Pferderennens mit "Standardpferden" initialisiert
   -- wird. (Gem. Konstruktor)
   type Pferd is new Ada.Finalization.Controlled with Record
      Nummer              : Integer;
      Renngeschwindigkeit : Geschwindigkeit;
      Position            : Integer;
   end record;
   
   -- Pferdkonstruktor
   overriding procedure Initialize(this : in out Pferd);
   
   -- Das Rennen in dem sich die Pferde befinden.
   -- Hier koennen Pferde hinzugefuegt werden.
   type Rennen is array (1 .. 10) of Pferd;  
   
   -- Pferderennen selbst mit eigener Bezeichnung zur Speicherung
   type Pferderennen is new Ada.Finalization.Controlled with Record
      Rennen_Bezeichnung    : Ada.Strings.Unbounded.Unbounded_String;
      Echtes_Rennen         : Rennen;
   end record;
   
   -- Rennenkonstruktor
   overriding procedure Initialize(this : in out Pferderennen);
   
   -- Um bei mehreren Arrays die Nummerierung zu gewaehrleisten
   Pferde_Counter : Integer := 1;

end PferdePackage;

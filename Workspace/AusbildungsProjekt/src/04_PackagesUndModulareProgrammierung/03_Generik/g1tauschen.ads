
package g1tauschen is

   -- Moeglichkeiten:
   -- Typformate
   --  Bestimmter Typ          | type T is private;
   --  Unbestimmter Typ        | type T is (<>);
   --  Fliesskommatyp          | type T is digits <>;
   
   -- Durch Einklappen zeigen was zusammengehoert.
   -- Moechte ich mehrere generische Prozeduren, Funktionen
   -- etc. muss ich nochmals generic schreiben und es fuer
   -- diese Prozedur spezialisieren.
   generic 
      -- Man beachte, dass der Typ dem Paket selbst die Informationen
      -- verbergt. Das heisst, dass der Nutzer diese Informationen
      -- festlegt und hier genutzt werden. Der Paketersteller muss 
      -- quasi ohne diese Informationen arbeiten.
      type Generischer_Typ is private;
      
   procedure Tauschen(A, B : in out Generischer_Typ);
   
   generic 
      
      type Gen_Disk_Type is (<>);
      
   procedure Gen_Ausgabe(A : in Gen_Disk_Type);
   
   generic 
      
      type Gen_Float_Type is digits <>;
      
   procedure Float_Ausgabe(A : Gen_Float_Type);
   
   

end g1tauschen;

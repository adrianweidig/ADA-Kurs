-- Als Main wird auch gerne die Datei benannt, welche die
-- hauptsaechlich auszufuehrende Datei ist.

-- Dies laesst den Zugriff auf das entsprechende Package zu
with Ada.Text_IO, Ada.Integer_Text_IO, p7UseType; 

use Ada.Text_IO, Ada.Integer_Text_IO; 

procedure p7MainUseType is
   
   -- Variablen
   A : p7UseType.EineZahl;
   B : p7UseType.EineZahl;
   
   use type p7UseType.EineZahl;
 
begin
   
   -- Das ist nicht moeglich, da wir hier nicht die
   -- Informationen als Package Nutzer haben um ein 
   -- Casting zu ermoeglichen. (Wir wissen nicht, dass
   -- es sich um ein Integer handelt)
   --  A := p7UseType.EineZahl(50);
   --  B := p7UseType.EineZahl(80);
   
   p7UseType.setEineZahl(Eingabe => 50,
                         Zahl    => A);
   
   p7UseType.setEineZahl(Eingabe => 80,
                         Zahl    => B);
   
   
   -- Schreibweise bei der reinen Verwendung von with
   Ada.Text_IO.Put_Line( p7UseType."+"( A , B ) );
   
   -- oder
   Ada.Text_IO.Put_Line(A + B); 

   
end p7MainUseType;

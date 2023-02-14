-- ADB:
-- Hier wird definiert : "Was tut das was wir in der zugehoerigen
-- .ads Datei deklariert haben?"

-- Wie das ganze entsteht ist egal. Hier sind procedures, functions
-- etc. alles zulaessig. Es ist jedoch alles LOKAL beschraenkt und
-- nur hier in diesem body nutzbar.
package body p2Rechnen is

   function "+" (A, B : in Integer) return String is 
   begin
      return Integer'Image(A) & " ," & Integer'Image(B);
   end "+";

end p2Rechnen;

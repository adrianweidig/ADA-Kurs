-- Setter und Getter Methode
package p4singleton is
   
   type Singleton is limited private; -- ADT

   procedure Set_Zahl (Zahl : Integer);
   
   function Get_Zahl return Integer;
   
private
   
   type Singleton is record 
      Inhalt : Integer := 0;
   end record;
   
   EinzigeInstanz : Singleton; -- ADO  

end p4singleton;

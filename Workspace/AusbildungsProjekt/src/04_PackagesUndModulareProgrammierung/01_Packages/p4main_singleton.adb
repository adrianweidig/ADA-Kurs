with Ada.Text_IO, p4singleton; 

use Ada.Text_IO;

procedure p4main_singleton is
   
   testSingleton1 : p4singleton.Singleton;
   
   testSingleton2 : p4singleton.Singleton;

   
begin
   
   Put_Line(Integer'Image(p4singleton.Get_Zahl));
   
   Put_Line(Integer'Image(p4singleton.Get_Zahl));
   
   p4singleton.Set_Zahl(33);
   
   Put_Line(Integer'Image(p4singleton.Get_Zahl));
   
end p4main_singleton;

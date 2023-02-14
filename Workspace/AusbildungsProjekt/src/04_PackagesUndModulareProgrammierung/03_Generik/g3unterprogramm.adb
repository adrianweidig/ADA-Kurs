with Ada.Text_IO;

package body g3unterprogramm is
   procedure Zuweisen is
   begin
      Ada.Text_IO.Put_Line("Wert der Nutzvariable: " & To_String(Welcher_Wert_Soll_Genutzt_Werden));
      Ada.Text_IO.Put_Line("Wert der Speichervariable: " & To_String(Wo_Wird_Dieser_Reingespeichert));
      
      Wo_Wird_Dieser_Reingespeichert := Welcher_Wert_Soll_Genutzt_Werden;
      
      Ada.Text_IO.Put_Line("Wert der Nutzvariable: " & To_String(Welcher_Wert_Soll_Genutzt_Werden));
      Ada.Text_IO.Put_Line("Wert der Speichervariable: " & To_String(Wo_Wird_Dieser_Reingespeichert));
   end Zuweisen;
   
  
end g3unterprogramm;

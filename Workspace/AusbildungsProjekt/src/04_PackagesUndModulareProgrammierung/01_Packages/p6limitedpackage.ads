package P6LimitedPackage is
   type Stack is private;

   procedure Reinlegen(EinStack : out Stack; Inhalt : Stack);
   procedure Auslesen (EinStack : in Stack);



private

   type Stack is  record
      Inhalt : Integer;
   end record;
end P6LimitedPackage;

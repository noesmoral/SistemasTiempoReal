with Ada.Text_Io, Colas;
use Ada.Text_Io, Colas;
procedure Principal is
   package Integer_Es is new Ada.Text_Io.Integer_Io (Integer);
   use Integer_Es;
   C1, C2, C3: Cola;
   E: Integer;
begin
   for I in 1..30 loop
      Poner (I, C1);
   end loop;
   for I in 1..10 loop
         Quitar (E, C1);
   end loop;
   for I in 1..10 loop
      Poner (I, C1);
   end loop;
   for I in 1..30 loop
      Poner (I, C2);
   end loop;
   for I in 1..10 loop
         Quitar (E, C2);
   end loop;
   for I in 1..10 loop
      Poner (I, C2);
   end loop;
   for I in 1..30 loop
      Poner (I, C3);
   end loop;
   for I in 1..10 loop
         Quitar (E, C3);
   end loop;
   for I in 1..9 loop
      Poner (I, C3);
   end loop;
   Poner (0, C3);
   if C1 = C2 then
      Put_Line ("Las colas C1 y C2 son iguales");
   else
      Put_Line ("Error. C1 y C2 no son iguales");
   end if;
   if C1 /= C3 then
      Put_Line ("Las colas C1 y C3 no son iguales");
   else
      Put_Line ("Error. C1 y C3 no son iguales");
   end if;
end Principal;
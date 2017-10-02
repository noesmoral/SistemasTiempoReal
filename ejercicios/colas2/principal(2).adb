with Ada.Text_Io, Colas;
use Ada.Text_Io; -- "Ada.Text_Io" es un paquete concreto
                 -- "Colas" es un paquete genérico
procedure Principal is
   package Colas_de_Integer is new Colas (Elementos =>Integer,
                                             Tamaño => 64);
   use Colas_de_Integer;
   package Integer_Es is new Integer_Io (Integer);
   use Integer_Es;

   la_Cola: Cola;
   el_Elemento: Integer;
begin
   for I in 1..10 loop
      if not Está_Llena (la_Cola) then
         Poner (I, la_Cola);
      end if;
   end loop;

   while not Está_Vacía (la_Cola) loop
      Quitar (el_Elemento, la_Cola);
      Put (el_Elemento);
      New_Line;
   end loop;
end Principal;
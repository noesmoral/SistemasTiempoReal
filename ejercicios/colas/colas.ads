package Colas is
   -- Definici�n de la estructura de la cola
   Tama�o: constant Natural := 32;
   subtype �ndice is Natural range 0..Tama�o-1;
   type array_Elementos is array (�ndice) of Integer;
   subtype Contadores is Natural range 0..Tama�o;
   type Cola is record
      Primero: �ndice := �ndice'First;
      �ltimo: �ndice := �ndice'First;
      N�mero_de_Elementos: Contadores := 0;
      Elementos: array_Elementos;
   end record;

   -- Definici�n de las operaciones de la cola
   procedure Poner (el_Elemento: Integer;
                     en_la_Cola: in out Cola);
   procedure Quitar (un_Elemento: out Integer;
                      de_la_Cola: in out Cola);
   function Est�_Vac�a (la_Cola: Cola) return Boolean;
   function Est�_Llena (la_Cola: Cola) return Boolean;
end Colas;
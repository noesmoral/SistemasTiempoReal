package Colas is
   -- Declaraci�n del tipo "Cola"
   type Cola is limited private;
   -- Operaciones
   procedure Poner (el_Elemento: Integer;
                     en_la_Cola: in out Cola);
   procedure Quitar (un_Elemento: out Integer;
                      de_la_Cola: in out Cola);
   function Est�_Vac�a (la_Cola: Cola) return Boolean;
   function Est�_Llena (la_Cola: Cola) return Boolean;
   -- Las operaciones siguientes son necesarias porque el
   -- tipo "Cola" es limitado.
   -- Operaci�n para copiar colas
   procedure Copiar (Origen: Cola; Destino: in out Cola);
   -- Sobrecarga del operador de comparaci�n.
   -- El operador "/=" queda autom�ticamente sobrecargado
   function "="(la_Cola, con_la_Cola: Cola) return Boolean;
private
   -- Definici�n de la estructura de la cola
   -- Esta parte no cambia con respecto a la versi�n anterior
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
end Colas;
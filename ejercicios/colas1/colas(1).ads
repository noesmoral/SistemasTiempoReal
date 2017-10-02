package Colas is
   -- Declaración del tipo "Cola"
   type Cola is limited private;
   -- Operaciones
   procedure Poner (el_Elemento: Integer;
                     en_la_Cola: in out Cola);
   procedure Quitar (un_Elemento: out Integer;
                      de_la_Cola: in out Cola);
   function Está_Vacía (la_Cola: Cola) return Boolean;
   function Está_Llena (la_Cola: Cola) return Boolean;
   -- Las operaciones siguientes son necesarias porque el
   -- tipo "Cola" es limitado.
   -- Operación para copiar colas
   procedure Copiar (Origen: Cola; Destino: in out Cola);
   -- Sobrecarga del operador de comparación.
   -- El operador "/=" queda automáticamente sobrecargado
   function "="(la_Cola, con_la_Cola: Cola) return Boolean;
private
   -- Definición de la estructura de la cola
   -- Esta parte no cambia con respecto a la versión anterior
   Tamaño: constant Natural := 32;
   subtype Índice is Natural range 0..Tamaño-1;
   type array_Elementos is array (Índice) of Integer;
   subtype Contadores is Natural range 0..Tamaño;
   type Cola is record
      Primero: Índice := Índice'First;
      Último: Índice := Índice'First;
      Número_de_Elementos: Contadores := 0;
      Elementos: array_Elementos;
   end record;
end Colas;
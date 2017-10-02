generic
   type Elementos is private;
   Tamaño: Natural := 32; -- Tamaño por omisión
package Colas is
   -- Declaración del tipo "Cola"
   type Cola is limited private;
   -- Operaciones
   procedure Poner (el_Elemento: Elementos;
                     en_la_Cola: in out Cola);
   procedure Quitar (un_Elemento: out Elementos;
                      de_la_Cola: in out Cola);
   function Está_Vacía (la_Cola: Cola) return Boolean;
   function Está_Llena (la_Cola: Cola) return Boolean;
   procedure Copiar (Origen: Cola; Destino: in out Cola);
   function "="(la_Cola, con_la_Cola: Cola) return Boolean;
private
   -- Definición de la estructura de la cola
   subtype Índice is Natural range 0..Tamaño-1;
   type array_Elementos is array (Índice) of Elementos;
   subtype Contadores is Natural range 0..Tamaño;
   type Cola is record
      Primero: Índice := Índice'First;
      Último: Índice := Índice'First;
      Número_de_Elementos: Contadores := 0;
      Elementos: array_Elementos;
   end record;
end Colas;
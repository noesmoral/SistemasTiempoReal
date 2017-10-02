generic
   type Elementos is private;
   Tama�o: Natural := 32; -- Tama�o por omisi�n
package Colas is
   -- Declaraci�n del tipo "Cola"
   type Cola is limited private;
   -- Operaciones
   procedure Poner (el_Elemento: Elementos;
                     en_la_Cola: in out Cola);
   procedure Quitar (un_Elemento: out Elementos;
                      de_la_Cola: in out Cola);
   function Est�_Vac�a (la_Cola: Cola) return Boolean;
   function Est�_Llena (la_Cola: Cola) return Boolean;
   procedure Copiar (Origen: Cola; Destino: in out Cola);
   function "="(la_Cola, con_la_Cola: Cola) return Boolean;
private
   -- Definici�n de la estructura de la cola
   subtype �ndice is Natural range 0..Tama�o-1;
   type array_Elementos is array (�ndice) of Elementos;
   subtype Contadores is Natural range 0..Tama�o;
   type Cola is record
      Primero: �ndice := �ndice'First;
      �ltimo: �ndice := �ndice'First;
      N�mero_de_Elementos: Contadores := 0;
      Elementos: array_Elementos;
   end record;
end Colas;
with Ada.Exceptions; use Ada.Exceptions;
package Fallos is
   procedure Fatal (E: Exception_Occurrence; Mensaje : String);
end Fallos;
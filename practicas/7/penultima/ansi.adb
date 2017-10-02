with Ada.Text_Io; use Ada.Text_Io;
package body ansi is
   procedure Borrar_Pantalla is
   begin
      Put (Ascii.Esc&"[2J");
   end Borrar_Pantalla;

   package Natural_Es is new Integer_Io(Natural);
   use Natural_Es;
   procedure Poner_Cursor(Fila, Columna: Natural) is
   begin
      Put (Ascii.Esc&"["); Put (Fila+1, Width => 0); Put (';');
      Put (Columna+1, Width => 0); Put ('f');
      -- Le sumamos 1 a la "Fila" y a la "Columna" porque el
      -- origen de coordenadas es (1, 1) para el controlador "Ansi".
      -- Los módulos que utilicen este paquete deben considerar el
      -- origen en (0, 0).
   end Poner_Cursor;
end ansi;


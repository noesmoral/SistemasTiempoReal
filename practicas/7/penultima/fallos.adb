with Pantalla;
package body Fallos is
   procedure Fatal (E: Exception_Occurrence; Mensaje: String) is
      task Aviso_Parpadeante;
      task body Aviso_Parpadeante is
      begin
         loop
            Pantalla.Escribir ("                                                                    ", 12, 8);
            Pantalla.Escribir (" +----------------------------------------------------------------+ ", 13, 8);
            Pantalla.Escribir (" |                                                                | ", 14, 8);
            Pantalla.Escribir (" |                                                                | ", 15, 8);
            Pantalla.Escribir (" |                                                                | ", 16, 8);
            Pantalla.Escribir (" +----------------------------------------------------------------+ ", 17, 8);
            Pantalla.Escribir ("                                                                    ", 18, 8);
            Pantalla.Escribir ("Excepcion capturada por " & Mensaje, 14, 10);
            Pantalla.Escribir ("Se ha elevado " & Exception_Name (E), 15, 10);
            Pantalla.Escribir ("En el módulo " & Exception_Message (E), 16, 10);
            delay 1.0;
            Pantalla.Escribir ("                                                                    ", 12, 8);
            Pantalla.Escribir ("                                                                    ", 13, 8);
            Pantalla.Escribir ("                                                                    ", 14, 8);
            Pantalla.Escribir ("                                                                    ", 15, 8);
            Pantalla.Escribir ("                                                                    ", 16, 8);
            Pantalla.Escribir ("                                                                    ", 17, 8);
            Pantalla.Escribir ("                                                                    ", 18, 8);
            delay 0.1;
         end loop;
      end Aviso_Parpadeante;
   begin
      null;
   end Fatal;
end Fallos;
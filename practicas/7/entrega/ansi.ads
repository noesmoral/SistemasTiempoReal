-- Paquete para escribir en pantalla usando las secuencias de escape del
-- controlador ANSI.SYS.
-- Para poder usar este paquete con efectividad es necesario que en el
-- fichero CONFIG.SYS figure una línea como la siguiente: 
--    DEVICE = C:\DOS\ANSI.SYS
--
package ansi is
   procedure Borrar_Pantalla;
   procedure Poner_Cursor (Fila, Columna: Natural);
end ansi;

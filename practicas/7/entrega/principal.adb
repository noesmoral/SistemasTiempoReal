with Pantalla, teclado, controlador, reloj, monitor_textual, centinela, monitor_grafico;

procedure principal is
   Marco: array (Pantalla.Filas'Range) of String (1..79) := (
      "+-----------------------------------------------------------------------------+",
      "|     Hora:HH:MM:SS   Temperatura:eee.d [C]   T R CH MT MG  C       S - Salir |",
      "|Ejecucion:HH:MM:SS      Potencia:eeeee [W]   - - -- -- --  -                 |",
      "+-----------------------------------------------------------------------------+",
      "|300[C]                                                                       |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|                                                                             |",
      "|  0[C]                                                                       |",
      "+-----------------------------------------------------------------------------+");
begin
   -- Dibujar el "Marco"
   Pantalla.Borrar;
   for I in Marco'Range loop
      Pantalla.Escribir (Marco(I), I, Pantalla.Columnas'First);
   end loop;

   while not centinela.ha_Terminado loop
      delay 5.0;
   end loop;
   
end principal;
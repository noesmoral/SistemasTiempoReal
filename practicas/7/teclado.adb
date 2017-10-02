with Ada.Real_Time,estado,fallos;
use Ada.Real_Time;

package body teclado is
	Task cronometro;
	procedure Codigo_Periodico;
	Task body cronometro is
		Siguiente_Instante:Time:=Clock;
		Periodo:constant Time_Span:=To_Time_Span(Ts);
		begin
			loop
				delay until Siguiente_Instante;
				Codigo_Periodico;
				Siguiente_Instante:=Siguiente_Instante+Periodo;	
			end loop;

		exception
			when Evento:Others => Fallos.Fatal(Evento,"Teclado.adb");		
		end;
	end cronometro;	

	-- Variables y constantes que deben conservar sus valores entre las
	-- sucesivas llamadas al "Código_Periódico"
	procedure Código_Periódico is
		--leer una tecla de forma inmediata
		if A!=NULL then
			if A=='s' || A=='S' then
				--cambiar estado del sistema para terminar ejecucion TERMINAR
			end if;
		end if;
	end Código_Periódico;

	function ha_Terminado return Boolean is
	begin
		return cronometro'Terminated;
	end ha_Terminado;
	procedure Terminar is
	begin
	if not cronometro'Terminated then
		abort cronometro;
	end if;
	end Terminar;		
end teclado;
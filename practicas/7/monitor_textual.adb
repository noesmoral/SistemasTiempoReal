with Ada.Real_Time,sensor,fallos,estado,pantalla;
use Ada.Real_Time;

package body monitor_Textual is
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
			when Evento:Others => Fallos.Fatal(Evento,"Monitor_Textual.adb");		
		end;
	end cronometro;	

	-- Variables y constantes que deben conservar sus valores entre las
	-- sucesivas llamadas al "Código_Periódico"
	procedure Código_Periódico is
		--lee la temperaturadel sensor
		--lee la potencia del estado
		--formatear los datos para presentarlos
		--presentar en pantalla los datos formateados
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
end monitor_Textual;
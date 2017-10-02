with Ada.Real_Time, estado, fallos, Ada.Text_Io;
use Ada.Real_Time, Ada.Text_Io;

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
	end cronometro;	

	-- Variables y constantes que deben conservar sus valores entre las
	-- sucesivas llamadas al "Codigo_Periodico"
	A:character:=ASCII.NUL;
	procedure Codigo_Periodico is
	begin
		--leer una tecla de forma inmediata
		Get_Immediate(A);	--A:=getchar();
		--verificar si es correcta
		if A/=ASCII.NUL then	--consultar
			if (A='s' or A='S') then
				--cambiar estado del sistema para terminar ejecucion TERMINAR
				estado.Terminar;
			end if;
		end if;
	end Codigo_Periodico;

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
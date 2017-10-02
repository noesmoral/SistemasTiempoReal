with Ada.Real_Time,pantalla,fallos,sensor,estado;
use Ada.Real_Time,pantalla;

package body monitor_Grafico is
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
			when Evento:Others => Fallos.Fatal(Evento,"Monitor_Grafico.adb");		
	end cronometro;	

	-- Variables y constantes que deben conservar sus valores entre las
	-- sucesivas llamadas al "Código_Periódico"
	tempAux:temperaturas:=0.0;
	Temp:integer:=0;
	columna:integer:=6;
	procedure Codigo_Periodico is
	begin
		sensor.Leer(tempAux);
		--Escribir la temperatura en la historia de temperaturas de los ultimos 12min
		--pressentar en pantalla historia de temperaturas de los ultimos 12min
		Temp:=Integer(tempAux);
		if Temp>0 then
			case Temp is			
				when 0..15 => Escribir("*",23,columna);
				when 16..30 => Escribir("*",22,columna);
				when 31..45 => Escribir("*",21,columna);
				when 46..60 => Escribir("*",20,columna);
				when 61..75 => Escribir("*",19,columna);
				when 76..90 => Escribir("*",18,columna);
				when 91..105 => Escribir("*",17,columna);
				when 106..120 => Escribir("*",16,columna);
				when 121..135 => Escribir("*",15,columna);
				when 136..150 => Escribir("*",14,columna);
				when 151..165 => Escribir("*",13,columna);
				when 166..180 => Escribir("*",12,columna);
				when 181..195 => Escribir("*",11,columna);
				when 196..210 => Escribir("*",10,columna);
				when 211..225 => Escribir("*",9,columna);
				when 226..240 => Escribir("*",8,columna);
				when 241..255 => Escribir("*",7,columna);
				when 256..270 => Escribir("*",6,columna);
				when 271..285 => Escribir("*",5,columna);
				when Others => Escribir("*",4,columna);	
			end case;
			columna:=columna+1;
			if columna>71 then
				columna:=6;
				for I in 5..23 loop
					Escribir("                                                                       ",I,6);
				end loop;
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
end monitor_Grafico;
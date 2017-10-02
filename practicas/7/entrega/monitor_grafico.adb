with Ada.Real_Time,pantalla,fallos,sensor,estado;
use Ada.Real_Time,pantalla;

package body monitor_Grafico is

	Almacen: array (1..71) of temperaturas:=(Others=>1.0);

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
	procedure Codigo_Periodico is
	begin
		sensor.Leer(tempAux);
		--Escribir la temperatura en la historia de temperaturas de los ultimos 12min
		Almacen(Almacen'First..Almacen'Last-1):=Almacen(Almacen'First+1..Almacen'Last);
        Almacen(Almacen'Last) := tempAux;
		--pressentar en pantalla historia de temperaturas de los ultimos 12min
		--eliminamos lo anterior
		for I in 5..23 loop
			Escribir("                                                                       ",I,7);
		end loop;
		--mostramos lo nuevo
		for I in 7..77 loop
			Temp:=Integer(Almacen(I-6));
			if Temp>0 then
				case Temp is			
					when 0..15 => Escribir("*",23,I);
					when 16..30 => Escribir("*",22,I);
					when 31..45 => Escribir("*",21,I);
					when 46..60 => Escribir("*",20,I);
					when 61..75 => Escribir("*",19,I);
					when 76..90 => Escribir("*",18,I);
					when 91..105 => Escribir("*",17,I);
					when 106..120 => Escribir("*",16,I);
					when 121..135 => Escribir("*",15,I);
					when 136..150 => Escribir("*",14,I);
					when 151..165 => Escribir("*",13,I);
					when 166..180 => Escribir("*",12,I);
					when 181..195 => Escribir("*",11,I);
					when 196..210 => Escribir("*",10,I);
					when 211..225 => Escribir("*",9,I);
					when 226..240 => Escribir("*",8,I);
					when 241..255 => Escribir("*",7,I);
					when 256..270 => Escribir("*",6,I);
					when 271..285 => Escribir("*",5,I);
					when Others => Escribir("*",4,I);	
				end case;
			end if;
		end loop;
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
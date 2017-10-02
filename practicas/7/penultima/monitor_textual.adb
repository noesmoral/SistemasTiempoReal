with Ada.Real_Time,sensor,fallos,pantalla, estado, Ada.Text_Io,calefactor;
use Ada.Real_Time, pantalla, Ada.Text_Io;

package body monitor_textual is

	package TipoT is new Ada.Text_Io.Float_Io(Temperaturas);
	package TipoP is new Ada.Text_Io.Float_Io(calefactor.Potencias);

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
	end cronometro;	

	-- Variables y constantes que deben conservar sus valores entre las
	-- sucesivas llamadas al "Código_Periódico"
	temp:Temperaturas:=0.0;
	TemAux:String:="     ";
	PotAux:String:="      ";
	procedure Codigo_Periodico is
	begin
		--lee la temperaturadel sensor
		sensor.Leer(Temp);
		TipoT.Put(TemAux,temp, 1, 0);
		--lee la potencia del estado
		TipoP.Put(PotAux,estado.Leer_Potencia, 0, 0);
		--presentar en pantalla los datos formateados
		Escribir(TemAux, 1, 34);
		Escribir(PotAux, 2, 34);
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
end monitor_textual;
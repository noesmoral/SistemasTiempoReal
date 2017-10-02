with Ada.Real_Time, Ada.Calendar, pantalla, fallos, Ada.Text_Io;
use Ada.Real_Time, pantalla, fallos;

package body reloj is
	Task cronometro;
	procedure Codigo_Periodico;
	Task body cronometro is
		Siguiente_Instante:Time := Clock;
		Periodo:constant Time_Span:=To_Time_Span(Ts);
		begin
			loop
				delay until Siguiente_Instante;
				Codigo_Periodico;
				Siguiente_Instante:=Siguiente_Instante+Periodo;	
			end loop;

		exception
			when Evento:Others => Fallos.Fatal(Evento,"Reloj.adb");		
	end cronometro;	

	package Ns_Io is new Ada.Text_Io.Integer_Io(Integer);
	Tiempo_Origen:Time:=Clock;
	-- Variables y constantes que deben conservar sus valores entre las
	-- sucesivas llamadas al "Código_Periódico"
	procedure Codigo_Periodico is
    	Diferencia:Duration;
    	Tiempo:Time;
    	T:Ada.Calendar.Time;
    	Second:Integer;
    	Hora,Minuto,Segundo:Integer;
    	HoraO,MinutoO,SegundoO:Integer;
    	CadenaTiempo : String :="00:00:00";
    	CadenaEjecucion : String :="00:00:00";
	begin -- Codigo_Periodico
		--Calcular tiempo ejecucion
		Tiempo:=Clock;
		T:=Ada.Calendar.Clock;
		Second:=Integer(Ada.Calendar.Seconds(T));
		Diferencia:=To_Duration(Tiempo-Tiempo_Origen);
		--formatear los datos para presentarlos
		--hora actual
		Hora:= Integer(Second/3600);
		Minuto:= Integer((Second-Hora*3600)/60);
		Segundo:= (Integer(Second-Hora*3600-Minuto*60))mod 60;
		--CadenaTiempo:=Integer'Image(Hora)&':'&Integer'Image(Minuto)&':'&Integer'Image(Segundo);
		--Ada.Text_Io.Put(Integer'Image(Hora)&':'&Integer'Image(Minuto)&':'&Integer'Image(Segundo));
		--Escribir(CadenaTiempo, 1, 10);
		--tiempo del proceso
		HoraO:= (Integer(Diferencia)/3600)mod 24;
		MinutoO:= ((Integer(Diferencia)-HoraO*3600)/60)mod 60;
		SegundoO:= (Integer(Diferencia)-HoraO*3600-MinutoO*60) mod 60;
		--CadenaEjecucion:=Integer'Image(HoraO)&':'&Integer'Image(MinutoO)&':'&Integer'Image(SegundoO);
		Ada.Text_IO.Put(Integer'Image(HoraO)&':'&Integer'Image(MinutoO)&':'&Integer'Image(SegundoO));
		--presentar en la pantalla los datos
		--Escribir(Integer'Image(SegundoO), 2, 11);
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
end reloj;
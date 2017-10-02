with Ada.Real_Time, Ada.Calendar, pantalla, fallos, Ada.Text_Io;
use Ada.Real_Time, pantalla, fallos, Ada.Text_Io;

package body reloj is

	package Re_Io is new Ada.Text_Io.Integer_Io(Natural);

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
    	Hora,Minuto,Segundo:Natural;
    	HoraO,MinutoO,SegundoO:Natural;
    	CadenaH,CadenaM,CadenaS,CadenaOH, CadenaOM, CadenaOS:String:="  ";
	begin -- Codigo_Periodico
		--Calcular tiempo ejecucion
		Tiempo:=Clock;
		T:=Ada.Calendar.Clock;
		Second:=Integer(Ada.Calendar.Seconds(T));
		Diferencia:=To_Duration(Tiempo-Tiempo_Origen);
		--formatear los datos para presentarlos
		--hora actual
		Hora:= Natural(Second/3600);
		Minuto:= Natural((Second-Hora*3600)/60);
		Segundo:= (Natural(Second-Hora*3600-Minuto*60))mod 60;
		Re_Io.Put(CadenaH,Hora,10);
		Re_Io.Put(CadenaM,Minuto,10);
		Re_Io.Put(CadenaS,Segundo,10);
		--tiempo del proceso
		HoraO:= (Natural(Diferencia)/3600)mod 24;
		MinutoO:= ((Natural(Diferencia)-HoraO*3600)/60)mod 60;
		SegundoO:= (Natural(Diferencia)-HoraO*3600-MinutoO*60) mod 60;
		Re_Io.Put(CadenaOH,HoraO,10);
		Re_Io.Put(CadenaOM,MinutoO,10);
		Re_Io.Put(CadenaOS,SegundoO,10);
		--presentar en la pantalla los datos
		Escribir("         ",1,10);
		Escribir(CadenaH&':'&CadenaM&':'&CadenaS, 1, 10);
		Escribir("         ",2,10);
		Escribir(CadenaOH&':'&CadenaOM&':'&CadenaOS, 2, 10);
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
with Ada.Real_Time, sensor, calefactor, pid, estado, Fallos;
use Ada.Real_Time, sensor, calefactor, estado, Fallos;

package body controlador is
	
	package Control_Horno is new PID(Real=>Float, Entrada=>Temperaturas, Salida=>Potencias);
	use Control_Horno;
	
	Controlador_del_horno : Control_Horno.Controlador;

	Temp:Temperaturas;
	Temp_ref:Temperaturas:=250.0;
	P:Potencias;

	Ct:Constant:=1_500.0;	--Inicializamos las variables con la valores del Horno
	Cp:Constant:=15.0;
	L:Constant:=1.5;
	
	R:Float;
	Imp:Float:=0.0;			--variable para imprimir
	Kp,Ki,Kd:Float;	

	Task cronometro;
	procedure Codigo_Periodico;
	Task body cronometro is
		Siguiente_Instante:Time:=Clock;
		Periodo:constant Time_Span:=To_Time_Span(Ts);
		begin
		--Calculamos las variables con los valores optimos vistos en teoria
		R:=Float(Temp_ref-25.0)/(Ct/Cp);
		Kp:=1.2/(R*L);
		Ki:=Kp/(2.0*L)*Float(Ts);
		Kd:=Kp*(0.5*L)*Float(Ts);
		--Llamamos a Programar con los valores calculados, para inicializar el controlador
		Programar(Controlador_del_horno,Kp,Ki,Kd);
			loop
				delay until Siguiente_Instante;
				Codigo_Periodico;
				Siguiente_Instante:=Siguiente_Instante+Periodo;	
			end loop;

		exception
			when Evento:Others => Fallos.Fatal(Evento,"Controlador.adb");		
	end cronometro;	

	-- Variables y constantes que deben conservar sus valores entre las
	-- sucesivas llamadas al "Codigo_Periodico"
	procedure Codigo_Periodico is
		
	begin -- Procedure
		sensor.Leer(Temp);
		Controlar(Controlador_del_horno,Temp_ref,Temp,P);
		calefactor.Escribir(P);
		estado.Escribir_Potencia(P);
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
end controlador;
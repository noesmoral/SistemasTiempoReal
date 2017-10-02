with Ada.Text_Io, Ada.Real_Time, sensor, calefactor, pid; use Ada.Text_Io, Ada.Real_Time, sensor, calefactor;

procedure Principal is

	package Tem_ES is new Ada.Text_Io.Float_Io(Temperaturas);

	package Control_Horno is new PID(Real=>Float, Entrada=>Temperaturas, Salida=>Potencias);
	use Control_Horno;
	
	Controlador_del_horno : Controlador;

	Ts:Constant:=2;
	Temp:Temperaturas;
	Temp_ref:Temperaturas:=100.0;
	P:Potencias;

	Ct:Constant:=1_500.0;	--Inicializamos las variables con la valores del Horno
	Cp:Constant:=15.0;
	L:Constant:=1.5;
	
	R:Float;
	Kp,Ki,Kd:Float;

begin -- Principal
	--Pedimos la temperatura de referencia
	Put("Introduzca la Temperatura de referencia: ");
	New_Line;
	Tem_ES.Put(Temp_ref);
	New_Line;

	--Calculamos las variables con los valores optimos vistos en teoria

	R:=Float(Temp_ref-25.0)/(Ct/Cp);
	Kp:=1.2/(R*L);
	Ki:=Kp/(2.0*L)*Float(Ts);
	Kd:=Kp*(0.5*L)*Float(Ts);

	--Llamamos a Programar con los valores calculados, para inicializar el controlador
	Programar(Controlador_del_horno,Kp,Ki,Kd);

	--Creamos la variables de tiempo necesarios para la realizacion del bucle descrito
	declare 
	periodo:Constant Time_Span:= To_Time_Span(Duration(Ts));
	Siguiente_Instante:Time:= Clock;
	Instante_Actual:Time:= Clock;
	begin

	loop 																			-- Bucle con periodicidad Ts
		delay until Siguiente_Instante;												--esperar al siguiente instante de muestreo
		Leer(Temp);																	--Leemos la temperatura del sensor
																					--diferencia de temperaturas que hace Controlar
		Controlar(Controlador_del_horno,Temp_ref,Temp,P);							--calcular u(t)=P(t)=PID(e)
		Escribir(P);  																--escribir P en el calefactor
		Tem_ES.Put(temp);  															--mostrar teperatura
		New_Line;
		Siguiente_Instante:= Siguiente_Instante+periodo;							--Pasamos al siguiente instante
		exit when  (float(to_duration(Siguiente_Instante-Instante_Actual))>600.0);	--Salimos del bucle al llegar a los 10 min
	end loop;
	end;
end Principal;





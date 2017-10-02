 with Ada.Text_Io, Ada.Real_Time, sensor, calefactor; use Ada.Text_Io, Ada.Real_Time, sensor, calefactor;

procedure Medir1 is

	--Declaracion de los paquetes necesarios
	package Tem_Es is new Ada.Text_Io.Float_Io(Temperaturas);
	package Tim_Es is new Ada.Text_Io.Float_Io(Potencias);
	package CP_Es is new Ada.Text_Io.Float_Io(Float);

	--Variables a medir
	Te:Temperaturas:=0.0;	--Temperatura ambiente, temperatura del horno antes de empezar
	TeAux:Temperaturas:=0.0;--Temperatura aux
	TeAnt:Temperaturas:=0.0;

	L:Time_Span;			--Retardo de respuesta, necesario usar la funcion real time
	Start,Finish:Time;		--Contadores para la optencion del retardo
	Pot:Potencias:=1000.0;	--Valor de potencia para calcular los tiempos

	Cp:Float;				--Coeficiente de perdidas

begin -- Medir1

	--CALCULO Te
	Leer(Te);		--Obtener la temperatura del horno en reposo mirando el sensor y el sensor el horno

	--CALCULO L
	Escribir(Pot);--aplicamos una potencia al horno
	Start:=Clock;			--Iniciamos el contador
	loop
		Leer(TeAux);
		exit when Te/=TeAux;
	end loop;
	Finish:=Clock;			--Final del contado
	L:=Finish-Start;		--Tiempo total tardado

	--CALCULO Cp
	TeAnt:=0.0;				--temperatura anterior
	Leer(TeAux);			--temperatura actual
	while TeAux/=TeAnt loop --mientras que las temperaturas no sean iguales
		TeAnt:=TeAux;		--pasamos la actual a ant para la proxima iteracion
		delay Duration(0.5);--delay para que de tiempo a aumentar la temperatura
		Leer(TeAux);		--leemos la nueva temaux
	end loop;
	TeAux:=TeAux-Te;					--Diferencia temperaturas
	Cp:=(Float(Pot)/Float(TeAux));		--Caluclamos el valor de Cp

	Put("Valor de Te");
	New_Line;
	Tem_Es.Put(Te,Fore=>3,Aft=>1,Exp=>0);
	New_Line;
	Put("Valor de L");
	New_Line;
	CP_Es.Put(Float(To_Duration(L)));
	New_Line;
	Put("Valor de Cp");
	New_Line;
	CP_Es.Put(Cp,Fore=>3,Aft=>1,Exp=>0);
	New_Line;

	Escribir(0.0);			--apagamos el horno antes de salir	
end Medir1;

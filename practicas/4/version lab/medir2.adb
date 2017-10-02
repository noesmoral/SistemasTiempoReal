with Ada.Text_Io, Ada.Real_Time, sensor, calefactor; use Ada.Text_Io, Ada.Real_Time, sensor, calefactor;

procedure Medir2 is
	--definicion de los tipos de las variables a medir
	type Temperaturas is new Float range -25.0..500.0;
	type Potencias is new Float range 0.0 .. 10_000.0;

	package CP_Es is new Ada.Text_Io.Float_Io(Float);

	--Variables a medir
	Te:Temperaturas:=20.0;			--temperatura ambiente, temperatura optenida de MEDIR1
	TeAux:Temperaturas:=0.0;			--temperatura ambiente, temperatura optenida de MEDIR1
	Tm:temperatura:=0.0;		--temperatura media para la cuenta

	D:Duration;

	L:Time_Span:=1.60004;				--Retardo de respuesta, necesario usar la funcion real time MEDIR1
	Start,Finish:Time;			--contadores para la optencion del retardo
	Pot:Potencias:=1000.0;		--valor de potencia para calcular los tiempos

	Cp:Float;					--Coeficiente perdidas necesario para obtener el regimen permanante
	CpA:Float:=14999.8;			--valor de Cp del apartado MEDIR1 para el calculo de Ct
	Aux1:Float;

begin -- Medir2

	Escribir(Pot);				--aplicamos potencia al horno
	delay Duration(L);			--Esperamos un tiempo obtenido en MEDIR1 a que empiece a cambiar la temperatura

	Start:=Clock;				--Iniciamos el contador
	delay Duration(0.5);		--delay para tener un margen  para la cuenta NO PUEDE SER MUY GRANDE
	Finish:=Clock;				--Final del contado
	L:=Finish-Start;			--Tiempo total tardado
	Leer(TeAux);

	D:=To_Duration(L);
	Tm:=(TeAux-Te);			--calculo delta de Temperaturaas
	Aux1:=Float(Tm);

	Ct:=(((Float(Pot)-CpA*(Aux1))/(Aux1))*Float(D));	--calculo de Ct en tiempo transitorio

	Put("Valor de Ct");
	CP_Es.Put(Ct);
	Put(" J/K");
	New_Line;

	Escribir(0.0);				--apagamos el horno antes de salir

end Medir2;

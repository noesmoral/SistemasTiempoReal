with Ada.Text_Io, Ada.Real_Time, proc;
use Ada.Text_Io, Ada.Real_Time, proc;

procedure simular is

	--paquete para poder imprimir
	package Ns_Io is new Integer_Io(Natural);
	use Ns_Io;
	package Fs_Io is new Ada.Text_Io.Float_Io(Float);
	use Fs_Io;

	--declaraciones y definiciones
	type ref_Procedimiento is access procedure;
	task type Tarea (Nombre : Natural;	--nombre tarea
		T : Natural;	--periodo
		D : Natural;	--plazo de respuesa
		C : Natural;	--tiempo computo
		P : Natural;	--prioridad
		Codigo_Ciclico: ref_Procedimiento) is
		pragma Priority (P);
	end Tarea;

	--el numero 4 da la maxima prioridad
	Tarea1: Tarea (1, 2400, 600 , 400, 4, P1'Access);
	Tarea2: Tarea (2, 3200, 1200, 600, 3, P2'Access);
	Tarea3: Tarea (3, 3600, 2000, 800, 2, P3'Access);
	Tarea4: Tarea (4, 4000, 3200, 800, 1, P4'Access);

	--tiempo de ejecucion del prorgama final
	FinalPrograma:Time:=Clock+to_Time_Span(Duration(50));

	--Declaracion de acciones de cada una de las tareas que se ejecutan
	task body Tarea is 
	siguienteInstante,T1,T2:Time;
	periodo:duration:=Duration(T)/1000.0;
	Trespuesta:Constant Time_Span:=to_Time_Span(Duration(D));
	diferenciaTiempo:Time_Span;
	begin
		siguienteInstante:=Clock+to_Time_Span(periodo);
		loop
			--espera para que se realiza en los tiempos de periodicidad de cada tarea
			delay until siguienteInstante;
			Put("Empieza tarea");	--mostramos nuestra informacion para poder seguir el curso de ejecucion
			Put(Nombre);
			new_line;
			T1:=Clock;
			Codigo_Ciclico.all;		--ejecucion de su proceso delay correspondiente
			T2:=Clock;
			Put("Termina tarea");	--avisamos de que hemos terminado
			Put(Nombre);
			new_line;
			diferenciaTiempo:=T2-T1;--comprobamos los tiempos
			Put(Float(to_Duration(diferenciaTiempo))*1000.0,Fore=>4,Aft=>0,Exp=>0);
			new_line;
			Put(Float(to_Duration(Trespuesta)),Fore=>4,Aft=>0,Exp=>0);
			new_line;
			--en caso de superar el tiempo de respuesta se avisa que que hay un error
			if (Float(to_Duration(diferenciaTiempo))*1000.0) > Float(to_Duration(Trespuesta))  then
				new_line;
				Put("Tiempo de proceso");
				Put(Nombre);
				Put(" sobrepasado");
				new_line;
			end if;
			siguienteInstante:=siguienteInstante+to_Time_Span(periodo);	--actualizamos para la proximaiteracion
		end loop;
	end Tarea;

begin -- simular
	--espera de ejecucion del progama antes de cerrar las tareas y salir en este caso 50 seg
	delay until FinalPrograma;
	abort Tarea1;
	abort Tarea2;
	abort Tarea3;
	abort Tarea4;
end simular;


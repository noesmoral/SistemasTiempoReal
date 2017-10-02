with Ada.Real_Time;
use Ada.Real_Time;

package body plan is
   
   procedure Medir (Procedimientos: array_ref_Procedimiento; Tiempos : out array_Tiempos) is
   T1,T2:Time;
   Diferencia:Time_Span;
   begin
   		for I in Procedimientos'Range loop
   			T1:=Clock;
   			Procedimientos(I).all;
   			T2:=Clock;
   			Diferencia:=T2-T1;
   			Tiempos(I):=Natural(to_duration(Diferencia)*1000.0);	
   		end loop;	
   end Medir;

   procedure Planificar (Tareas: in out array_reg_Planificacion) is
   auxBurbuja:reg_Planificacion;
   W,W2,var,Division:Integer;
   begin
   		--ordenar por metodo burbuja, de mayor duracion a menos
   		for I in Tareas'Range loop
   			for J in 1..Tareas'length-1 loop
   				if Tareas(J).D < Tareas(J+1).D then	--comprobamos los tiempos
   					auxBurbuja:=Tareas(J);			--si es necesario reordenamos de no ser asi no se hace nada
   					Tareas(J):=Tareas(J+1);
   					Tareas(J+1):=auxBurbuja;
   				end if;
   			end loop;
   		end loop;
   		--Damos prioridad de menor a mayor ya que el primerro es el que tiene mayor tiempo y por tanto menor prioridad
   		for I in Tareas'Range loop
   			Tareas(I).P:=I;
   		end loop;
   		--Formula Matematica para DMS
   		--como el que tiene mas prioridad esta al final empezamos haciendo los calculos para el de menos y
   		--vamos subiendo (de atras a delante respecto a la teoria)
   		for I in 1..Tareas'length loop
   			W2:=0;
   			W:=W2;
   			--Calculamos el sumatorio de los tiempos de computo necesarios
   			for J in I..Tareas'length loop
   				W:=W+Tareas(J).C;
   			end loop;
   			--Repetimos el calulo de W (teoria) hasta que se cumpla el while
   			while ((W/=W2) and (W<Tareas(I).D)) loop
   				W2:=W;
   				var:=0;
   				for J in (I+1)..Tareas'length loop
   					Division:=W2/Tareas(J).T;
   					-- Situacion de redondeo (ya que al pasar a in redondea hacia abajo)
   					if ((W2 rem Tareas(J).T)>0) then
   						Division:=Division+1;
   					end if;
   					--
   					var:=var+Division*Tareas(J).C;
   				end loop;
   				W:=Tareas(I).C+var;
   			end loop;
   			Tareas(I).R:=W;		--una vez terminado asignamos el valor de W a la R (tiempo respuesta) de su respectiva tarea
   		end loop;
   		--Comprobamos si es planificable 
   		for I in Tareas'Range loop
   			if Tareas(I).R <= Tareas(I).D then
   				Tareas(I).planificable:=true;
   			end if;
   		end loop;
   end Planificar;

   procedure MedirC(Tareas: in out array_reg_Planificacion; Procedimientos: array_ref_Procedimiento; Tiempos : out array_Tiempos) is
   T1,T2:Time;
   DiferenciaVacia, Diferencia, tiempoCp:Time_Span;
   begin -- MedirC
   		--medimos el tiempo en hacer 10 veces el bucle vacio
   		T1:=Clock;
   		for I in 1..10 loop
   			null;
   		end loop;
   		T2:=Clock;
   		DiferenciaVacia:=T2-T1;
   		--realizamos 10 veces cada procedimiento y obtenemos su tiempo de computo con la diferencia respecto al bucle vacio
   		for I in Procedimientos'Range loop
   			T1:=Clock;
   			for J in 1..10 loop
   				Procedimientos(I).all;	
   			end loop;
   			T2:=Clock;
   			Diferencia:=T2-T1;
   			tiempoCp:=(T2-T1)-DiferenciaVacia;
   			Tiempos(I):=Natural(to_duration(tiempoCp)*100.0);	--multiplicamos entre 100 en vez de 1000 para convertir ya que el buble es de 10	
   			Tareas(I).C:=Tiempos(I);							--pasamos los tiempos de computo a sus respectivos
   		end loop;		
   end MedirC;
end plan;
with Ada.Real_Time,pantalla,fallos, estado, reloj, teclado, controlador, monitor_textual, monitor_grafico;
use Ada.Real_Time,pantalla,fallos;

package body centinela is
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
			when Evento:Others => Fallos.Fatal(Evento,"Centinela.adb");		
	end cronometro;	

	-- Variables y constantes que deben conservar sus valores entre las
	-- sucesivas llamadas al "Código_Periódico"
	contadorBarra,contadorParpadeante:integer:=0;
	procedure Codigo_Periodico is
	begin
		--si el estado ha terminado entonces
		if estado.ha_Terminado then
			--terminar las actividades ciclicas:teclado, reloj, controlador, monitor_textual y monitor_grafico
			while not teclado.ha_Terminado loop
				teclado.Terminar;
			end loop;
			while not reloj.ha_Terminado loop
				reloj.Terminar;
			end loop;
			while not controlador.ha_Terminado loop
				controlador.Terminar;
			end loop;
			while not monitor_textual.ha_Terminado loop
				monitor_textual.Terminar;
			end loop;
			while not monitor_grafico.ha_Terminado loop
				monitor_grafico.Terminar;
			end loop;
			--borrar la pantalla
			pantalla.Borrar;
			--terminar centinela
			centinela.Terminar;
		else
			--si ha treminado alguna de las actividades ciclicas 
			if teclado.ha_Terminado or reloj.ha_Terminado or controlador.ha_Terminado or monitor_grafico.ha_Terminado or monitor_textual.ha_Terminado then
				--poner parpadenate su indicador correspondiente
				if teclado.ha_Terminado and contadorParpadeante=0 then
					pantalla.Escribir("*", 2, 46);
				elsif teclado.ha_Terminado and contadorParpadeante=1 then
					pantalla.Escribir(" ", 2, 46);
				end if;
				if reloj.ha_Terminado and contadorParpadeante=0 then
					pantalla.Escribir("*", 2, 48);
				elsif reloj.ha_Terminado and contadorParpadeante=1 then
					pantalla.Escribir(" ", 2, 48);
				end if;
				if controlador.ha_Terminado and contadorParpadeante=0 then
					pantalla.Escribir("**", 2, 50);
				elsif controlador.ha_Terminado and contadorParpadeante=1 then
					pantalla.Escribir("  ", 2, 50);
				end if;
				if monitor_textual.ha_Terminado and contadorParpadeante=0 then
					pantalla.Escribir("**", 2, 53);
				elsif monitor_textual.ha_Terminado and contadorParpadeante=1 then
					pantalla.Escribir("  ", 2, 53);
				end if;
				if monitor_grafico.ha_Terminado and contadorParpadeante=0 then
					pantalla.Escribir("**", 2, 56);
				elsif monitor_grafico.ha_Terminado and contadorParpadeante=1 then
					pantalla.Escribir("  ", 2, 56);
				end if;
				contadorParpadeante:=(contadorParpadeante+1)mod 2;
			else 
				pantalla.Escribir("*", 2, 46);
				pantalla.Escribir("*", 2, 48);
				pantalla.Escribir("**", 2, 50);
				pantalla.Escribir("**", 2, 53);
				pantalla.Escribir("**", 2, 56);
			end if;
			--cambiar el indicador de la actividad ciclica centinela para mostrar que sigue viva
			case contadorBarra is
				when 0 => pantalla.Escribir("|", 2, 60);
				when 1 => pantalla.Escribir("/", 2, 60);
				when 2 => pantalla.Escribir("-", 2, 60);
				when 3 => pantalla.Escribir("\", 2, 60);
				when 4 => pantalla.Escribir("|", 2, 60);
				when 5 => pantalla.Escribir("/", 2, 60);
				when 6 => pantalla.Escribir("-", 2, 60);
				when Others => pantalla.Escribir("\", 2, 60);
			end case;
			contadorBarra:=(contadorBarra+1)mod 7;
		end if;
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
end centinela;
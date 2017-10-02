with Ada.Text_Io,Fracciones;
use Ada.Text_Io,Fracciones;

package body Fracciones is

	--Declracion de los paquetes necesarios (preguntar si al estar positive dentro de integer valdria con 1 solo de los 2)
	package Ent_Es is new Ada.Text_Io.Integer_Io(Integer);
	package Pos_Es is new Ada.Text_Io.Integer_Io(Positive);

	--Vraiables Si las hubiera

	--Funcipones Operaciones
	function "+" (X,Y:Fraccion) return Fraccion is
		AUX:Fraccion;
	begin -- "+"
		AUX.Num:=((X.Num*Y.Den)+(Y.Num*x.Den));
		AUX.Den:=(X.Den*Y.Den);
		return AUX;
	end "+";

	function "-" (X:Fraccion) return Fraccion is
		AUX:Fraccion;
	begin -- "-"
		AUX.Num:= -(X.Num);
		AUX.Den:= X.Den;
		return AUX;
	end "-";

	function "-" (X,Y:Fraccion) return Fraccion  is
		AUX,AUX1:Fraccion;
	begin -- "-" 
		AUX1:= -(Y);
		AUX:= X+AUX1; --Llamada a la funcion "+"
		return AUX;
	end "-" ;

	function "*" (X,Y:Fraccion) return Fraccion is
		AUX:Fraccion;
	begin -- "*"
		AUX.Num:=X.Num*Y.Num;
		AUX.Den:=X.Den*Y.Den;
		return AUX;
	end "*";

	function inverso (X:Fraccion) return Fraccion is 
		AUX:Fraccion;
	begin -- inverso 
		AUX.Num:=X.Den;
		AUX.Den:=X.Num;
		return AUX;
	end inverso ;

	function "/" (X,Y:Fraccion) return Fraccion is
		AUX,AUX1:Fraccion;
	begin -- "/" 
		AUX1:=inverso(Y);
		AUX:= X*AUX1; --Llamada a la funcion "*"
		return AUX;
	end "/" ;

	function "=" (X,Y:Fraccion) return Boolean is
	begin -- "="
		if (X.Num*Y.Den)=(X.Den*Y.Num) then
			return True;
		else return False;
		end if;
	end "=";

	--Contructor de fraciones apartir de enteros (Falta implementar las restricciones para integer y positive)
	function "/" (X,Y:Integer) return Fraccion  is
		AUX:Fraccion;
		Vx,Vy,C1,C2:Integer;
		AUXMCD:Integer;
	begin -- "/" (X,Y:In)
		C1:=0;
		C2:=0;
		AUXMCD:=mcd(X,Y);	--calulamos el mcd
		AUX.Num:=X;			--creamos la fraccion original y si es necesario se cambiara luego si no pues se mantiene
		AUX.Den:=Y;

		if AUXMCD/=1 then	--Si el mcd es 1 esta reducida o no se puede reducir si no operar
			if X<0 then		--para los x negativos
				Vx:=-X;		--invertimos para operar
				loop
					Vx:=Vx-AUXMCD;--vamos restando el mcd y contamos las veces que se hace
					C1:=C1+1;
					exit when Vx=0;
				end loop;
				AUX.Num:=-(C1);	--Asignamos el numero de veces que se ha restado el mcd con signo -
			else			--si es positivo igual pero sin invertir el signo
				Vx:=X;
				loop
					Vx:=Vx-AUXMCD;
					C1:=C1+1;
					exit when Vx=0;
				end loop;
				AUX.Num:=C1;
			end if;
			if Y<0 then		--para los y negativos aunque no deberia de haber denominador negativo si eso cambiar 
				Vy:=-Y;		--invertimos para operar
				loop
					Vy:=Vy-AUXMCD;--vamos restando el mcd y contamos las veces que se hace
					C2:=C2+1;
					exit when Vy=0;
				end loop;
				AUX.Den:=-(C2);	--Asignamos el numero de veces que se ha restado el mcd con signo -
			else			--si es positivo igual pero sin invertir el signo
				Vy:=Y;
				loop
					Vy:=Vy-AUXMCD;
					C2:=C2+1;
					exit when Vy=0;
				end loop;
				AUX.Den:=C2;
			end if;
		end if;
		return AUX;
	end "/";

	--Funciones lectura y escritura
	procedure Leer (F: out Fraccion) is
		Num:Integer;
		Den:Positive;
	begin -- Leer
		Put ("Introduce el numerador de la  Fraccion: ");
		Ent_Es.Get(Num);--Interger_Es
		Put ("Introduce el Denominador de la Fraccion: ");
		Ent_Es.Get(Den);
		F.Num:=Num;
		F.Den:=Den;
	end Leer;

	procedure Escribir (F:Fraccion) is		
	begin -- Escribir
		Put ("La Fraccion es: ");
		Ent_Es.Put (F.Num);
		Put ("/");
		Pos_Es.Put (F.Den);
		New_Line;
	end Escribir;

	--Funcion para separar las partes "Separador"
	function Numerador (F:Fraccion) return Integer  is
	begin -- Numerador
		return F.Num;
	end Numerador;

	function Denominador (F:Fraccion) return Positive is
	begin -- Denominador
		return F.Den;
	end Denominador;

	--MCD mediante el algoritmo de euclides
	function mcd (X,Y: Integer) return Integer is
		resto, Xaux, Yaux:Integer;
	begin -- mcd
		Xaux:=X;
		Yaux:=Y;
		if Xaux>Yaux then
			loop
				resto:=Xaux mod Yaux;
				Xaux:=Yaux;
				Yaux:=resto;
				exit when Yaux=0 ;	
			end loop;
			return Xaux;
		else 
			loop
				resto:=Yaux mod Xaux;
				Yaux:=Xaux;
				Xaux:=resto;
				exit when Xaux=0 ;	
			end loop;
			return Yaux;
		end if;
	end mcd;

end Fracciones;
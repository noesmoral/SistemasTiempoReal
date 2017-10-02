with Ada.Text_Io,Fracciones;
use Ada.Text_Io,Fracciones;

package body Fracciones is

	--Declaracion de los paquetes necesarios
	package Ent_Es is new Ada.Text_Io.Integer_Io(Integer);
	package Pos_Es is new Ada.Text_Io.Integer_Io(Positive);

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
		if X.Num<0 then		--Si el numerador es negativo cambiamos los signos y rotamos para asi evitar negativos en el denominador  
			AUX.Num:= -(X.Den);
			AUX.Den:= -(X.Num);
		else 				--si no simplemente rotamos
			AUX.Num:=X.Den;
			AUX.Den:=X.Num;
		end if;		
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

	--Contructor de fracciones a partir de enteros
	function "/" (X,Y:Integer) return Fraccion  is
		AUX:Fraccion;
		Vx,Vy,C1,C2,AuxE:Integer;
		AUXMCD:Integer;
	begin -- "/" (X,Y:In)
		--inicializamos las variables
		C1:=0;
		C2:=0;

		if Y<0 then								--Si el denominador es negativo cambiamos el signo al numerador
			AuxE:=-Y;							--Quitamos el signo del denominador
			AUXMCD:=mcd(X,AuxE);						--Calculamos el mcd
			AUX.Num:=X;							--Creamos la fraccion original por si no hubiera necesidad de reducir
			AUX.Den:=AuxE;
			if AUXMCD/=1  then						--Si el mcd es 1 esta reducida o no se puede reducir,  si no se opera modificando la fracion a devolver
				Vx:=X;							--Calculamos el valor del numerador
				loop
					Vx:=Vx-AUXMCD;
					C1:=C1+1;
					exit when Vx=0;
				end loop;
				AUX.Num:=C1;
				Vy:=AuxE;						--Calculamos el denominador
				loop
					Vy:=Vy-AUXMCD;
					C2:=C2+1;
					exit when Vy=0;
				end loop;
				AUX.Den:=C2;
			end if;
			return -AUX;						--Retornamos el valor de la fraccion reducida o sin reducir pero al ser el denominador negativo cambiamos el signo al numerador
		else	
			AUXMCD:=mcd(X,Y);					--Calculamos el mcd ya que no hay denominador negativo
			AUX.Num:=X;						--Creamos la fraccion original por si no hubiera necesidad de reducir
			AUX.Den:=Y;
			if AUXMCD/=1  then					--Si el mcd es 1 esta reducida o no se puede reducir,  si no se opera modificando la fracion a devolver
				Vx:=X;						--Calculamos el valor del numerador
				loop
					Vx:=Vx-AUXMCD;
					C1:=C1+1;
					exit when Vx=0;
				end loop;
				AUX.Num:=C1;
				Vy:=Y;						--Calculamos el denominador
				loop
					Vy:=Vy-AUXMCD;
					C2:=C2+1;
					exit when Vy=0;
				end loop;
				AUX.Den:=C2;
			end if;
			return AUX;						--Retornamos el valor de la fracion reducida o sin reducir
		end if;
	end "/";

	--Funciones lectura y escritura
	--Pedimos los datos o los leemos del teclado
	procedure Leer (F: out Fraccion) is
		Num:Integer;
		Den:Positive;
	begin -- Leer
		Put ("Introduce el numerador de la  Fraccion: ");
		Ent_Es.Get(Num);--Interger_Es
		Put ("Introduce el Denominador de la Fraccion: ");
		Pos_Es.Get(Den);
		if Num<0 then
			Num:=-Num;
			F:=-Num/Den;
		else
			F:=Num/Den;
		end if;		
	end Leer;

	--Mostramos la fraccion
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
		if Xaux>Yaux then				--Vemos si estan en orden X>Y
			loop
				resto:=Xaux mod Yaux;		--Vamos realizando la division hasta que el resto sea 0, momento en el cual nos quedaremos con el valor del ultimo divisor
				Xaux:=Yaux;
				Yaux:=resto;
				exit when Yaux=0 ;	
			end loop;
			return Xaux;				--Retornamos el ultimo divisor
		else 						--Si no esta en orden alternar y realizar los mismos pasos
			loop
				resto:=Yaux mod Xaux;		--Vamos realizando la division hasta que el resto sea 0 momento en el cual nos quedaremos con el valor del ultimo divisor
				Yaux:=Xaux;
				Xaux:=resto;
				exit when Xaux=0 ;	
			end loop;
			return Yaux;				--Retornamos ultimo divisor
		end if;
	end mcd;

end Fracciones;
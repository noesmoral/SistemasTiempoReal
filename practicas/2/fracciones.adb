with Ada.Text_Io; use Ada.Text_Io;
package body Fracciones is

	package Ent_Es is new Ada.Text_Io.Integer_Io(Integer);
	package Enum_Es is new Ada.Text_Io.Enumeration_Io(TMeses);
	package Fix_Es is new Ada.Text_Io.Fixed_Io(TTemp);
	package Real_Es is new Ada.Text_Io.Float_Io(Float);

	--No se si habra que poner esto aqui o al ponerlo luego en el main 
	--u otro sitio valdra y aqui solo habra que usarlo.

	--Vraiables
	F:Fraccion;

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
		AUX:= +(X,AUX1);
		return AUX;
	end "-" ;

	function "*" (X,Y:Fraccion) return Fraccion is
		AUX:Fraccion;
	begin -- "*"
		AUX.Num:=X.Num*Y.Num;
		AUX.Den:=X.Num*Y.Den;
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
		AUX:=*(X,AUX1);
		return AUX;
	end "/" ;

	function "=" (X,Y:Fraccion) return Fraccion is
		
	begin -- "="
		if ((X.Num*Y.Den)==(X.Den*Y.Num)) then
			return true;
		else return false;
		end if;
	end "=";

	--Funciones lectura
	procedure Leer is
		Num:Integer;
		Den:Positive;
	begin -- Leer
		Put ("Introduce el numerador de la  matriz: ");
		Ent_Es.Get(Num);--Interger_Es
		Put ("Introduce el Denominador de la  matriz: ");
		Ent_Es.Get(Den);
		F.Num=Num;
		F.Den=Den;
		--se supone que la F es una variable nueva que tiene que rellenar 
		--pero los procedures no devuelven nada asik nose si sera asi 
		--y supongo que habria que controlar el denominador
	end Leer;

	procedure Escribir is
		
	begin -- Escribir
		Put ("La matriz es: "& F.Num &"/"& F.Den);
		--https://es.wikibooks.org/wiki/Programaci%C3%B3n_en_Ada/Unidades_predefinidas/Ada.Text_IO
		--Lo he mirado por internet y es algo asi de concatenarlo pero habra que probarlo
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

end Fracciones;
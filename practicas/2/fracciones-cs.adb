package body Fracciones is
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
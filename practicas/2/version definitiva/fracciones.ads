package Fracciones is 
type Fraccion is private;

	function "+" (X,Y:Fraccion)return Fraccion;
	function "-" (X:Fraccion)return Fraccion;
	function "-" (X,Y:Fraccion)return Fraccion;
	function "*" (X,Y:Fraccion)return Fraccion;
	function inverso (X:Fraccion)return Fraccion;
	function "/" (X,Y:Fraccion)return Fraccion;
	function "=" (X,Y:Fraccion)return Boolean;

	--Operaciones dde entrada/salida con la consola
	procedure Leer (F: out Fraccion);
	procedure Escribir (F:Fraccion);

	--obtencion del mcd para la reduccion de las fraciones
	function mcd (X,Y: Integer) return Integer;

	--Constructor de numeros fraccionarios a partir de numeros enteros
	function "/" (X,Y:Integer) return Fraccion;

	--Operacciones para obtener las partes de una fraccion
	function Numerador (F:Fraccion) return Integer;
	function Denominador (F:Fraccion) return Positive;

private
	type Fraccion is record
		Num:Integer;
		Den:Positive;
	end record;
end Fracciones;


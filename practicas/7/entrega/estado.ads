with calefactor;use calefactor;
package estado is
	procedure Escribir_Potencia (Potencia: Potencias);
	function Leer_Potencia return Potencias;
	function ha_Terminado return Boolean;
	procedure Terminar;
end estado;
with calefactor;
use calefactor;

package body estado is
	protected condicion is
		procedure Escribir_Potencia (Potencia: Potencias);
		function Leer_Potencia return Potencias;
		function ha_Terminado return Boolean;
		procedure Terminar;
	private
	la_Potencia: Potencias := 0.0;
	Terminado: Boolean := false;
	end condicion;

	protected body condicion is
		procedure Escribir_Potencia (Potencia: Potencias) is
		begin
			la_Potencia := Potencia;
			calefactor.Escribir(Potencia);
		end Escribir_Potencia;

		function Leer_Potencia return Potencias is
		begin
			return la_Potencia;
		end Leer_Potencia;

		function ha_Terminado return Boolean  is
		begin -- ha_Terminado
			return Terminado;
		end ha_Terminado;

		procedure Terminar is
		begin -- Terminar
			Terminado:=true;
		end Terminar;
	end condicion;

	procedure Escribir_Potencia (Potencia: Potencias) is
	begin
		condicion.Escribir_Potencia(Potencia);
	end Escribir_Potencia;

	function Leer_Potencia return Potencias is
	begin
		return condicion.Leer_Potencia;
	end Leer_Potencia;

	function ha_Terminado return Boolean  is
	begin -- ha_Terminado
		return condicion.ha_Terminado;
	end ha_Terminado;

	procedure Terminar is
	begin -- Terminar
		condicion.Terminar;
	end Terminar;
end estado;
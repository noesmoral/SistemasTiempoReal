--with pid;use pid;
package controlador is
	Ts:constant:=1.0;
	function ha_Terminado return Boolean;
	procedure Terminar;
end controlador;
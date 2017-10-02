with sensor, calefactor;
use sensor;

package monitor_textual is
	type Tipo_Dec is delta 0.1 range -25.0..500.0;
	Ts:constant:=1.0;
	function ha_Terminado return Boolean;
	procedure Terminar;
end monitor_textual;
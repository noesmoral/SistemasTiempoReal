with Ada.Real_Time;
use Ada.Real_Time;

package plan is
	
	type ref_Procedimiento is access procedure;
	type array_ref_Procedimiento is array (Positive range <>) of ref_Procedimiento;
	type array_Tiempos is array (Positive range <>) of Natural;
	type reg_Planificacion is record
		Nombre : Positive; -- Número de la tarea
		T : Natural; -- Período
		D : Natural; -- Plazo
		C : Natural; -- Tiempo de cómputo
		P : Positive; -- Prioridad
		R : Natural; -- Tiempo de respuesta
		Planificable: Boolean;
	end record;
	
	procedure Medir (Procedimientos: array_ref_Procedimiento; Tiempos : out array_Tiempos);
	type array_reg_Planificacion is array (Positive range <>) of reg_Planificacion;
	procedure Planificar (Tareas: in out array_reg_Planificacion);
	procedure MedirC(Tareas: in out array_reg_Planificacion);
end plan;





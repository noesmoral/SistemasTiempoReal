with ;
use ;

procedure simular is
	type ref_Procedimiento is access procedure;
	task type Tarea (Nombre : Natural;
		T : Natural;
		D : Natural;
		C : Natural;
		P : Natural;
		Codigo_Ciclico: ref_Procedimiento) is
		pragma Priority (P);
	end Tarea;
	Tarea1: Tarea (1, 2400, 600 , ?, ?, P1’Access);
	Tarea2: Tarea (2, 3200, 1200, ?, ?, P2’Access);
	Tarea3: Tarea (3, 3600, 2000, ?, ?, P3’Access);
	Tarea4: Tarea (4, 4000, 3200, ?, ?, P4’Access);
end simular;



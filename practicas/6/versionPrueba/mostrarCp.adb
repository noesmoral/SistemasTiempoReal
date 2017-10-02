with Ada.Text_Io, proc, plan;
use Ada.Text_Io, proc, plan;

procedure mostrarCp is

	package Integer_Es is new Integer_Io (Integer);
	use Integer_Es;

	Procedimientos: array_ref_Procedimiento := (P1'Access, P2'Access,P3'Access, P4'Access);
	Tiempos: array_Tiempos (Procedimientos'Range);
	Tareas: array_reg_Planificacion := (
	-- -------------------------------------------------
	-- Tarea T D C P R Planificable
	-- -------------------------------------------------
	( 1, 20, 20, 3, 1, 0, False ),
	( 2, 20, 5,  3, 1, 0, False ),
	( 3, 15, 7,  3, 1, 0, False ),
	( 4, 10, 10, 4, 1, 0, False )
	-- -------------------------------------------------
	);

	begin
	MedirC(Tareas, Procedimientos, Tiempos);
	Put_line ("+--------------------------+");
	Put_Line ("| Procedimiento T.computo |");
	Put_line ("|--------------------------|");
	for I in Tiempos'Range loop
		Put (" | ");Put (I, Width=>13); Put (" ");
		Put (Tiempos(I), Width=> 9); Put (" |");
		New_Line;
	end loop;
	Put_line ("+--------------------------+");

	Planificar (Tareas);
	Put_line ("+---------------------------------------------------+");
	Put_Line ("| Tarea     T     D     C     P    R  Planificable|");
	Put_line ("|---------------------------------------------------|");
	for I in Tareas'Range loop
		Put ("| ");
		Put (Tareas(I).Nombre, Width=>5); Put ("  ");
		Put (Tareas(I).T, Width=>4); Put ("  ");
		Put (Tareas(I).D, Width=>4); Put ("  ");
		Put (Tareas(I).C, Width=>4); Put ("  ");
		Put (Tareas(I).P, Width=>4); Put ("  ");
		Put (Tareas(I).R, Width=>4); Put ("  ");
		if Tareas(I).Planificable then
			Put_Line ("          SI |");
		else
			Put_Line ("          NO |");
		end if;
	end loop;
	Put_line ("+---------------------------------------------------+");

end mostrarCp;
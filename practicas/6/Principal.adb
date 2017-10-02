with ;
use ;

procedure Principal is
	Procedimientos: array_ref_Procedimiento := (P1’Access, P2’Access,P3’Access, P4’Access);
	Tiempos: array_Tiempos (Procedimientos’Range);
begin -- Principal
	Medir (Procedimientos, Tiempos);
	Put_line ("+--------------------------+");
	Put_Line ("| Procedimiento T.computo |");
	Put_line ("|--------------------------|");
	for I in Tiempos’Range loop
		Put ("| ");Put (I, Width=>13); Put (" ");
		Put (Tiempos(I), Width=> 9); Put (" |");
		New_Line;
	end loop;
	Put_line ("+--------------------------+");
end Principal;
with Ada.Text_Io,Fracciones;
use Ada.Text_Io,Fracciones;

procedure Prueba is
	package Integer_Es is new Integer_Io(Integer);
	use Integer_Es;
	
	Practica_no_Apta:exception;
	
	procedure Error is
	begin -- Error
		raise Practica_no_Apta;
	end Error;
	
	--Variables
	A:Fraccion:=2/3;
	B:Fraccion:=-9/18;
	P:Fraccion;
begin
	Put("Reduccion de B de -9/18 a -1/2: ");
	if Numerador (B) /= -1 or Denominador (B) /= 2 then
		raise Constraint_Error;
	end if;
	Put(": OK");
	New_Line;
	--Imprimimos la linea que se esta evaluando 
	Put("B = -1/2 ");
	if B /= 1/(-2) then Error; end if;
	Put(": OK");
	New_Line;
	Put("A+B = 1/6");
	if A+B /= 1/6 then Error; end if;
	Put(": OK");
	New_Line;
	Put("-A = -2/3");
	if -A /= -2/3 then Error; end if;
	Put(": OK");
	New_Line;
	Put("A-B = 7/6");
	if A-B /= 7/6 then Error; end if;
	Put(": OK");
	New_Line;
	Put("A*B = -1/3");
	if A*B /= -1/3 then Error; end if;
	Put(": OK");
	New_Line;
	Put("A/B = -4/3");
	if A/B /= -4/3 then Error; end if;	
	Put(": OK");
	New_Line;
	Put("A-B = 7/6");
	if A-B /= 7/6 then Error; end if;
	Put(": OK");
	New_Line;

	P:=1/1;
	for I in 1..10 loop
		P:=P*B;
	end loop;
	if P /= 1/1024 then Error; end if;
	Put_Line("Practica_Apta.");
	
	exception
	when Practica_no_Apta=>
		Put_Line ("Practica_no_Apta:");
	when Constraint_Error =>
		Put_Line ("Practica_no_Apta:");
		Put_Line ("Las fracciones tienen que respresntarse mediante");
		Put_Line ("fraciones irreducibles.");
		Put_Line ("Es necesario reducir las fracciones.");
end Prueba;
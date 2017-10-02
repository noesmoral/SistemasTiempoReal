-- Este programa pretende ilustrar la forma de manejo de las herramientas
-- del entorno de desarrollo en Ada

-- Paquete estándar que vamos a manejar.
with Ada.Text_Io; use Ada.Text_Io;

-- Procedimiento principal.
procedure p2 is 
	-- Creación de ejemplares, para la entrada/salida de números, a partir
	-- de los paquete genéricos "Ada.Text_Io.Integer_Io" y "Ada.Text_Io.Float_Io".
	package Ent_Es is new Ada.Text_Io.Integer_Io(Integer);
	package Nat_Es is new Ada.Text_Io.Integer_Io(Natural);
	package Pos_Es is new Ada.Text_Io.Integer_Io(Positive);
	package Real_Es is new Ada.Text_Io.Float_Io(Float);

--Cuerpo del procedimiento "p2"
begin
	--Entrada/salida de numeros para comprobar sus caracteristicas.
	New_Line;
	Put ("Entero ultimo");
	Ent_Es.Put(Integer'Last);
	New_Line;
	Put ("Entero primero");
	Ent_Es.Put(Integer'First);
	New_Line;
	Put ("Primer natural");
	Nat_Es.Put(Natural'First);
	New_Line;
	Put ("Primer posiivo");
	Pos_Es.Put(Positive'First);
	New_Line;
	Put ("Primer real");
	Real_Es.Put(Float'First);
	New_Line;
	Put ("Ultimo real");
	Real_Es.Put(Float'Last);
end p2;

--Número entero más pequeño: 32 bit -2147483648 
--Número entero más grande: 32 bit 2147483647
--Número natural más pequeño: 31 bit 0
--Número positivo más pequeño: 31 bit 1
--Número de dígitos significativos de los números reales: +3.40282E+38 y -3.40282E+38 por lo que cuenta con 6 digitos significativos
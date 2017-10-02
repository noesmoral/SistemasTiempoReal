-- Este programa pretende ilustrar la forma de manejo de las herramientas
-- del entorno de desarrollo en Ada

-- Paquete estándar que vamos a manejar.
with Ada.Text_Io; use Ada.Text_Io;

-- Procedimiento principal.
procedure numeros is 
	-- Creación de ejemplares, para la entrada/salida de números, a partir
	-- de los paquete genéricos "Ada.Text_Io.Integer_Io" y "Ada.Text_Io.Float_Io".
	package Ent_Es is new Ada.Text_Io.Integer_Io(Integer);
	package Real_Es is new Ada.Text_Io.Float_Io(Float);

	--Declaracion de las variables locales
	I,J:Integer;
	X,Y:Float;

--Cuerpo del procedimiento "Numeros"
begin
	--Entrada/salida de numeros enteros.
	--Lectura de datos
	New_Line;
	Put ("Introduce un numero entero: ");
	Ent_Es.Get(I);
	Put ("Introduce otro numero entero: ");
	Ent_Es.Get(J);
	New_Line;

	--Presentacion de los resultados en el sistema decimal
	Ent_Es.Put(I);
	Put('+');
	Ent_Es.Put(J);
	Put('=');
	Ent_Es.Put(I+J);
	New_Line;

	--Presentacion de los resultados en binario
	--Informacion
	--Base especifica el sistema en el que esta representado un numero (defecto decimal).
	Ent_Es.Put(I,Base=>2);
	Put('+');
	Ent_Es.Put(J,Base=>2);
	Put('=');
	Ent_Es.Put(I+J,Base=>2);
	New_Line;

	--Presentacion de los resultados en hexadecimal
	Ent_Es.Put(I,Base=>16);
	Put('+');
	Ent_Es.Put(J,Base=>16);
	Put('=');
	Ent_Es.Put(I+J,Base=>16);
	New_Line;

	--Presentacion de los resultados con formato
	--Informacion
	--Width especifica el ancho del campo (número de caracteres) utilizado para escribir el número.
	Ent_Es.Put(I);
	Put('+');
	Ent_Es.Put(J,Width=>0);
	Put('=');
	Ent_Es.Put(I+J,Width=>6);
	New_Line;New_Line;

	--Entrada/salida de numeros reales
	--Lectura de los datos
	Put("Introduce un numero real: ");
	Real_Es.Get(X);
	Put("Introduce otro numero real: ");
	Real_Es.Get(Y);
	New_Line;

	--Presentacion de los rresultados 
	Real_Es.Put(X);
	Put('/');
	Real_Es.Put(Y);
	Put('=');
	Real_Es.Put(X/Y);
	New_Line;

	--Presentacion de los datos con formato
	--Informacion:
	--Fore el número de caracteres antes del punto.
	--Aft cuantos dígitos decimales queremos que se muestren.
	--Exp cuantos dígitos dejamos para exponente en notación científica.
	Real_Es.Put(X,Fore=>2,Aft=>2,Exp=>3);
	Put('/');
	Real_Es.Put(Y,Fore=>0,Aft=>0,Exp=>0);
	Put('=');
	Real_Es.Put(X/Y,Fore=>10,Aft=>4,Exp=>0);
	New_Line;
	New_Line;
end numeros;
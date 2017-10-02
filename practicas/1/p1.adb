-- Este programa pretende ilustrar la forma de manejo de las herramientas
-- del entorno de desarrollo en Ada

-- Paquete estándar que vamos a manejar.
with Ada.Text_Io; use Ada.Text_Io;

-- Procedimiento principal.
procedure p1 is 

	--Enumeracion para los meses solo puede ser un valor de la lista
	type TMeses is (enero,febrero,marzo,abril,mayo,junio,julio,agosto,septiembre,octubre,noviembre,diciembre);

	--Valores para los rangos de temperatura con incrementos de 0.01 y rango
	type TTemp is delta 0.01 range -25.0..75.0;

	--Registro Fecha usa para el mes el tipo TMeses
	type T_RegFecha is
	record
	  Dia 	: Natural range 1..31;
	  Mes   : TMeses;
	  Anio	: Natural range 1900..2100;
	end record;

	--Registro que ademas usa el registro de fecha para esta y el especifico para la temperatura
	type T_Reg is
	record
  		Fecha : T_RegFecha;
  		Temperatura   : TTemp;
	end record;

	--Array de registro TReg sin limitaciones de tamaño (ES POSIBLE QUE EN VEZ DE NATURAL SEA FECHA O T_RegFecha)
	type Array_Fechas is array (integer range <>) of T_Reg;

	-- Creación de ejemplares, para la entrada/salida de números, a partir
	-- de los paquete genéricos "Ada.Text_Io.Integer_Io" ,"Ada.Text_Io.Enumeration_Io" "Ada.Text_Io.Float_Io" y "Ada.Text_Io.Fixed_Io"
	package Ent_Es is new Ada.Text_Io.Integer_Io(Integer);
	package Enum_Es is new Ada.Text_Io.Enumeration_Io(TMeses);
	package Fix_Es is new Ada.Text_Io.Fixed_Io(TTemp);
	package Real_Es is new Ada.Text_Io.Float_Io(Float);

	--Declaracion de las variables locales 
	D,A,N,MinT,MaxT:Integer; 
	M:TMeses; 
	Min,Max,T:TTemp; 
	registro:T_Reg; 
	Almacenado:Array_Fechas(1..N); 
	Media:Float; 
	FechMin,FechMax:T_RegFecha;

--Cuerpo del procedimiento principal
begin
	--Lectura de datos referente al numero de datos que tiene el array de registros repite hasta que el valor sea mayor que 0
	loop
		New_Line;
		Put ("Inserte el numero de elementos del array: ");
		Ent_Es.Get(N);
		New_Line;
		exit when N>0;
		Put ("Numero invalido necesario ser un numero positivo mayor que 0");
	end loop;

	--Inicializacion de las variables para los limites y media de las temperaturas
	Min:=75.0;
	Max:=-25.0;
	Media:=0.0;

	--Inicializamos las fechas maximas y minimas para comprar usando FechMax con el valor min y FechMin con el valor maximo
	FechMax.Dia:=1;
	FechMax.Mes:=enero;
	FechMax.Anio:=1900;
	FechMin.Dia:=31;
	FechMin.Mes:=diciembre;
	FechMin.Anio:=2100;

	--Bulce for en el que se asignan valores a los campos del registro y ese registro copiado en el array repitiendose tantas veces como N insertado antes
	for C in 1..N loop
		New_Line;
		Put ("Introduce valor temperatura (-25.0 a 75.0): ");
		Fix_Es.Get(T);
		registro.Temperatura:=T;
		Put ("Introduce dia (1-31): ");
		Ent_Es.Get(D);
		registro.Fecha.Dia:=D;
		Put ("Introduce mes (enero,febrero,marzo,abril,mayo,junio,julio,agosto,septiembre,octubre,noviembre,diciembre): ");
		Enum_Es.Get(M);
		registro.Fecha.Mes:=M;
		Put ("Introduce año (1900-2100): ");
		Ent_Es.Get(A);
		registro.Fecha.Anio:=A;
		Almacenado(C):=registro;
		New_Line;
	end loop;

	--Calculamos cuales son los elementos del array con menor y mayor temp y la media de todas las fechas
	for C in 1..N loop

		--Calculamos las temperaturas maximas y minimas
		if Almacenado(C).Temperatura < Min then
			Min:=Almacenado(C).Temperatura;
			MinT:=C;
		end if;

		if Almacenado(C).Temperatura > Max then
			Max:=Almacenado(C).Temperatura;
			MaxT:=C;
		end if;
		
		--Calculamos las fechas limite superior e inferior para saber el rango
		if Almacenado(C).Fecha.Anio < FechMin.Anio then
			FechMin:=Almacenado(C).Fecha;
		else 
			if Almacenado(C).Fecha.Anio = FechMin.Anio and Almacenado(C).Fecha.Mes <= FechMin.Mes then
				FechMin:=Almacenado(C).Fecha;
			else
				if Almacenado(C).Fecha.Anio = FechMin.Anio and Almacenado(C).Fecha.Mes = FechMin.Mes and Almacenado(C).Fecha.Dia < FechMin.Dia then
					FechMin:=Almacenado(C).Fecha;
				end if;
			end if;
		end if;

		if Almacenado(C).Fecha.Anio > FechMax.Anio then
			FechMax:=Almacenado(C).Fecha;
		else 
			if Almacenado(C).Fecha.Anio = FechMax.Anio and Almacenado(C).Fecha.Mes > FechMax.Mes then
			 	FechMax:=Almacenado(C).Fecha;
			else	
				if Almacenado(C).Fecha.Anio = FechMax.Anio and Almacenado(C).Fecha.Mes > FechMax.Mes and Almacenado(C).Fecha.Dia  > FechMax.Dia  then
					FechMax:=Almacenado(C).Fecha;
				end if;
			end if;			
		end if;

		--Calculamos la temperatura media
		Media:=Media+Float(Almacenado(C).Temperatura);
	end loop;

	--Muestra el elemento con mayor temperatura
	Put ("Temperatura máxima: ");
	Fix_Es.Put(Almacenado(MaxT).Temperatura);
	Put (" grados, alcalzada el ");
	Ent_Es.Put(Almacenado(MaxT).Fecha.Dia);
	Put (" de ");
	Enum_Es.Put(Almacenado(MaxT).Fecha.Mes);
	Put (" de ");
	Ent_Es.Put(Almacenado(MaxT).Fecha.Anio);
	New_Line;

	--Muestra el elemento con mayor temperatura
	Put ("Temperatura minima: ");
	Fix_Es.Put(Almacenado(MinT).Temperatura);
	Put (" grados, alcalzada el ");
	Ent_Es.Put(Almacenado(MinT).Fecha.Dia);
	Put (" de ");
	Enum_Es.Put(Almacenado(MinT).Fecha.Mes);
	Put (" de ");
	Ent_Es.Put(Almacenado(MinT).Fecha.Anio);
	New_Line;

	--Mostramos la media total con las fechas limite
	Put ("Temperatura media: ");
	Media:=Media/Float(N);
	Real_Es.Put(Media,Fore=>2,Aft=>2,Exp=>0);
	Put (" grados en el intervalo desde el dia ");
	Ent_Es.Put(FechMin.Dia);
	Put (" de ");
	Enum_Es.Put(FechMin.Mes);
	Put (" del ");
	Ent_Es.Put(FechMin.Anio);
	Put (" hasta el dia ");
	Ent_Es.Put(FechMax.Dia);
	Put (" de ");
	Enum_Es.Put(FechMax.Mes);
	Put (" del ");
	Ent_Es.Put(FechMax.Anio);

end p1;
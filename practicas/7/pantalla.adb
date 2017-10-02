with Ada.Text_Io, Ansi; use Ada.Text_Io, Ansi;

package body pantalla is
	protected pantallazo is
		procedure Borrar;
		procedure Escribir (Cadena: String; Fila: Filas; Columna: Columnas);
	private
		la_Columna:Columnas:=0;
		la_Fila:Filas:=0;
	end pantallazo;

	protected body pantallazo is
		procedure Borrar is
		begin -- Borrar
			Ansi.Borrar_Pantalla;
		end Borrar;

		procedure Escribir(Cadena: String; Fila: Filas; Columna: Columnas) is
		begin -- Escribir
			--recortar la caddena para que entre en una linea
			Poner_Cursor(Fila,Columna);
			--Escribir+Recortar texto maximo 78 caracteres
			for I in 1..Cadena'length loop
				Put(Cadena(I));
			end loop;
		end Escribir;
	end pantallazo;

	procedure Borrar is
	begin -- Borrar
		pantallazo.Borrar;
	end Borrar;

	procedure Escribir (Cadena: String; Fila: Filas; Columna: Columnas) is
	begin -- Escribir
		pantallazo.Escribir(Cadena, Fila, Columna);
	end Escribir;
end pantalla;
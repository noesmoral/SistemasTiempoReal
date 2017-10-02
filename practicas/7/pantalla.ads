package pantalla is
	subtype Filas is Natural range 0..24;
	subtype Columnas is Natural range 0..78;
	procedure Borrar;
	procedure Escribir (Cadena: String; Fila: Filas; Columna: Columnas);
end pantalla;
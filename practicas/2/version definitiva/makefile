#compilador enlazador general
all:
	gcc-4.8 -c prueba.adb
	gcc-4.8 -c fracciones.adb
	gnatbind -x prueba.ali
	gnatlink prueba.ali

#Borra todos los archivos intermedios y el ejecutable
clean:
	rm -rf *.o *.ali prueba p2;

#La orden para compilar es gcc
#Ejemplo	$ gcc -c numeros.adb; 
#Esto genera los ficheros intermedios: numeros.ali y numeros.o
#El parámetro -c le indica a gcc que compile pero no enlace.
#numeros.o es el fichero objeto.
#numeros.ali contiene información sobre las relaciones que hay entre las distintas unidades de compilación (dependencias entre unidades).

#La orden para encuadernar es gnatbind
#Ejemplo 	$ gnatbind -x numeros.ali
#Esto genera el fichero intermedio B_numeros.c.
#B_numeros.c contiene las llamadas necesarias a los procedimientos de el aboración. Al final de B_numeros.c aparece una lista de ficheros objeto dependientes entre sí.
#El parámetro -x le indica a gnatbind que verifique sólo la consistencia de los objetos sin tener en cuenta los ficheros fuente.

#La orden para enlazar es gnatlink
#Ejemplo	$ gnatlink -o numeros numeros.ali
#Esto genera el fichero ejecutable numeros.
#gnatlink compila B_numeros.c y enlaza el fichero objeto B_numeros.o con el resto de ficheros enumerados en el fichero de encuadernación (B_numeros.c).
#Después de enlazar, los ficheros B_numeros.c y B_numeros.o son borrados.
#El enlazado se completa llamando a gcc y pasándole los ficheros objeto y las bibliotecas necesarias para crear el fichero ejecutable resultante.

#Version alternativa al makefile
# $ gnatmake nombre.adb o $ gnatmake numeros

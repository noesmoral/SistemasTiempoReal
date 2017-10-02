with Ada.Unchecked_Deallocation;

package body Colas is
	
	procedure Poner (el_Elemento:Elementos; en_la_Cola:in out Cola) is
		Aux:ref_Nodo;
	begin -- Poner
		Aux:= new Nodo'(el_Elemento,NULL);  --inicializamos el nuevo nodo creado y referenciado por aux con los elementos
		if Esta_Vacia(en_la_Cola) then		--en caso de que se encuentre vacia metemo el primero
			en_la_Cola.ptr_Primero:=Aux;	--reasignamos los access
		else 								--en caso de que no sea el primero simplemente añadimos
			en_la_Cola.ptr_Ultimo.ptr_Siguiente:=Aux;
		end if;							
		en_la_Cola.ptr_Ultimo:=Aux;
	end Poner;

	procedure Quitar (un_Elemento: out Elementos; de_la_Cola: in out Cola) is
		ptr_aux:ref_Nodo;
	procedure Liberar is new Ada.Unchecked_Deallocation(Nodo, ref_Nodo);
	begin -- Quitar
		if not Esta_Vacia(de_la_Cola) then		--si esta no esta vacia podemos sacar en caso contrario paramos porque no hay nada que sacar
			ptr_aux:=de_la_Cola.ptr_Primero;	--obtenemos el nodo que queremos eliminar como es una cola sera el primero
			de_la_Cola.ptr_Primero:=de_la_Cola.ptr_Primero.ptr_Siguiente;	--actualizamos el acces primero
			un_Elemento:=ptr_aux.Datos;			--sacamos el valor antes de eliminarlo
			if de_la_Cola.ptr_Primero = NULL then--en caso de que al eliminar quede vacia actualizar ultimo
				de_la_Cola.ptr_Ultimo:=NULL;
			end if;
			ptr_aux.ptr_Siguiente:=NULL;
			Liberar(ptr_aux);					--eliminamos el nodo
		end if;
	end Quitar;

	function Esta_Vacia (La_Cola:Cola) return Boolean is
	begin -- Esta_Vacia
		if La_Cola.ptr_Primero=NULL then	--Pensamos que se inicializa a null directamente
			return true;					--si esta vacia el puntero a primero no apuntara a nada entonces esta vacia
		else 								--en el otro caso 
			return false;					--retrun fasle por que no estara vacia tendra almenos un elemento
		end if;
	end Esta_Vacia;

	function Esta_Llena (La_Cola:Cola) return Boolean is	--Entendemos que tiene
	begin -- Esta_Llena
		return false;						--se llego a un consenso con el profesor de que al ser del tipo dinamico nunca estara llena
	end Esta_Llena;

	procedure Copiar (Origen:Cola; Destino:in out Cola) is
		E:Elementos;
		ptr_continuar:ref_Nodo;
	begin -- Copiar
		if not Esta_Vacia(Origen) then						--si no esta vacia la de origen procedemos y en caso contrario no hay nada que copiar por lo que no hacemos nada 
			while not Esta_Vacia(Destino) loop 				--primero vaciamos la cola destino completamente 
				Quitar(E,Destino);							--vamos retirando los elementos
			end loop;
			ptr_continuar:=Origen.ptr_Primero;				--inicializamos el aux en el primero de los elementos a copiar
			while ptr_continuar/=NULL loop 					--recorremos completamente la cola a copiar hasta que ya no tengamos mas elementos
				Poner(ptr_continuar.Datos,Destino);			--ponemos uno nuevo con la informacion del otro
				ptr_continuar:=ptr_continuar.ptr_Siguiente;	--avanzamos hasta el siguiente con el aux
			end loop;
		end if;	
	end Copiar;

	function "=" (La_Cola,Con_La_Cola:Cola) return Boolean is
		aux1,aux2:Elementos;
		cola1,cola2:Cola;
	begin -- "="
		Copiar(La_Cola,cola1);								--copiamos las colas para poder operar sin perder la informaion
		Copiar(Con_La_Cola,cola2);
		while not Esta_Vacia(cola1) and not Esta_Vacia(cola2) loop --realizamos la comparacion hasta el final
			Quitar(aux1,cola1);								--se van eliminado elementos
			Quitar(aux2,cola2);
				if aux1/=aux2 then 							--si en algun momeno son distintos false
					return false;
				end if;
		end loop;
		
		if Esta_Vacia(cola1) and Esta_Vacia(cola2) then 	--en caso de llegar al final de las dos sin elementos distintos
			return true;									--true
		else 												--si por el contrario una termian y la otra no 
			return false;									--false
		end if;
	end "=";

	
end Colas;
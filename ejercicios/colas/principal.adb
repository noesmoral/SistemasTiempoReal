with Ada.Text_Io, Colas;

procedure Principal is
   la_Cola: Colas.Cola;
   el_Elemento: Integer;
   otra_Cola: Colas.Cola;
   suma_Cola: Colas.Cola;

   begin
      for I in 1..10 loop
         if not Colas.Está_Llena (la_Cola) then
            Colas.Poner (I, la_Cola);
         end if;
      end loop;

      declare 
        use Colas; -- Aligera la escritura
        package Integer_Es is new
                  Ada.Text_Io.Integer_Io (Integer);
	use Integer_Es;
		  
      begin
          if la_Cola/=otra_Cola then
	    Ada.Text_Io.Put("Son distintas");
          else
	    Ada.Text_Io.Put("Son iguales");
          end if;
	  Ada.Text_Io.New_Line; 
	  Ada.Text_Io.New_Line;

	  otra_Cola:=la_Cola;

	  if la_Cola/=otra_Cola then
	    Ada.Text_Io.Put("Son distintas");
          else
	    Ada.Text_Io.Put("Son iguales");
          end if;
	  Ada.Text_Io.New_Line; 
	  Ada.Text_Io.New_Line;

  	  suma_Cola:=otra_Cola;

	  suma_Cola.Elementos(8) := la_Cola.Elementos(7) + otra_Cola.Elementos(4);

	  while not Está_Vacía (la_Cola) loop
		Quitar (el_Elemento, la_Cola);
		Put (el_Elemento);
		Ada.Text_Io.New_Line;
	  end loop;

	  while not Está_Vacía (otra_Cola) loop
		Quitar (el_Elemento, otra_Cola);
		Put (el_Elemento);
		Ada.Text_Io.New_Line;
	  end loop;

	  while not Está_Vacía (suma_Cola) loop
		Quitar (el_Elemento, suma_Cola);
		Put (el_Elemento);
		Ada.Text_Io.New_Line;
	  end loop;
      end;
end Principal;
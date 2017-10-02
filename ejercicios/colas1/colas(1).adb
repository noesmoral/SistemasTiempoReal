package body Colas is
   procedure Poner (el_Elemento: Integer;
                     en_la_Cola: in out Cola) is
      C: Cola renames en_la_Cola; -- Se renombra para reducir
                                  -- la escritura                  
   begin
      C.Elementos (C.Último) := el_Elemento;
      C.Último := (C.Último+1) mod Tamaño;
      C.Número_de_Elementos := C.Número_de_Elementos + 1;
   end Poner;

   procedure Quitar (un_Elemento: out Integer;
                      de_la_Cola: in out Cola) is separate;

   function Está_Vacía (la_Cola: Cola) return Boolean is
   begin
      return la_Cola.Número_de_Elementos = 0;
   end Está_Vacía;

   function Está_Llena (la_Cola: Cola) return Boolean is
   begin
      return la_Cola.Número_de_Elementos = Tamaño;
   end Está_Llena;

   -- Operaciones necesarias por ser el tipo privado limitado
   procedure Copiar (Origen: Cola; Destino: in out Cola) is
   begin
      Destino := Origen;
   end Copiar;
   function "=" (la_Cola, con_la_Cola: Cola) return Boolean is
      P1, P2: Índice;
   begin
      if la_Cola.Número_de_Elementos /=
         con_la_Cola.Número_de_Elementos then
         return False;
      end if;
      P1 := la_Cola.Primero;
      P2 := con_la_Cola.Primero;
      while P1 /= la_Cola.Último loop
         if la_Cola.Elementos(P1) /=
            con_la_Cola.Elementos(P2) then
            return False;
         else
            P1 := (P1 + 1) mod Tamaño;
            P2 := (P2 + 1) mod Tamaño;
         end if;
      end loop;
      return la_Cola.Elementos(P1) =
             con_la_Cola.Elementos(P2);
   end "=";
end Colas;
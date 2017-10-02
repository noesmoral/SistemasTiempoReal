package body Colas is
   -- Implementaci�n de las operaciones
   procedure Poner (el_Elemento: Integer;
                     en_la_Cola: in out Cola) is
      C: Cola renames en_la_Cola; -- Se renombra para reducir
                                  -- la escritura                  
   begin
      C.Elementos (C.�ltimo) := el_Elemento;
      C.�ltimo := (C.�ltimo+1) mod Tama�o;
      -- if C.�ltimo = �ndice'Last then    
      --    C.�ltimo := �ndice'First;
      -- else
      --   C.�ltimo := C.�ltimo + 1;
      -- end if;
      C.N�mero_de_Elementos := C.N�mero_de_Elementos + 1;
   end Poner;

   procedure Quitar (un_Elemento: out Integer;
                      de_la_Cola: in out Cola) is
      C: Cola renames de_la_Cola; -- Se renombra para reducir
                                  -- la escritura                  
   begin
      un_Elemento := C.Elementos (C.Primero);
      C.Primero := (C.Primero + 1) mod Tama�o;
      C.N�mero_de_Elementos := C.N�mero_de_Elementos - 1;
   end Quitar;

   function Est�_Vac�a (la_Cola: Cola) return Boolean is
   begin
      return la_Cola.N�mero_de_Elementos = 0;
   end Est�_Vac�a;

   function Est�_Llena (la_Cola: Cola) return Boolean is
   begin
      return la_Cola.N�mero_de_Elementos = Tama�o;
   end Est�_Llena;
end Colas;
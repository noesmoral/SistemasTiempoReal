separate (Colas)
procedure Quitar (un_Elemento: out Integer;
                   de_la_Cola: in out Cola) is
   C: Cola renames de_la_Cola; -- Se renombra para reducir
                               -- la escritura                  
begin
   un_Elemento := C.Elementos (C.Primero);
   C.Primero := (C.Primero + 1) mod Tama�o;
   C.N�mero_de_Elementos := C.N�mero_de_Elementos - 1;
end Quitar;
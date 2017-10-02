with Ada.Real_Time; use Ada.Real_Time;
package body Retardadores is
   type array_Elementos is array (1..Tama�o) of Elementos;

   protected L�nea_de_Retardo is
      procedure Escribir (el_Elemento: Elementos);
      procedure Leer (un_Elemento: out Elementos);
      procedure Desplazar;
   private
      L�nea: array_Elementos;
      Entrada, Salida: Elementos;
   end L�nea_de_Retardo;
   protected body L�nea_de_Retardo is
      procedure Escribir (el_Elemento: Elementos) is
      begin
         Entrada := el_Elemento;
      end Escribir;
      procedure Leer (un_Elemento: out Elementos) is
      begin
         un_Elemento := Salida;
      end Leer;
      procedure Desplazar is
      begin
         Salida := L�nea (L�nea'Last);
         L�nea (L�nea'First+1..L�nea'Last) :=
                          L�nea (L�nea'First..L�nea'Last-1);
         L�nea (L�nea'First) := Entrada;
      end Desplazar;
   end L�nea_de_Retardo;

   task Centinela;
   task body Centinela is
      Periodo: constant Time_Span :=
          To_Time_Span (Duration(Retardo)/Duration(Tama�o));
      Instante_Siguiente: Time := Clock;
   begin
      loop
         delay until Instante_Siguiente;
         L�nea_de_Retardo.Desplazar;
         Instante_Siguiente := Instante_Siguiente + Periodo;
      end loop;
   end Centinela;

   procedure Escribir (el_Elemento: Elementos) is
   begin
      L�nea_de_Retardo.Escribir (el_Elemento);
   end Escribir;
   procedure Leer (un_Elemento: out Elementos) is
   begin
      L�nea_de_Retardo.Leer (un_Elemento);
   end Leer;
   procedure Parar is
   begin
      abort Centinela;
   end Parar;
end Retardadores;
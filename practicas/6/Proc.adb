package body Proc is
   
   	procedure P1 is
   		Esperar:Time;
   		periodo:Constant Time_Span:=To_Time_Span(Duration(0,4));
   	begin -- P1
   		Esperar:= Clock;
   		delay until Esperar+periodo; 
   	end P1;

   	procedure P2 is
   		Esperar:Time;
   		periodo:Constant Time_Span:=To_Time_Span(Duration(0,6));
   	begin -- P2
   		Esperar:= Clock;
   		delay until Esperar+periodo;
   	end P2;

   	procedure P3 is
   		Esperar:Time;
   		periodo:Constant Time_Span:=To_Time_Span(Duration(0,8));
   	begin -- P3
   		Esperar:= Clock;
   		delay until Esperar+periodo;
   	end P3;

   	procedure P4 is
   		Esperar:Time;
   		periodo:Constant Time_Span:=To_Time_Span(Duration(0,8));
	begin -- P4
		Esperar:= Clock;
		delay until Esperar+periodo;
   	end P4;

end Proc;
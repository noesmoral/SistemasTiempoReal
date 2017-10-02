% Control de un horno
% Presentación de los datos producidos por el controlador PID
% Temp_Ref = 250 ºC
% Temperatura ambiente = 25 ºC
%

load s04 % "s04" ha sido generado por control del horno con un
         % retardo de 0,4 s.
% Presentación de la temperatura
subplot (3,2,1);
plot ([1:900], s04(:,1));
title ('Control PID. Retardo = 0,4 s.');
xlabel ('t [s]');
ylabel ('T [ºC]');

% Presentación de la potencia
subplot (3,2,2);
plot ([1:900], s04(:,2));
xlabel ('t [s]');
ylabel ('P [W]');

load s08
% Presentación de la temperatura
subplot (3,2,3);
plot ([1:900], s08(:,1));
title ('Control PID. Retardo = 0,8 s.');
xlabel ('t [s]');
ylabel ('T [ºC]');

% Presentación de la potencia
subplot (3,2,4);
plot ([1:900], s08(:,2));
xlabel ('t [s]');
ylabel ('P [W]');

load s12
% Presentación de la temperatura
subplot (3,2,5);
plot ([1:900], s12(:,1));
title ('Control PID. Retardo = 1,2 s.');
xlabel ('t [s]');
ylabel ('T [ºC]');

% Presentación de la potencia
subplot (3,2,6);
plot ([1:900], s12(:,2));
xlabel ('t [s]');
ylabel ('P [W]');
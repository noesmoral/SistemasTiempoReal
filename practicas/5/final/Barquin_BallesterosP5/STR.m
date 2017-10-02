A = importdata('100')
A=A'
B = importdata('200')
B=B'
x=0:2:601
hold on
plot(x,A,'r')
plot(x,B,'b')
hold off
legend('100','200')
title('Temeratura Horno')
xlabel('t')
ylabel('Temperatura')
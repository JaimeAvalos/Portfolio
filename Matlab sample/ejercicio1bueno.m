
clear all
close all

%Jaime Ávalos Mongil

%%Ejercicio 1

% Un objeto de masa m es lanzado desde una altura h con una velocidad v formando un ángulo
% a con la horizontal. Como consecuencia de su movimiento en un campo gravitatorio (suponer
% que la aceleración de la gravedad sólo tiene componente y ) cae, y sufre una serie de rebotes
% hasta que se detiene. En cada choque contra el suelo pierde una fracción f de su energía.

% Escribir un programa que calcule y represente la trayectoria del objeto (incluyendo rebotes).
% Deben ser variables a introducir por el usuario: la masa, la altura la velocidad inicial
% y su ángulo con la horizontal, la fracción de la energía perdida en cada bote.


%%

% Caso 1: m=1 kg; h=10 m; v=10 m/s; a =60º; f = 0.10 Hz

M = 1;%Kg
h = 10;%metros
v = 10;%m/s
a = 60;%grados
f = 0.10;%fraccion de la energia perdida en cada rebote

alpha(1)=angrad(a);
x0=0;
t=0:0.01:276;
g=9.8;

k=5;%número de veces que se va a repetir el bucle es decir, número de botes

for i=1:k

vy(i)=v(i)*sin(abs(alpha(i)));
vx(i)=v(i)*cos(abs(alpha(i)));

y=h+vy(i)*t-(0.5)*g*t.^2;
x=vx(i)*t;

Y=y>0;%con este comando eliminamos las posiciones negativas
y=y.*Y;%con este transformamos la posiciones negativas en positivas

[d,n]=min(y(2:end));
y=y(1:n);
XX1=sum(x0);
x=x(1:n);

figure(1)
plot(XX1+x,y)
xlabel('posición x(m)')
ylabel('posición y(m)')
legend('trayectoria')
title('Trayectoria para el caso 1')

vyy=vy(1)-g*t(n);
V=sqrt(vyy^2 + vx(1)^2);
alpha(i+1)=asin(vyy/V);
Ec(1)=(0.5*M*V^2);Ec(i+1)=Ec(i)-Ec(i)*f;
v(i+1)=sqrt((2*Ec(i+1))/M);
x0(i+1)=x(end);
h=0;
hold on

Ep=M*g*(h+vy(i)*t-(0.5)*g*t.^2);
Et=Ec(i)+Ep(i);
figure(2)
plot(t,Et)
xlabel('tiempo(s)')
ylabel('Energia(J)')
title('Energia total para el caso 1')

end

disp(['La distancia desde el origen al 5º bote es para el caso 1:',num2str(XX1)])

% Caso 2: m=1 kg; h=10 m; v=10 m/s; a =80º; f = 0.20.

M = 1;%Kg
h = 10;%metros
v = 10;%m/s
a = 80;%grados
f = 0.20;%fraccion de la energia perdida en cada rebote

alpha(1)=angrad(a);
x0=0;
t=0:0.01:276;
g=9.8;

k=5;

for i=1:k

vy(i)=v(i)*sin(abs(alpha(i)));
vx(i)=v(i)*cos(abs(alpha(i)));

y=h+vy(i)*t-(0.5)*g*t.^2;
x=vx(i)*t;

Y=y>0;%con este comando eliminamos las posiciones negativas
y=y.*Y;%con este transformamos la posiciones negativas en positivas

[d,n]=min(y(2:end));
y=y(1:n);
XX2=sum(x0);
x=x(1:n);

figure(3)
plot(XX2+x,y)
xlabel('posición x(m)')
ylabel('posición y(m)')
legend('trayectoria')
title('Trayectoria para el caso 2')

vyy=vy(1)-g*t(n);
V=sqrt(vyy^2 + vx(1)^2);
alpha(i+1)=asin(vyy/V);

Ec(1)=(0.5*M*V.^2);
Ec(i+1)=Ec(i)-Ec(i)*f;
v(i+1)=sqrt((2*Ec(i+1))/M);
x0(i+1)=x(end);
h=0;
hold on

Ep(i)=M*g*(h+vy(i)*t-(0.5)*g*t.^2);
Ec(i+1)=0.5*M*v(i+1).^2;
Et=Ec(i)+Ep(i);
figure(4)
plot(t,Et)
xlabel('tiempo(s)')
ylabel('Energia(J)')
title('Energia total para el caso 2')

end

disp(['La distancia desde el origen al 5º bote es para el caso 2:',num2str(XX2)])




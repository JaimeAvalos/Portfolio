

close all
clear all

%Jaime Ávalos Mongil

%%Ejercicio 2

load('DataEje2PryA.mat');
        
dt=pos(:,1);
dz=pos(:,2);

m=1;%masa del objeto en kilos

%%

% 1. Escribir un script que haga lo siguiente: representar z frente al tiempo t,
% obtener la amplitud de las oscilaciones y su periodo, frecuencia, constante elástica
% del muelle, y estimar la precisión con la que se obtienen dichos valores.

figure(1)
plot(dt,dz,'o')
xlabel('tiempo(s)')
ylabel('posición(m)')
title('Representación Gráfica de los Datos')
grid on

T=1.013;%periodo en segundos

f=1/T;%frecuencia en Hz

A=1.35;%amplitud en metros

w=2*pi/T;

%w=sqrt(k/m)
k=(w.^2)*m;

disp('La amplitud de las oscilaciones es:')
disp(A)
disp('metros')
disp('y su error es de +-0.2 metros')
disp('El periodo de las ocilaciones es:')
disp(T)
disp('segundos')
disp('La frecuencia de las ocilaciones es:')
disp(f)
disp('Hz')
disp('La constante elastica del muelle es:')
disp(k)
disp('Newtons partido de metros')

%%

% 2. Estimar gráficamente el valor de la constante de amortiguamiento g .
% Empezar con g = 0 y g = 1/T.

g1=0;
g2=1/T;

t=0:0.1:8;

z1=A.*exp(-g1*t).*cos(w.*t);
z2=A.*exp(-g2*t).*cos(w.*t);

figure(2)
plot(t,z1,'-*',t,z2,'-*',dt,dz,'o')
xlabel('tiempo(s)')
ylabel('posición(m)')
title('Posición del muelle para g=0 y g=1/T')
legend('curva para g=0','curva para g=1/T','datos' )

%%

% 3. Obtener dicha constante de amortiguamiento ajustando los valores experimentales.

g=0.1;

Z=A.*exp(-g*t).*cos(w.*t);

figure(3)
plot(t,Z,dt,dz,'*')
xlabel('tiempo(s)')
ylabel('posición(m)')
title('Aproximacion de la Constante de Amortiguamiento')
legend('curva para g=0.1','datos' )



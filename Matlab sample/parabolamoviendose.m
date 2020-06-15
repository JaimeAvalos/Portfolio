%% Ejercicio 7:
% 
% Con las ecuaciones del tiro parabólico, 
% pintar  [Y de X] para unas determinadas condiciones iniciales: ángulo, v_ini, etc.
% 
% Y dibujar la trayectoria, y el "proyectil" moviéndose por ella, paso a paso
%
%%

% condiciones iniciales

ang = 35; % en grados. Lo tendré que pasar a radianes para usarlo en sen y cos.
vini= 10;  % módulo de v inicial (m/s).  ¡ojo a las unidades!

% resto de condiciones iniciales y parámetros: acel=g, y posición inicial

g=9.8;
x0=0; y0=0;
% saco ángulo en rad,  y  vini_x y vini_y;
angr= ang * pi/180;
v0x=vini*cos(angr);
v0y=vini*sin(angr);

% creo el "vector" del tiempo, y luego sacaré x(t) e y(t)  de las "fórmulas" conocidas

% tiempo total que voy a calcular (s)
ttot= 1.1;  
% pero puedo estimar el tiempo total = 2 x tiempo que tarda en llegar
% arriba del todo (donde vy se hace cero)
tsubir= v0y/g;  
ttot= 2*tsubir;

npt = 100; % número de ptos que quiero tener del vector tiempo 

t = (ttot/npt)*(0:1:npt);

% saco x(t) e y(t)

x=x0+v0x*t;
y=y0+v0y*t+(1/2)*(-g)*(t.^2);

% y lo pinto

figure(1)
plot(x,y);

title('Ejercicio 2: tiro parabólico');
xlabel('x (m)');
ylabel('y (m)');
legend('y(x)');

% para mantener las proporciones de los 2 ejes
% axis equal;


%%

% dibujar la trayectoria, y el "proyectil" moviéndose por ella

figure(2)
for i=1:npt
    plot(x,y)
% title('Ejercicio 2: tiro parabólico');
% xlabel('x (m)');
% ylabel('y (m)');
% legend('y(x)');
    hold all;
    plot(x(i),y(i),'ro')
    hold off
    pause(0.01)
end;
    
title('Ejercicio 2: tiro parabólico');
xlabel('x (m)');
ylabel('y (m)');
legend('y(x)');

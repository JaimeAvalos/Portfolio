%% Ejercicio 3_1: 
% El eje7.m consistía en:
% Con las ecuaciones del tiro parabólico, 
% pintar  [Y de X] para unas determinadas condiciones iniciales: ángulo, v_ini, etc.
% 
% Y dibujar la trayectoria, y el "proyectil" moviéndose por ella, paso a paso
%
% Ahora, obtendremos la trayectoria del proyectil integrando las ecuaciones
% del movimiento por el método de Euler (evaluando las nuevas posición y velocidad 
% para cada incremento de tiempo)
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
    hold all;
    plot(x(i),y(i),'ro')
    hold off
    pause(0.01)
end;
    
title('Ejercicio 7: tiro parabólico');
xlabel('x (m)');
ylabel('y (m)');
legend('y(x)');

%%

% dibujar la trayectoria, y el "proyectil" moviéndose por ella

figure(3)
plot(x,y)
title('Ejercicio 7: tiro parabólico');
xlabel('x (m)');
ylabel('y (m)');
legend('y(x)');
    hold all;
  hp=plot(x(1),y(1),'ro');  hold off  
for i=1:npt
    set(hp,'xdata',x(i),'ydata',y(i));
    pause(0.01)
end;
 

%%  Esto es lo nuevo:

% calcularemos mientras el proyectil no toque el suelo (y>0)
% posición = velocidad * tiempo
% velocidad = aceleración * tiempo
% aceleración = Fuerza / masa  (ley de Newton)
% Caso A: La única fuerza es debida al peso


% condiciones iniciales

ang = 35; % en grados. Lo tendré que pasar a radianes para usarlo en sen y cos.
vini= 10;  % módulo de v inicial (m/s).  ¡ojo a las unidades!

% resto de condiciones iniciales y parámetros: acel=g, y posición inicial

g=9.8;
x0=0; y0=0; tiempo=0;
% saco ángulo en rad,  y  vini_x y vini_y;
angr= ang * pi/180;
v0x=vini*cos(angr);
v0y=vini*sin(angr);

% elijo cómo va a ser el paso del tiempo
dt=0.1;

% creo los arrays donde meteré el tiempo, posición y velocidad
t=[tiempo];
posx=[x0];
posy=[y0];
velx=[v0x];
vely=[v0y];

% estas son las variables que usaré durante la resolución del movimiento, y
% que iré metiendo en los arrays
tt=tiempo;
xx=x0;
yy=y0;
vvx=v0x;
vvy=v0y;

while not(yy<0),
    tt=tt+dt;
    acelx=0;
    acely=-g;    
    vvx=vvx+acelx*dt;
    vvy=vvy+acely*dt;
    xx=xx+vvx*dt;
    yy=yy+vvy*dt;

    
    % ¿qué pasa si claculo antes las nuevas velocidades?

t=[t,tt];
posx=[posx,xx];
posy=[posy,yy];
velx=[velx,vvx];
vely=[vely,vvy];
    
end

%  y ahora lo pinto (junto con la trayectoria resuelta de las ecs)
figure(4)
plot(x,y,'-b', posx,posy, '--or')

title('Unidad 3: Ejercicio 1: tiro parabólico + método iterativo');
xlabel('x (m)');
ylabel('y (m)');
legend('fórmulas','Euler');


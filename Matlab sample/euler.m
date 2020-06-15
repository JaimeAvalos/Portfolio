%% Ejercicio 3_1: 
% El eje7.m consist�a en:
% Con las ecuaciones del tiro parab�lico, 
% pintar  [Y de X] para unas determinadas condiciones iniciales: �ngulo, v_ini, etc.
% 
% Y dibujar la trayectoria, y el "proyectil" movi�ndose por ella, paso a paso
%
% Ahora, obtendremos la trayectoria del proyectil integrando las ecuaciones
% del movimiento por el m�todo de Euler (evaluando las nuevas posici�n y velocidad 
% para cada incremento de tiempo)
%
%%

% condiciones iniciales

ang = 35; % en grados. Lo tendr� que pasar a radianes para usarlo en sen y cos.
vini= 10;  % m�dulo de v inicial (m/s).  �ojo a las unidades!

% resto de condiciones iniciales y par�metros: acel=g, y posici�n inicial

g=9.8;
x0=0; y0=0;
% saco �ngulo en rad,  y  vini_x y vini_y;
angr= ang * pi/180;
v0x=vini*cos(angr);
v0y=vini*sin(angr);

% creo el "vector" del tiempo, y luego sacar� x(t) e y(t)  de las "f�rmulas" conocidas

% tiempo total que voy a calcular (s)
ttot= 1.1;  
% pero puedo estimar el tiempo total = 2 x tiempo que tarda en llegar
% arriba del todo (donde vy se hace cero)
tsubir= v0y/g;  
ttot= 2*tsubir;

npt = 100; % n�mero de ptos que quiero tener del vector tiempo 

t = (ttot/npt)*(0:1:npt);

% saco x(t) e y(t)

x=x0+v0x*t;
y=y0+v0y*t+(1/2)*(-g)*(t.^2);

% y lo pinto

figure(1)
plot(x,y);

title('Ejercicio 2: tiro parab�lico');
xlabel('x (m)');
ylabel('y (m)');
legend('y(x)');

% para mantener las proporciones de los 2 ejes
% axis equal;


%%

% dibujar la trayectoria, y el "proyectil" movi�ndose por ella

figure(2)
for i=1:npt
    plot(x,y)
    hold all;
    plot(x(i),y(i),'ro')
    hold off
    pause(0.01)
end;
    
title('Ejercicio 7: tiro parab�lico');
xlabel('x (m)');
ylabel('y (m)');
legend('y(x)');

%%

% dibujar la trayectoria, y el "proyectil" movi�ndose por ella

figure(3)
plot(x,y)
title('Ejercicio 7: tiro parab�lico');
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
% posici�n = velocidad * tiempo
% velocidad = aceleraci�n * tiempo
% aceleraci�n = Fuerza / masa  (ley de Newton)
% Caso A: La �nica fuerza es debida al peso


% condiciones iniciales

ang = 35; % en grados. Lo tendr� que pasar a radianes para usarlo en sen y cos.
vini= 10;  % m�dulo de v inicial (m/s).  �ojo a las unidades!

% resto de condiciones iniciales y par�metros: acel=g, y posici�n inicial

g=9.8;
x0=0; y0=0; tiempo=0;
% saco �ngulo en rad,  y  vini_x y vini_y;
angr= ang * pi/180;
v0x=vini*cos(angr);
v0y=vini*sin(angr);

% elijo c�mo va a ser el paso del tiempo
dt=0.1;

% creo los arrays donde meter� el tiempo, posici�n y velocidad
t=[tiempo];
posx=[x0];
posy=[y0];
velx=[v0x];
vely=[v0y];

% estas son las variables que usar� durante la resoluci�n del movimiento, y
% que ir� metiendo en los arrays
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

    
    % �qu� pasa si claculo antes las nuevas velocidades?

t=[t,tt];
posx=[posx,xx];
posy=[posy,yy];
velx=[velx,vvx];
vely=[vely,vvy];
    
end

%  y ahora lo pinto (junto con la trayectoria resuelta de las ecs)
figure(4)
plot(x,y,'-b', posx,posy, '--or')

title('Unidad 3: Ejercicio 1: tiro parab�lico + m�todo iterativo');
xlabel('x (m)');
ylabel('y (m)');
legend('f�rmulas','Euler');


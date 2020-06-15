%% Plot 3D: mov en 3D

% en Z:   "tiro parabólico"
% en X,Y: mov. circular "uniforme" "raro"

% en t=0 está en x=R, y=0, z=0;
v0z=50; %(m/s)
R0=1; %(m)
ang_ini=0;
frec = 1; %(Hz = 1 vuelta/seg)
g=9.8; %(m/s^2)
z0=0;

% tiempo total que voy a calcular (s)
 
% puedo estimar el tiempo total = 2 x tiempo que tarda en llegar
% arriba del todo (donde vz se hace cero)
tsubir= v0z/g;  
ttot= 2*tsubir;

npt = 500; % número de ptos que quiero tener del vector tiempo 

t = (ttot/npt)*(0:1:npt);

% saco x(t), y(t), z(t)
%supongamos que R disminuye con el tiempo
R = R0 * (exp(-0.3*t));
x= R .* cos(ang_ini+(2*pi*frec).*t);
y= R .* sin(ang_ini+(2*pi*frec).*t);
z= z0 + v0z*t + (1/2)*(-g)*(t.^2);
r=sqrt(x.^2+y.^2);

%%  trayectoria en XYZ
figure(11);

plot3(x,y,z);
axis on;
grid on;
xlabel('X');  ylabel('Y');  zlabel('Z');
%%  variaciones con el tiempo 
figure(12); 

 subplot(221), plot(t,x) 
 xlabel(' tiempo (s)'),ylabel('x (m)')
 subplot(222), plot(t,y)
 xlabel(' tiempo (s)'),ylabel('y (m)')
 subplot(223), plot(t,r,t,R) 
 xlabel(' tiempo (s)'),ylabel('radio (m)')
 subplot(224), plot(t,z)
 xlabel(' tiempo (s)'),ylabel('altura (m)')
 
%%  sacar las velocidades (usando la fc "derivada")

[t2, vx] = derivada(t,x);
[t2, vy] = derivada(t,y);
[t2, vz] = derivada(t,z);
[t2, vr] = derivada(t,r);

v_plano=sqrt(vx.^2+vy.^2);
 
%%

%%  velocidades en V_XYZ
figure(13);

plot3(vx,vy,vz);
axis on;
grid on;
xlabel('V_x');  ylabel('V_y');  zlabel('V_z');


%%  variaciones con el tiempo 
figure(14); 

 subplot(221), plot(t2,vx) 
 xlabel(' tiempo (s)'),ylabel('Vx (m/s)')
 subplot(222), plot(t2,vy)
 xlabel(' tiempo (s)'),ylabel('Vy (m/s)')
 subplot(223), plot(t2,vz) 
 xlabel(' tiempo (s)'),ylabel('Vz (m/s)')
 subplot(224), plot(t2,vr,t2,v_plano)   % ¿qué son estas dos velocidades?
 xlabel(' tiempo (s)'),ylabel('Vr (m/s)')
 
%%
 

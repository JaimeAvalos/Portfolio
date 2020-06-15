%% Ejercicio 3_2. Sistema de múltiples cargas, objetos cargados, y  potenciales eléctricos

% partimos del  Ejercicio 21
%  Gráficos 3D y 2D: V(x,y) en 2D:  creado por carga +1 en (3,2)  y carga -1 en (-3,-4)
%
% y queremos ver qué pasa com muchas cargas u objetos "reales" a diferentes
% potenciales




%%  Esto es lo nuevo.

% quiero estudiar lo que pasa  con dos objetos planos compuestos por
% N y M cargas, y con una diferencia de potencial aplicado entre ellos.
% ¿cómo es la carga en cada objeto? ¿V(x,y,z)? ¿Fuerzas?

% el elemento de carga es un disco de diámetro 1. 
% la distancia mínima entre cargas es 1.
% la ley de Coulomb

% objeto 1:
cargasx1=(-5:1:5);
cargasy1=(-2:1:2)+10;
z01=0;
Vobj1=+1; % voltaje del 1er bloque de cargas

% objeto 2:
cargasx2=(-15:1:15);
cargasy2=(-2:1:2)-10;
% cargasx2=0+(-10:1:10);
% cargasy2=0+(-20:1:40);
z02=0;
Vobj2=-1; % voltaje del 2o bloque de cargas


plpinto=1;   % plano que pinto de V(x,y,z),  1: XY,  2: XZ, 3: YZ  

% haré unos array con las cargas, sus posiciones y sus voltajes

% primer bloque de cargas
[qsx,qsy] = meshgrid(cargasx1,cargasy1);
[lqx1,lqy1]=size(qsx);
numq1=numel(qsx);
tx=reshape(qsx,1,numq1);
ty=reshape(qsy,1,numq1);
tz=z01*ones(1,numq1);    % todas tienen el mismo z
Vq=Vobj1*ones(1,numq1);  % todas tienen el mismo V


% y meto los datos en las lista totales
LTqx=tx;
LTqy=ty;
LTqz=tz;
LTV=Vq;



% lo mismo para el segundo bloque de cargas  
[qsx,qsy] = meshgrid(cargasx2,cargasy2);
[lqx2,lqy2]=size(qsx);
numq2=numel(qsx);
tx=reshape(qsx,1,numq2);
ty=reshape(qsy,1,numq2);
tz=z02*ones(1,numq2);
Vq=Vobj2*ones(1,numq2);

% lo meto en la lista total
LTqx=[LTqx,tx];
LTqy=[LTqy,ty];
LTqz=[LTqz,tz];
LTV=[LTV,Vq];


%%  Ahora creo las matrices con los coeficientes de las cargas (incógnitas):  MC x Q = V

disp('creo las matrices...')
tic
numtotal=length(LTV);
MC=zeros(numtotal,numtotal);
% VM del primer bloque de cargas
for m= 1:numtotal,
    for n= 1:numtotal,
        d_x=LTqx(m)-LTqx(n);
        d_y=LTqy(m)-LTqy(n);
        d_z=LTqz(m)-LTqz(n);
        dd=((d_x^2+d_y^2+d_z^2)^0.5 );
        if dd>0,
            MC(m,n)=1/( dd );
        else MC(m,n)=2; %LTV(m);
        end
    end
end
toc

%%  y saco las cargas resolviendo las ecuaciones
 %volt=1*ones(1,numq)';
disp('saca las cargas...');
tic
 Qs = MC\LTV';
toc


%% y puedo calcular V(x,y,z), porque ya sé el valor de todas las cargas

disp('calculo V(x,y,z)...')
tic

% hallo los puntos del "grid" (x,y) donde voy a calcular el voltaje
tam=30;
switch plpinto
    case 1  % V(x,y) a z0
        zo=0;
        x=-tam:1:tam;
        y=-tam:1:tam;
        [xx,yy] = meshgrid(x,y);
        zz=zo*ones(length(x),length(y));
    case 2  % V(x,z) a y0
        yo=0;
        x=-tam:1:tam;
        z=-tam:1:tam;
        [xx,zz] = meshgrid(x,z);
        yy=yo*ones(length(x),length(z));
    case 3  % V(y,z) a x0
        xo=0;
        y=-tam:1:tam;
        z=-tam:1:tam;
        [yy,zz] = meshgrid(y,z);
        xx=xo*ones(length(y),length(z));
end

% y evalúo V en esos puntos (suma de los V de cada carga)        
 V=0*xx;
for m= 1:numtotal,
    ds=(((xx-LTqx(m)).^2+(yy-LTqy(m)).^2+(zz-LTqz(m)).^2).^(0.5));
    ds=2*(ds<0.5)+ds.*(ds>=0.5);
    V=V+Qs(m)*(1./ds);
end

toc
        


%% y pinto las cosas
disp('empiezo a pintar...');

% límites de V(x,y,z)
mxx=max(max(V));
mixx=min(min(V));
mxx=1.1*mxx;
if mixx<0, mixx=mixx*1.2; else mixx=mixx*0.9; end
% V(x,y)
figure(113);
switch plpinto
        case 1  % V(x,y) a z0
            surf(x,y,V)
        case 2  % V(x,z) a y0
            surf(x,z,V)
        case 3  % V(x,z) a y0
            surf(y,z,V)    
end
shading interp;
colorbar;
colormap jet;
grid on
axis([-tam tam -tam tam mixx mxx]);


% contour V(x,y)
figure(115);
clev=mixx:mxx/21:mxx;   
switch plpinto
        case 1  % V(x,y) a z0
            contour(x,y,V,clev)
        case 2  % V(x,z) a y0
            contour(x,z,V,clev)
        case 3  % V(x,z) a y0
            contour(y,z,V,clev)              
end
colorbar;axis equal
colormap jet;
grid on

%%

qqxy1=reshape(Qs(1:numq1),lqx1,lqy1);
qqxy2=reshape(Qs(numq1+1:numq1+numq2),lqx2,lqy2);
figure(203);
surf(cargasx1,cargasy1,qqxy1)
shading interp;
colorbar;
colormap jet;
hold all
surf(cargasx2,cargasy2,qqxy2)
axis([-tam tam -tam tam min(Qs) max(Qs)]);
shading interp;
hold off;

%%
% figure(200);
% tri = delaunay(LTqx(1:numq1),LTqy(1:numq1));
% trisurf(tri,LTqx(1:numq1),LTqy(1:numq1),Qs(1:numq1)); 
% shading interp;
% hold all;
% tri = delaunay(LTqx(numq1+1:numq1+numq2),LTqy(numq1+1:numq1+numq2));
% trisurf(tri,LTqx(numq1+1:numq1+numq2),LTqy(numq1+1:numq1+numq2),Qs(numq1+1:numq1+numq2));     
% shading interp;
% grid on
% axis([-tam tam -tam tam min(Qs) max(Qs)]);
% colorbar
% hold off;
%%

% %% Esto era el eje21.m
% %creo  los arrays para la x y la y con el espaciado y num de ptos que yo quiero 
% ll=101;
% escx=6/ll;
% escy=6/ll;
% x =escx*( -ll:1:ll);
% y =escy*( -ll:1:ll);
% 
% % pongo las dos cargas
% q=[1,-1];
% qx=[3,-3];
% qy=[2,-4];
% 
% % creo la rejilla 2D
% [xx,yy] = meshgrid(x,y);
% 
% % calculo el potencial en cada punto de la rejilla (sumando el debido a cada carga)
%  zz=zeros(length(xx));
%  for i=1:length(q)
%  ds=((xx-qx(i)).^2+(yy-qy(i)).^2).^(0.5);
%  zz=zz+ (q(i)./ds);
%  end;
%  
% %% 
% % y lo pinto
% 
% figure(1)
% 
% %contour(zz)
% %contour(xx,yy,zz)
% v=[-10:.1:10];
% contour(xx,yy,zz,v);
% axis equal;
% 
% %%
% 
% % y lo pinto
% 
% figure(2)
% 
% opengl('software');
% pcolor(x,y,zz);
% 
%  axis on;
% shading flat;
%  colorbar; 
%  
% %%
% figure(3);    
% surf(x,y,zz);
% 
% %axis([min(x) max(x) min(y) max(y) -5 5]);
% %caxis([-5 5]);
% 
% %axis off;
% %colorbar; 
% shading flat; %interp;
% 
% %%
% figure(31);    
% surf(x,y,zz);
% 
% axis([min(x) max(x) min(y) max(y) -5 5]);
% caxis([-5 5]);
% 
% axis off;
% colorbar; 
% shading flat; %interp;
% %%
% figure(32);    
% 
% surf(x,y,zz);
% limites=[-2 2];
% axis([min(x) max(x) min(y) max(y) limites]);
% caxis(limites);
% 
% %axis off;
% colorbar; 
% shading flat; %interp;
% title ('potencial debido a dos cargas')
% xlabel('x(m)'); ylabel('y(m)');
% zlabel('V(x,y)');



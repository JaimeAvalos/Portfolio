%% Ejercicio superficies

close all
clear all
%%
x=-20:.5:20;
y=-20:.5:20;
r=sqrt(x.^2+y.^2);
z=sin(r)./r;

%%
figure(1)
plot(r,z)
legend('sin(r)/r')
xlabel('r'),ylabel('z')

%%
figure(2)
plot3(x,y,z);
xlabel('x'),ylabel('y'),zlabel('z')
grid on


%%
figure (3)
[mx,my]=meshgrid(x,y); %x varia por columnas, y varia por filas 

plot3(mx,my,z);

%%
figure (3)
[mx,my]=meshgrid(x,y); %x varia por columnas, y varia por filas 
r=sqrt(mx.^2+my.^2);
z=sin(r)./r;
plot3(mx,my,z);
xlabel('x'),ylabel('y'),zlabel('z')
grid on
%%
figure(4)
mesh(mx,my,z);
xlabel('x'),ylabel('y'),zlabel('z')

%%
figure(4)
surf(mx,my,z);
xlabel('x'),ylabel('y'),zlabel('z')

%%
figure(4)
surf(mx,my,z);
xlabel('x'),ylabel('y'),zlabel('z')
shading interp
%daspect([3 3 1])

%%
figure(41)
surf(z);
shading interp


%%
z(41,41)=1;
figure(4)
surf(mx,my,z);
xlabel('x'),ylabel('y'),zlabel('z')
shading interp
colorbar;
colormap(jet)
title('sin(r)/r')

%%
z(41,41)=1;
figure(4)
surf(mx,my,z);
xlabel('x'),ylabel('y'),zlabel('z')
shading interp
colorbar;title('sin(r)/r')
%axis ([-10 10 -10 10 -2 3])
%caxis([-1 2])
colormap(hsv)


%%
figure(5)

contour(mx,my,z);
xlabel('x'),ylabel('y'),zlabel('z')

%%
figure(5)
v=[-0.2:.1:1];
cs=contour(mx,my,z,v);
%clabel(cs)

%%


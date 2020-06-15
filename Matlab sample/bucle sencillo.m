t = 0:.1:10;
x = 5*t;



figure
plot(t,x)
hold all
for k=1:length(t)
    plot(t(k),x(k),'o')
    hold all
    pause(.1)
    
end

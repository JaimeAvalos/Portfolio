close all;
clear all;
clc;

G=6.673E-11; %constante de gravitaci?n universal

%MASAS
[mS, mT,mM,mJ,mSt,mMe,mV,mU,mN,mP] = masas

%SEMIEJES
[aMe, aV, aT, aM, aJ, aS, aU, aN, aP] = semiejes

%DISTANCIA PERIHELIO-SOL

[MeS, VS, TS, MS, JS, StS, US, NS, PS ] = distperihelio


% %VELOCIDADES INICIALES

vMe0=sqrt(2.*mS.*G.*(((1./MeS)-(1./(2.*aMe))))); %velocidad inicial de Mercurio
vV0=sqrt(2.*mS.*G.*(((1./VS)-(1./(2.*aV))))); %velocidad inicial de Venus
vT0=sqrt(2.*mS.*G.*(((1./TS)-(1./(2.*aT))))); %velocidad inicial de la tierra
vM0=sqrt(2.*mS.*G.*(((1./MS)-(1./(2.*aM))))); %velocidad inicial de Marte
vJ0=sqrt(2.*mS.*G.*(((1./JS)-(1./(2.*aJ))))); %velocidad inicial de Jupiter
vSt0=sqrt(2.*mS.*G.*(((1./StS)-(1./(2.*aS))))); %velocidad inicial de Saturno
vU0=sqrt(2.*mS.*G.*(((1./US)-(1./(2.*aU))))); %velocidad inicial de Urano
vN0=sqrt(2.*mS.*G.*(((1./NS)-(1./(2.*aN))))); %velocidad inicial de Neptuno
vP0=sqrt(2.*mS.*G.*(((1./PS)-(1./(2.*aP))))); %velocidad inicial de Pluton

%TIEMPO
t=0; %tiempo
dt=60*60*24; %diferencial de tiempo de un dia en 


%POSICIONES; SUPUESTO: El centro del sistema de referencia es el Sol
xS(1)=0; %posici?n inicial del sol en el eje cartesiano x
yS(1)=0; %posici?n inicial del sol en el eje cartesiano y
xT(1)=TS; %posicion de la tierra inicial en x cartesiana
yT(1)=0; %posicion de la tierra incial en y cartesiana
xM(1)=MS; %posicion inicial de Marte en x cartesiana
yM(1)=0; %posicion inicial de Marte en y cartesiana
xJ(1)=JS; %posicion inicial de Jupiter en x cartesiana
yJ(1)=0; %posicion inicial de Jupiter en y cartesiana
xSt(1)=StS; %posicion inicial de Satuno en x cartesiana
ySt(1)=0; %posicion inicial de Saturno en y cartesiana
xMe(1)=MeS; %posicion inicial de Mercurio en x cartesiana
yMe(1)=0; %posicion inicial de Mercurio en y cartesiana
xV(1)=VS; %posicion inicial de Venus en x cartesiana
yV(1)=0; %posicion inicial de Venus en y cartesiana
xU(1)=US; %posicion inicial de Urano en x cartesiana
yU(1)=0; %posicion inicial de Urano en y cartesiana
xN(1)=NS; %posicion inicial de Neptuno en x cartesiana
yN(1)=0; %posicion inicial de Neptuno en y cartesiana
xP(1)=PS; %posicion inicial de Pluton en x cartesiana
yP(1)=0; %posicion inicial de Pluton en y cartesiana

%VELOCIDADES; SUPUESTO: El sol est? est?tico
vTx(1)=0; %velocidad de la tierra inicial en la coordenada x
vTy(1)=vT0; %velocidad de la tierra inicial en la coordenada y
vMx(1)=0; %velocidad de Marte inicial en la coordenada x
vMy(1)=vM0; %velocidad de Marte inicial en la coordenada y
vJx(1)=0; %velocidad de Jupiter inicial en la coordenada x
vJy(1)=vJ0; %velocidad de Jupiter inicial en la coordenada y
vStx(1)=0; %velocidad de Saturno inicial en la coordenada x
vSty(1)=vSt0; %velocidad de Saturno inicial en la coordenada y
vMex(1)=0; %velocidad de Mercurio inicial en la coordenada x
vMey(1)=vMe0; %velocidad de Mercurio inicial en la coordenada y
vVx(1)=0; %velocidad de Venus inicial en la coordenada x
vVy(1)=vV0; %velocidad de Venus inicial en la coordenada y
vUx(1)=0; %velocidad de Urano inicial en la coordenada x
vUy(1)=vU0; %velocidad de Urano inicial en la coordenada y
vNx(1)=0; %velocidad de Neptuno inicial en la coordenada x
vNy(1)=vN0; %velocidad de Neptuno inicial en la coordenada y
vPx(1)=0; %velocidad de Pluton inicial en la coordenada x
vPy(1)=vP0; %velocidad de Pluton inicial en la coordenada y



%BUCLE DE INTEGRACION: METODO EULER; SUPUESTO: La fuerza de atracci?n entre
%planetas es despreciable
i=1;
while (t<60*60*24*365*12) %doce a?os en segundos
    
    t=t+dt;
    
    %for p=1:length(t),
       % mS=mS-(0.001*mS);
    %end
    
    dTS=sqrt((xT(i)).^2 + (yT(i)).^2);
    dMS=sqrt((xM(i)).^2 + (yM(i)).^2);
    dMT=sqrt(xM(i)-xT(i)).^2 + (yM(i)-yT(i)).^2;
    dJS=sqrt((xJ(i)).^2 + (yJ(i)).^2);
    dJM=sqrt(xJ(i)-xM(i)).^2 + (yJ(i)-yM(i)).^2;
    dJT=sqrt(xJ(i)-xT(i)).^2 + (yJ(i)-yT(i)).^2;
    dStS=sqrt((xSt(i)).^2 + (ySt(i)).^2);
    dStJ=sqrt(xSt(i)-xJ(i)).^2 + (ySt(i)-yJ(i)).^2;
    dStM=sqrt(xSt(i)-xM(i)).^2 + (ySt(i)-yM(i)).^2;
    dStT=sqrt(xSt(i)-xT(i)).^2 + (ySt(i)-yT(i)).^2;
    dMeS=sqrt((xMe(i)).^2 + (yMe(i)).^2);
    dTMe=sqrt(xT(i)-xMe(i)).^2 + (yT(i)-yMe(i)).^2;
    dMMe=sqrt(xM(i)-xMe(i)).^2 + (yM(i)-yMe(i)).^2;
    dJMe= sqrt(xJ(i)-xMe(i)).^2 + (yJ(i)-yMe(i)).^2;
    dStMe= sqrt(xSt(i)-xMe(i)).^2 + (ySt(i)-yMe(i)).^2;
    dVS=sqrt((xV(i)).^2 + (yV(i)).^2);
    dVMe=sqrt(xV(i)-xMe(i)).^2 + (yV(i)-yMe(i)).^2;
    dTV=sqrt(xT(i)-xV(i)).^2 + (yT(i)-yV(i)).^2;
    dMV=sqrt(xM(i)-xV(i)).^2 + (yM(i)-yV(i)).^2;
    dJV=sqrt(xJ(i)-xV(i)).^2 + (yJ(i)-yV(i)).^2;
    dStV=sqrt(xSt(i)-xV(i)).^2 + (ySt(i)-yV(i)).^2;
    dUS=sqrt((xU(i)).^2 + (yU(i)).^2);
    dUMe=sqrt(xU(i)-xMe(i)).^2 + (yU(i)-yMe(i)).^2;
    dUV=sqrt(xU(i)-xV(i)).^2 + (yU(i)-yV(i)).^2;
    dUT=sqrt(xU(i)-xT(i)).^2 + (yU(i)-yT(i)).^2;
    dUM=sqrt(xU(i)-xM(i)).^2 + (yU(i)-yM(i)).^2;
    dUJ=sqrt(xU(i)-xJ(i)).^2 + (yU(i)-yJ(i)).^2;
    dUSt=sqrt(xU(i)-xSt(i)).^2 + (yU(i)-ySt(i)).^2;
    dNS=sqrt((xN(i)).^2 + (yN(i)).^2);
    dNMe=sqrt(xN(i)-xMe(i)).^2 + (yN(i)-yMe(i)).^2;
    dNV=sqrt(xN(i)-xV(i)).^2 + (yN(i)-yV(i)).^2;
    dNT=sqrt(xN(i)-xT(i)).^2 + (yN(i)-yT(i)).^2;
    dNM=sqrt(xN(i)-xM(i)).^2 + (yN(i)-yM(i)).^2;
    dNJ=sqrt(xN(i)-xJ(i)).^2 + (yN(i)-yJ(i)).^2;
    dNSt=sqrt(xN(i)-xSt(i)).^2 + (yN(i)-ySt(i)).^2;
    dNU=sqrt(xN(i)-xP(i)).^2 + (yN(i)-yU(i)).^2;
    dPS=sqrt((xP(i)).^2 + (yP(i)).^2);
    dPMe=sqrt(xP(i)-xMe(i)).^2 + (yP(i)-yMe(i)).^2;
    dPV=sqrt(xP(i)-xV(i)).^2 + (yP(i)-yV(i)).^2;
    dPT=sqrt(xP(i)-xT(i)).^2 + (yP(i)-yT(i)).^2;
    dPM=sqrt(xP(i)-xM(i)).^2 + (yP(i)-yM(i)).^2;
    dPJ=sqrt(xP(i)-xJ(i)).^2 + (yP(i)-yJ(i)).^2;
    dPSt=sqrt(xP(i)-xSt(i)).^2 + (yP(i)-ySt(i)).^2;
    dPU=sqrt(xP(i)-xU(i)).^2 + (yP(i)-yU(i)).^2;
    dPN=sqrt(xP(i)-xN(i)).^2 + (yP(i)-yN(i)).^2;
    
    
    
    fTx(i)=(-((G.*mS*mT)./(dTS).^3).*xT(i))-((G.*mT*mM)./(dMT).^3).*xT(i)-((G.*mT*mJ)./(dJT).^3).*xT(i)-((G.*mT*mSt)./(dStT).^3).*xT(i)-((G.*mT*mMe)./(dTMe).^3).*xT(i)-((G.*mT*mV)./(dTV).^3).*xT(i)-((G.*mT*mU)./(dUT).^3).*xT(i)-((G.*mT*mN)./(dNT).^3).*xT(i)-((G.*mT*mP)./(dPT).^3).*xT(i);
    fTy(i)=(-((G.*mS*mT)./(dTS).^3).*yT(i)) -((G.*mT*mM)./(dMT).^3).*yT(i) -((G.*mT*mJ)./(dJT).^3).*yT(i)-((G.*mT*mSt)./(dStT).^3).*yT(i)-((G.*mT*mMe)./(dTMe).^3).*yT(i)-((G.*mT*mV)./(dTV).^3).*yT(i)-((G.*mT*mU)./(dUT).^3).*yT(i)-((G.*mT*mN)./(dNT).^3).*yT(i)-((G.*mT*mP)./(dPT).^3).*yT(i);
    fMx(i)=(-((G.*mS*mM)./(dMS).^3).*xM(i))-((G.*mT*mM)./(dMT).^3).*xM(i)-((G.*mM*mJ)./(dJM).^3).*xM(i)-((G.*mM*mSt)./(dStM).^3).*xM(i)-((G.*mM*mMe)./(dMMe).^3).*xM(i)-((G.*mM*mV)./(dMV).^3).*xM(i)-((G.*mM*mU)./(dUM).^3).*xM(i)-((G.*mM*mN)./(dNM).^3).*xM(i)-((G.*mM*mP)./(dPM).^3).*xM(i);
    fMy(i)=(-((G.*mS*mM)./(dMS).^3).*yM(i)) -((G.*mT*mM)./(dMT).^3).*yM(i)-((G.*mM*mJ)./(dJM).^3).*yM(i)-((G.*mM*mSt)./(dStM).^3).*yM(i)-((G.*mM*mMe)./(dMMe).^3).*yM(i)-((G.*mM*mV)./(dMV).^3).*yM(i)-((G.*mM*mU)./(dUM).^3).*yM(i)-((G.*mM*mN)./(dNM).^3).*yM(i)-((G.*mM*mP)./(dPM).^3).*yM(i);
    fJx(i)=(-((G.*mS*mJ)./(dJS).^3).*xJ(i))-((G.*mT*mJ)./(dJT).^3).*xJ(i)-((G.*mM*mJ)./(dJM).^3).*xJ(i)-((G.*mJ*mSt)./(dStJ).^3).*xJ(i)-((G.*mJ*mMe)./(dJMe).^3).*xJ(i)-((G.*mJ*mV)./(dJV).^3).*xJ(i)-((G.*mJ*mU)./(dUJ).^3).*xJ(i)-((G.*mJ*mN)./(dNJ).^3).*xJ(i)-((G.*mJ*mP)./(dPJ).^3).*xJ(i);
    fJy(i)=(-((G.*mS*mJ)./(dJS).^3).*yJ(i)) -((G.*mT*mJ)./(dJT).^3).*yJ(i)-((G.*mM*mJ)./(dJM).^3).*yJ(i);-((G.*mJ*mSt)./(dStJ).^3).*yJ(i)-((G.*mJ*mMe)./(dJMe).^3).*yJ(i)-((G.*mJ*mV)./(dJV).^3).*yJ(i)-((G.*mJ*mU)./(dUJ).^3).*yJ(i)-((G.*mJ*mN)./(dNJ).^3).*yJ(i)-((G.*mJ*mP)./(dPJ).^3).*yJ(i);
    fStx(i)=(-((G.*mS*mSt)./(dStS).^3).*xSt(i))-((G.*mT*mSt)./(dStT).^3).*xSt(i)-((G.*mM*mSt)./(dStM).^3).*xSt(i)-((G.*mJ*mSt)./(dStJ).^3).*xSt(i)-((G.*mSt*mMe)./(dStMe).^3).*xSt(i)-((G.*mSt*mV)./(dStV).^3).*xSt(i)-((G.*mSt*mU)./(dUSt).^3).*xSt(i)-((G.*mSt*mN)./(dNSt).^3).*xSt(i)-((G.*mSt*mP)./(dPSt).^3).*xSt(i);
    fSty(i)=(-((G.*mS*mSt)./(dStS).^3).*ySt(i)) -((G.*mT*mSt)./(dStT).^3).*ySt(i)-((G.*mM*mSt)./(dStM).^3).*ySt(i)-((G.*mJ*mSt)./(dStJ).^3).*ySt(i)-((G.*mSt*mMe)./(dStMe).^3).*ySt(i)-((G.*mSt*mV)./(dStV).^3).*ySt(i)-((G.*mSt*mU)./(dUSt).^3).*ySt(i)-((G.*mSt*mN)./(dNSt).^3).*ySt(i)-((G.*mSt*mP)./(dPSt).^3).*ySt(i);
    fMex(i)=(-((G.*mS*mMe)./(dMeS).^3).*xMe(i))-((G.*mT*mMe)./(dTMe).^3).*xMe(i)-((G.*mV*mMe)./(dVMe).^3).*xMe(i)-((G.*mM*mMe)./(dMMe).^3).*xMe(i)-((G.*mJ*mMe)./(dJMe).^3).*xMe(i)-((G.*mSt*mMe)./(dStMe).^3).*xMe(i)-((G.*mU*mMe)./(dUMe).^3).*xMe(i)-((G.*mN*mMe)./(dNMe).^3).*xMe(i)-((G.*mP*mMe)./(dPMe).^3).*xMe(i);
    fMey(i)=(-((G.*mS*mMe)./(dMeS).^3).*yMe(i)) -((G.*mT*mMe)./(dTMe).^3).*yMe(i)-((G.*mV*mMe)./(dVMe).^3).*yMe(i)-((G.*mM*mMe)./(dMMe).^3).*yMe(i)-((G.*mJ*mMe)./(dJMe).^3).*yMe(i)-((G.*mSt*mMe)./(dStMe).^3).*yMe(i)-((G.*mU*mMe)./(dUMe).^3).*yMe(i)-((G.*mN*mMe)./(dNMe).^3).*yMe(i)-((G.*mP*mMe)./(dPMe).^3).*yMe(i);
    fVx(i)=(-((G.*mS*mV)./(dVS).^3).*xV(i))-((G.*mV*mT)./(dTV).^3).*xV(i)-((G.*mV*mM)./(dMV).^3).*xV(i)-((G.*mV*mJ)./(dJV).^3).*xV(i)-((G.*mSt*mV)./(dStV).^3).*xV(i)-((G.*mU*mV)./(dUV).^3).*xV(i)-((G.*mN*mV)./(dNV).^3).*xV(i)-((G.*mV*mMe)./(dVMe).^3).*xV(i)-((G.*mP*mMe)./(dPMe).^3).*xP(i);
    fVy(i)=(-((G.*mS*mV)./(dVS).^3).*yV(i)) -((G.*mV*mT)./(dTV).^3).*yV(i)-((G.*mV*mM)./(dMV).^3).*yV(i)-((G.*mV*mJ)./(dJV).^3).*yV(i)-((G.*mSt*mV)./(dStV).^3).*yV(i)-((G.*mU*mV)./(dUV).^3).*yV(i)-((G.*mN*mV)./(dNV).^3).*yV(i)-((G.*mV*mMe)./(dVMe).^3).*yV(i)-((G.*mP*mMe)./(dPMe).^3).*yP(i);
    fUx(i)=(-((G.*mS*mU)./(dUS).^3).*xU(i))-((G.*mT*mU)./(dUT).^3).*xU(i)-((G.*mV*mU)./(dUV).^3).*xU(i)-((G.*mU*mMe)./(dUMe).^3).*xU(i)-((G.*mM*mU)./(dUM).^3).*xU(i)-((G.*mJ*mU)./(dUJ).^3).*xU(i)-((G.*mSt*mU)./(dUSt).^3).*xU(i)-((G.*mN*mU)./(dNU).^3).*xU(i)-((G.*mP*mU)./(dPU).^3).*xU(i);
    fUy(i)=(-((G.*mS*mU)./(dUS).^3).*yU(i)) -((G.*mT*mU)./(dUT).^3).*yU(i)-((G.*mV*mU)./(dUV).^3).*yU(i)-((G.*mU*mMe)./(dUMe).^3).*yU(i)-((G.*mM*mU)./(dUM).^3).*yU(i)-((G.*mJ*mU)./(dUJ).^3).*yU(i)-((G.*mSt*mU)./(dUSt).^3).*yU(i)-((G.*mN*mU)./(dNU).^3).*yU(i)-((G.*mP*mU)./(dPU).^3).*yU(i);
    fNx(i)=(-((G.*mS*mN)./(dNS).^3).*xN(i))-((G.*mT*mN)./(dNT).^3).*xN(i)-((G.*mV*mN)./(dNV).^3).*xN(i)-((G.*mM*mN)./(dNM).^3).*xN(i)-((G.*mJ*mN)./(dNJ).^3).*xN(i)-((G.*mSt*mN)./(dNSt).^3).*xN(i)-((G.*mN*mP)./(dPN).^3).*xN(i)-((G.*mN*mU)./(dNU).^3).*xN(i)-((G.*mN*mMe)./(dNMe).^3).*xN(i);
    fNy(i)=(-((G.*mS*mN)./(dNS).^3).*yN(i)) -((G.*mT*mN)./(dNT).^3).*yN(i)-((G.*mV*mN)./(dNV).^3).*yN(i)-((G.*mM*mN)./(dNM).^3).*yN(i)-((G.*mJ*mN)./(dNJ).^3).*yN(i)-((G.*mSt*mN)./(dNSt).^3).*yN(i)-((G.*mN*mP)./(dPN).^3).*yN(i)-((G.*mN*mU)./(dNU).^3).*yN(i)-((G.*mN*mMe)./(dNMe).^3).*yN(i);
    fPx(i)=(-((G.*mS*mP)./(dPS).^3).*xP(i))-((G.*mT*mP)./(dPT).^3).*xP(i)-((G.*mV*mP)./(dPV).^3).*xP(i)-((G.*mM*mP)./(dPM).^3).*xP(i)-((G.*mJ*mP)./(dPJ).^3).*xP(i)-((G.*mSt*mP)./(dPSt).^3).*xP(i)-((G.*mU*mP)./(dPU).^3).*xP(i)-((G.*mN*mP)./(dPN).^3).*xP(i)-((G.*mP*mMe)./(dPMe).^3).*xP(i);
    fPy(i)=(-((G.*mS*mP)./(dPS).^3).*yP(i)) -((G.*mT*mP)./(dPT).^3).*yP(i)-((G.*mV*mP)./(dPV).^3).*yP(i)-((G.*mM*mP)./(dPM).^3).*yP(i)-((G.*mJ*mP)./(dPJ).^3).*yP(i)-((G.*mSt*mP)./(dPSt).^3).*yP(i)-((G.*mU*mP)./(dPU).^3).*yP(i)-((G.*mN*mP)./(dPN).^3).*yP(i)-((G.*mP*mMe)./(dPMe).^3).*yP(i);
    
    
       
    vTx(i+1)=vTx(i)+(dt.*(fTx(i)./mT));
    vTy(i+1)=vTy(i)+(dt.*(fTy(i)./mT));
    vMx(i+1)=vMx(i)+(dt.*(fMx(i)./mM));
    vMy(i+1)=vMy(i)+(dt.*(fMy(i)./mM));
    vJx(i+1)=vJx(i)+(dt.*(fJx(i)./mJ));
    vJy(i+1)=vJy(i)+(dt.*(fJy(i)./mJ));
    vStx(i+1)=vStx(i)+(dt.*(fStx(i)./mSt));
    vSty(i+1)=vSty(i)+(dt.*(fSty(i)./mSt));
    vMex(i+1)=vMex(i)+(dt.*(fMex(i)./mMe));
    vMey(i+1)=vMey(i)+(dt.*(fMey(i)./mMe));
    vVx(i+1)=vVx(i)+(dt.*(fVx(i)./mV));
    vVy(i+1)=vVy(i)+(dt.*(fVy(i)./mV));
    vUx(i+1)=vUx(i)+(dt.*(fUx(i)./mU));
    vUy(i+1)=vUy(i)+(dt.*(fUy(i)./mU));
    vNx(i+1)=vNx(i)+(dt.*(fNx(i)./mN));
    vNy(i+1)=vNy(i)+(dt.*(fNy(i)./mN));
    vPx(i+1)=vPx(i)+(dt.*(fPx(i)./mP));
    vPy(i+1)=vPy(i)+(dt.*(fPy(i)./mP));
    
   
    xT(i+1)=(xT(i)) + (dt.*(vTx(i+1)));
    yT(i+1)=(yT(i)) + (dt.*(vTy(i+1)));
    xM(i+1)=(xM(i)) + (dt.*(vMx(i+1)));
    yM(i+1)=(yM(i)) + (dt.*(vMy(i+1)));
    xJ(i+1)=(xJ(i)) + (dt.*(vJx(i+1)));
    yJ(i+1)=(yJ(i)) + (dt.*(vJy(i+1)));
    xSt(i+1)=(xSt(i)) + (dt.*(vStx(i+1)));
    ySt(i+1)=(ySt(i)) + (dt.*(vSty(i+1)));
    xMe(i+1)=(xMe(i)) + (dt.*(vMex(i+1)));
    yMe(i+1)=(yMe(i)) + (dt.*(vMey(i+1)));
    xV(i+1)=(xV(i)) + (dt.*(vVx(i+1)));
    yV(i+1)=(yV(i)) + (dt.*(vVy(i+1)));
    xU(i+1)=(xU(i)) + (dt.*(vUx(i+1)));
    yU(i+1)=(yU(i)) + (dt.*(vUy(i+1)));
    xN(i+1)=(xN(i)) + (dt.*(vNx(i+1)));
    yN(i+1)=(yN(i)) + (dt.*(vNy(i+1)));
    xP(i+1)=(xP(i)) + (dt.*(vPx(i+1)));
    yP(i+1)=(yP(i)) + (dt.*(vPy(i+1)));
           
    xS(i)=0;
    yS(i)=0;
    
    i=i+1;
 
   %hold on %para poner el sol mas grande
   %plot(xS,yS,'yO','MarkerFaceColor','y','MarkerSize',19)
   %axis ([-5.91E12 5.91E12 -5.91E12 5.91E12]);
   %axis equal
   %hold off

   pause(0.001)
   plot(xT(i),yT(i),'bO',xT,yT,'b', xM(i),yM(i),'rO',xM,yM,'r',xJ(i),yJ(i),'wO',xJ,yJ,'w',xSt(i),ySt(i),'gO',xSt,ySt,'g',xMe(i),yMe(i),'cO',xMe,yMe,'c',xV(i),yV(i),'mO',xV,yV,'m',xU(i),yU(i),'yO',xU,yU,'y',xN(i),yN(i),'bO',xN,yN,'b',xP(i),yP(i),'rO',xP,yP,'r',xS,yS,'yO')
   
   whitebg('k')
   axis ([-5.91E12 5.91E12 -5.91E12 5.91E12]);
   %axis equal
   

end



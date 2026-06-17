%Simulación
clear all
close all
%Introducir datos supuestos
x=linspace(-20,20,1000);
v=input('Introduzca la velocidad del vehículo, en m/s:')
v=linspace(v,v,500);
frealp=input('Introduzca la frecuencia emitida por el vehículo:')
freal=linspace(frealp,frealp,1000);
h=input('Introduzca distancia entre el punto de grabación y la carretera:')
h=linspace(h,h,500);
va=input('Introduzca la velocidad y dirección del viento:')
va=linspace(va,va,500);
cad=1.403; %Constante adiabática del aire
m=0.029; %Masa molecular del aire, en kg/mol
T=input('Introduzca temperatura del aire en ºC:')
T=T+273.15;
R=8.314; %J/mol*K
vson=sqrt((cad*R*T)/m);
vson=linspace(vson,vson,500);
%Acercándose
x1=linspace(-20,0,500);
u1=(h.^2+x1.^2).^(1/2);
F1=((vson.*u1)./(vson.*u1+v.*x1-va)).*freal(1:500);
%Alejándose
x2=linspace(0,20,500);
u2=(h.^2+x2.^2).^(1/2);
F2=((vson.*u2)./(vson.*u2+v.*x2+va)).*freal(501:1000);
%Graficar la frecuencia en función de la posición
F=[F1,F2];
z=F./freal;
plot(x,F)
hold
plot(0,frealp,'mo')
text(0,frealp,'frecuencia real')
xlabel('Posición (m)')
ylabel('Frecuencia (Hz)')
title('Frecuencia teórica para cada posición de la fuente')

%Delta de f
F2ordenado=fliplr(F2);
F3=F1-F2ordenado;
deltaF=F3(1)*0.5;

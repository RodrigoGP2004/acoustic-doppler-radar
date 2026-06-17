clear all
close all
%Gráfica 3D que ilustra como cambia la frecuencia en función de la
%velocidad y la posición, para una h y F original dadas
%Introducción de datos constantes
[h]=matrixty(1.2,1.2,1000);
[v]=matrixty(0,34,1000); %34 m/s equivale más o menos a 120 km/h, el máximo en autovía
[freal]=matrixty(1500,1500,1000);
[vson]=matrixty(343.3838,343.3838,1000); %Velocidad del sonido a 20º
%Posición
[x]=matrixty(-20,20,1000);
x=x';
%
%x1=linspace(-20,0,500);
u=(h.^2+x.^2).^(1/2);

%x2=linspace(0,20,500);
%u2=(h.^2+x2.^2).^(1/2)


%Cálculo de las frecuencias
Fdetectada=((vson.*u)./(vson.*u+v.*x)).*freal;
deltaF=Fdetectada-freal;
deltaF=abs(deltaF);
%Representar gráficamente
xgraph=linspace(-20,20,1000);
vgraph=linspace(0,34,1000);
surf(vgraph,xgraph,Fdetectada)
colormap default
shading flat
xlabel('Velocidad de la fuente (m/s)')
ylabel('Ubicacion del vehiculo (m)')
zlabel('Frecuencia (Hz)')
colorbar
title('Cambio de la frecuencia en funcion de la posición y la velocidad, para una h y frecuencia original determinadas')
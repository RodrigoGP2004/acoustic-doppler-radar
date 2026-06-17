clear all
close all
%Creación de los "puntos" en los que se detecta una frecuencia dada
%(usaremos este proceso como simplificación de los cálculos)
tramo=20;
x1=linspace(-tramo,0,5);
x1=[(x1(1)+x1(2))/2,(x1(2)+x1(3))/2,(x1(3)+x1(4))/2,(x1(4)+x1(5))/2];
x2=linspace(0,tramo,5);
x2=[(x2(1)+x2(2))/2,(x2(2)+x2(3))/2,(x2(3)+x2(4))/2,(x2(4)+x2(5))/2];

%Leer el archivo de la señal de audio, h=0 para AudioCerca y h=1.2 para
%AudioLejos
h=0;
info1= audioinfo("AudioCerca.mp3")
[y,Fs1] = audioread("AudioCerca.mp3");
y=y(:,1)';

%División del archivo de audio en 8 partes (idealmente las 4 primeras serán
%de la señal detectada antes de pasar enfrente del punto de grabación, pero
%si esta asunción no se da en la realidad podría dar a un error)
t1 = 0:seconds(1/Fs1):seconds(info1.Duration);
t1 = t1(1:end);
r=rem(length(t1),8);
if r ~= 0
    t1=t1(1:end-r);
end
t11=t1(1:end/8);
t12=t1(end/8+1:end/4);
t13=t1(end/4+1:3*end/8);
t14=t1(3*end/8+1:end/2);
t15=t1(end/2+1:5*end/8);
t16=t1(5*end/8+1:6*end/8);
t17=t1(6*end/8+1:7*end/8);
t18=t1(7*end/8+1:end);


%Aplicar la transformada de Fourier para cada intervalo, con el fin de
%hallar las frecuencias con intensidades máximas en cada intervalo, que
%deberían corresponderse a la señal emitida)
y1=y(1:length(t11));
FT11=fft(y1);
P21 = abs(FT11/length(t11));
P11 = P21(1:length(t11)/2+1);
P11(2:end-1) = 2*P11(2:end-1);
Pa1=P11(1259:1761);
[M11,I11] = max(Pa1);
I11=I11+1258;

y2=y(length(t12):length(t12)*2);
FT12=fft(y2);
P22 = abs(FT12/length(t12));
P12 = P22(1:length(t12)/2+1);
P12(2:end-1) = 2*P12(2:end-1);
Pa2=P12(1259:1761);
[M12,I12] = max(Pa2);
I12=I12+1258;

y3=y(length(t13)*2:length(t13)*3);
FT13=fft(y3);
P23 = abs(FT13/length(t13));
P13 = P23(1:length(t13)/2+1);
P13(2:end-1) = 2*P13(2:end-1);
Pa3=P13(1259:1761);
[M13,I13] = max(Pa3);
I13=I13+1258;

y4=y(length(t14)*3:length(t14)*4);
FT14=fft(y4);
P24 = abs(FT14/length(t14));
P14 = P24(1:length(t14)/2+1);
P14(2:end-1) = 2*P14(2:end-1);
Pa4=P14(1259:1761);
[M14,I14] = max(Pa4);
I14=I14+1258;

y5=y(length(t15)*4:length(t15)*5);
FT15=fft(y5);
P25 = abs(FT15/length(t15));
P15 = P25(1:length(t15)/2+1);
P15(2:end-1) = 2*P15(2:end-1);
Pa5=P15(1259:1761);
[M15,I15] = max(Pa5);
I15=I15+1258;

y6=y(length(t16)*5:length(t16)*6);
FT16=fft(y6);
P26 = abs(FT16/length(t16));
P16 = P26(1:length(t16)/2+1);
P16(2:end-1) = 2*P16(2:end-1);
Pa6=P16(1259:1761);
[M16,I16] = max(Pa6);
I16=I16+1258;

y7=y(length(t17)*6:length(t17)*7);
FT17=fft(y7);
P27 = abs(FT17/length(t17));
P17 = P27(1:length(t17)/2+1);
P17(2:end-1) = 2*P17(2:end-1);
Pa7=P17(1259:1761);
[M17,I17] = max(Pa7);
I17=I17+1258;

y8=y(length(t18)*7:length(y));
FT18=fft(y8);
P28 = abs(FT18/length(t18));
P18 = P28(1:length(t18)/2+1);
P18(2:end-1) = 2*P18(2:end-1);
Pa8=P18(1259:1761);
[M18,I18] = max(Pa8);
I18=I18+1258;

%Graficar señal original
ly=length(y);
t1=t1(1:ly);
tiledlayout(1,2)
ax1=nexttile
plot(ax1,t1,y)
title(ax1,'Sonido detectado')
xlabel(ax1,'Tiempo (segundos)')
ylabel(ax1,'Señal de audio (amplitud, m)')

%Calcular transformadas
f11 = Fs1*(0:(length(t11)/2))/length(t11);
FrecMax11=f11(I11);

f12 = Fs1*(0:(length(t12)/2))/length(t12);
FrecMax12=f12(I12);

f13 = Fs1*(0:(length(t13)/2))/length(t13);
FrecMax13=f13(I13);

f14 = Fs1*(0:(length(t14)/2))/length(t14);
FrecMax14=f14(I14);

f15 = Fs1*(0:(length(t15)/2))/length(t15);
FrecMax15=f15(I15);

f16 = Fs1*(0:(length(t16)/2))/length(t16);
FrecMax16=f16(I16);

f17 = Fs1*(0:(length(t17)/2))/length(t17);
FrecMax17=f17(I17);

f18 = Fs1*(0:(length(t18)/2))/length(t18);
FrecMax18=f18(I18);

%Cálculo de la velocidad del coche
cad=1.403; %Constante adiabática del aire
m=0.029; %Masa molecular del aire, en kg/mol
T=input('Introduzca temperatura del aire en ºC:')
T=T+273.15;
R=8.314; %J/mol*K
vson=sqrt((cad*R*T)/m);
h=linspace(h,h,4);
FrecAntes=[FrecMax11,FrecMax12,FrecMax13,FrecMax14];
FrecDespues=[FrecMax15,FrecMax16,FrecMax17,FrecMax18];
u1=(h.^2+x1.^2).^(1/2);
u2=(h.^2+x2.^2).^(1/2);
%No calcularemos las velocidades usando los intervalos que estén próximos
%al punto de grabación, dado que puede llevarnos a errores debido al corte
%de audio
v2=(vson*(FrecMax13-FrecMax16))/(((FrecMax16*x2(2))/u2(2))-((FrecMax13*x1(3))/u1(3)))*3.6;
v3=(vson*(FrecMax12-FrecMax17))/(((FrecMax17*x2(3))/u2(3))-((FrecMax12*x1(2))/u1(2)))*3.6;
v4=(vson*(FrecMax11-FrecMax18))/(((FrecMax18*x2(4))/u2(4))-((FrecMax11*x1(1))/u1(1)))*3.6;


%Representación gráfica de las frecuencias en función de la posición
x=[x1,x2];
x=x';
Frec=[FrecAntes,FrecDespues];
Frec=Frec';
f = fit(x,Frec,'smoothingspline');
ax2=nexttile
plot(f,x,Frec)
title(ax2,'Frecuencia detectada en función de la posición de la fuente');
xlabel(ax2,'Posición del vehículo (m)');
ylabel(ax2,'Frecuencia detectada por el observador(Hz)');
v=(v2+v3)/2

%Graficar transformada
%Gráfica de las transformadas
figure()
t=tiledlayout(4,2);
ylim([1460 1540])
a1=nexttile;
plot(f11,P11) 
title(a1,'ff1')
xlabel('f(Hz)')
ylabel('Potencia(W)')
xlim([0 3000])
a2=nexttile;
plot(f15,P15) 
title(a2,'ff5')
xlabel('f(Hz)')
ylabel('Potencia(W)')
xlim([0 3000])
a3=nexttile;
plot(f12,P12) 
title(a3,'ff2')
xlabel('f(Hz)')
ylabel('Potencia(W)')
xlim([0 3000])
a4=nexttile;
plot(f16,P16)
xlabel('f(Hz)')
ylabel('Potencia(W)')
xlim([0 3000])
a5=nexttile;
plot(f13,P13) 
title(a5,'ff3')
xlabel('f(Hz)')
ylabel('Potencia(W)')
xlim([0 3000])
a6=nexttile;
plot(f17,P17) 
title(a6,'ff7')
xlabel('f(Hz)')
ylabel('Potencia(W)')
xlim([0 3000])
a7=nexttile;
plot(f14,P14) 
title(a7,'ff4')
xlabel('f(Hz)')
ylabel('Potencia(W)')
xlim([0 3000])
a8=nexttile;
plot(f18,P18) 
title(a8,'ff8')
xlabel('f(Hz)')
ylabel('Potencia(W)')
xlim([0 3000])
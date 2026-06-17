close all
clear all
%
%Señal captada entre -10 y -5 metros
%
%Leer el archivo de la señal de audio
info1= audioinfo("bocina.m4a")
[y,Fs1] = audioread("bocina.m4a");
t1 = 0:seconds(1/Fs1):seconds(info1.Duration);
t1 = t1(1:end);
%Aplicar la transformada de Fourier
FT1=fft(y);
P2 = abs(FT1/info1.TotalSamples);
P1 = P2(1:info1.TotalSamples/2+1);
P1(2:end-1) = 2*P1(2:end-1);
[M1,I1] = max(P1)
%Graficar señal original
plot(t1,y)
xlabel('Time')
ylabel('Audio Signal')
%Graficar transformada
figure()
f1 = Fs1*(0:(info1.TotalSamples/2))/info1.TotalSamples;
FrecMax1=f1(I1)
plot(f1,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P2(f)|')
%
%Señal captada entre 5 y 10 metros
%
%Leer el archivo de la señal de audio
info2= audioinfo("bocina.m4a")
[x,Fs2] = audioread("bocina.m4a");
t2 = 0:seconds(1/Fs2):seconds(info2.Duration);
t2 = t2(1:end);
%Aplicar la transformada de Fourier
FT2=fft(x);
P4 = abs(FT2/info2.TotalSamples);
P3 = P4(1:info2.TotalSamples/2+1);
P3(2:end-1) = 2*P3(2:end-1);
[M2,I2] = max(P3)
%Graficar señal original
plot(t2,x)
xlabel('Time')
ylabel('Audio Signal')
%Graficar transformada
figure()
f2 = Fs2*(0:(info2.TotalSamples/2))/info2.TotalSamples;
FrecMax2=f2(I2)
plot(f2,P3) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f2 (Hz)')
ylabel('|P3(f)|')

%
%Cálculo de la velocidad del coche
%
cad=1.403; %Constante adiabática del aire
m=0.029; %Masa molecular del aire, en kg/mol
T=input('Introduzca temperatura del aire en ºC:')+273.15
R=8.314; %J/mol*K
vson=sqrt((cad*R*T)/m)
v=vson*((FrecMax1-FrecMax2)/(FrecMax1+FrecMax2))
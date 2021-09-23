clc; 
clear all; 
close all; 
%parameter 
fm=2000; 
fc=100000; 
am=1; %p2p amplitude for message signal 
ac=2; %%p2p amplitude for carrier signal 
t=0:1/(10*fc):100/fc; 
A=am*ac; %Amplitude of Modulated signal 
%carrier and message signal 
m=am*cos(2*pi*t*fm); 
c=ac*cos(2*pi*t*fc); 
%program for DSB-SC modulated signal 
yt=A*cos(2*pi*fc*t).*sin(2*pi*fm*t); 
figure() %for A 1) 
subplot(2,1,1); 
plot(t,yt) 
title(' modulated signal '); 
xlabel(' time '); 
ylabel(' Amplitude '); 
subplot(2,1,2); 
plot(t,m) 
title(' message signal '); 
xlabel(' time '); 
ylabel(' Amplitude '); 
figure()%for power signal 
subplot(2,1,1)
periodogram(yt,hamming(length(yt)),[],10*fc,'centered','power') 
ylim([-150 0]) 
subplot(2,1,2) 
periodogram(yt,hamming(length(yt)),[],10*fc,'centered','psd') 
[Pxx_hamming,F] = periodogram(yt,hamming(length(yt)),[],10*fc,'psd'); power_freqdomain = bandpower(Pxx_hamming,F,'psd') 

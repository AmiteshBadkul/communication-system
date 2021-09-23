clc; 
clear all; 
close all; 
fc = 100000; 
t = 0:1/(10*fc):6000*(1/(10*fc)); 
fs=(10*fc); 
fm = 2000; 
Ac=2; 
Am=1; 
xC = Ac*sin(2*pi*fc.*t); 
xM = Am*sin(2*pi*fm.*t); 
% Modulation 
y = xM.*xC; 
% De-Modulation By Synchoronous Method 
m = (y.*xC)./(Ac*Ac); 
% Filtering High Frequencies 
[n,w] = buttord(2/1000,4/1000,.5,5); 
[a,b] = butter(n,w,'low'); 
dem = filter(a,b,m); 
subplot(3,1,1); 
plot(t,xM,'r'); 
title('m(t) & c(t)'); 
ylabel('amplitude');xlabel('time'); 
grid; 
subplot(3,1,2); 
plot(t,m); 
title('De-Modulated'); 
ylabel('amplitude');xlabel('time'); 
subplot(3,1,3) 
fftSignal = fft(m); 
n=length(m); 
fftSignal = fftshift(fftSignal); 
f=-fs/200:fs/(100*n-100):fs/200; 
plot(f,abs(fftSignal)) 
title('de-modulated signal in frequency domain' ) 
ylabel('amplitude');xlabel('frequency'); 
grid; 
figure() 
plot(t,dem) 
title('filtered signal'); 
ylabel('amplitude');xlabel('time'); 
grid;

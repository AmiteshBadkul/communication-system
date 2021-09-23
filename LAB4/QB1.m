clc; 
clear all; 
close all; 
fc = 100000; 
t = 0:1/(10*fc):600*(1/(10*fc)); 
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
subplot(2,2,1); 
plot(t,xC,'b',t,xM,'r'); 
title('m(t) & c(t)'); 
ylabel('amplitude');xlabel('time'); 
grid; 
subplot(2,2,2); 
plot(t,y,'k'); 
title('DSBSC'); 
ylabel('amplitude');xlabel('time'); 
grid; 
subplot(2,2,3); 
plot(t,m); 
title('De-Modulated'); 
ylabel('amplitude');xlabel('time'); 
subplot(2,2,4) 
fftSignal = fft(m); 
n=length(m); 
fftSignal = fftshift(fftSignal); 
f=-fs/200:fs/(100*n-100):fs/200; 
plot(f,abs(fftSignal)) 
title('de-modulated signal in frequency domain' )
ylabel('amplitude');xlabel('time'); 
grid;

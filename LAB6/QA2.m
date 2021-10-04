clc

Fs = 200000;
dt = 1/Fs; stoptime = 0.005;


t = (0:dt:stoptime-dt); N = size(t);

Am = 1;
Ac = 3;
fm = 2000;
fc = 10000;
kp = 2*pi;

m = Am*sin(2*pi*fm*t); c = Ac*cos(2*pi*fc*t);
s = Ac*cos(2*pi*fc*t + kp*m);

mfft = fftshift(fft(m))/N(2); cfft = fftshift(fft(c))/N(2); sfft = fftshift(fft(s))/N(2);

P1 = abs(mfft); P2 = abs(cfft); P3 = abs(sfft);

Pd1 = 10*log(P1); Pd2 = 10*log(P2); Pd3 = 10*log(P3);
f = -(Fs/2):1/(stoptime-dt):Fs/2+1; subplot(3,1,1);
plot(f,Pd1);
title("Message signal"); xlabel("Frequency"); ylabel("Amplitude (in dB)");

subplot(3,1,2);
plot(f,Pd2);

title("Carrier signal"); xlabel("Frequency"); ylabel("Amplitude (in dB)");

subplot(3,1,3);
plot(f,Pd3); title("Modulated signal"); xlabel("Frequency"); ylabel("Amplitude (in dB)");

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

h_s = hilbert(s);
instantaneous_phase = unwrap(angle(h_s)); demodulated_m = (instantaneous_phase - 2*pi*fc*t)/kp;

dfft = fftshift(fft(demodulated_m))/N(2); P2 = abs(dfft);
Pd2 = 10*log(P2);

subplot(2,1,1);
plot(f,Pd1);

title("Message signal spectra"); xlabel("Frequency"); ylabel("Amplitude");

subplot(2,1,2);
plot(f,Pd2);
title(" Demodulated message signal spectra"); xlabel("Frequency");
ylabel("Amplitude");

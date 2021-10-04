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

subplot(2,1,1);
plot(t,m); title("Message signal"); xlabel("Time");

ylabel("Amplitude");

subplot(2,1,2);
plot(f,Pd2);
title(" Demodulated message signal"); xlabel("Time");
ylabel("Amplitude");

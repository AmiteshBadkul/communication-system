Fs = 1000000;
tau = 0.5*T;
t = 0:1/Fs: 10*T;
N = size(t);

sampling_signal = 0.5*(square(2*pi*t/T, (tau/T)*100) + 1);
plot (t, sampling_signal)
title("Sampling signal ");
xlabel("time");
ylabel("Amplitude");

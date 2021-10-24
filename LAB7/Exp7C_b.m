Fs = 1000000;fm = 2000;
T = 1/20000;
tau = 0.02*T;
t = 0:1/Fs:10*T;
N = size(t);
sampling_signal = 0.5*(square(2*pi*t/T,(tau/T)*100) + 1);
m = sin(2*pi*fm*t);
sampled_signal = sampling_signal.*m;
samp_fft = fftshift(fft(sampling_signal)/N(2));
sfft = fftshift(fft(sampled_signal)/N(2));
P1 = abs(samp_fft);
P2 = abs(sfft);
f = -(Fs/2):(1/(10*T)):(Fs/2)+1;
filter = [];
size_f = size(f);
for i = 1:size_f(2)
if abs(f(i)) <= 2000
filter(i) = 1;
else
filter(i) = 0;
end
end
recovered_signal_spectra = filter.*fftshift(fft(sampled_signal));
recovered_signal = ifft(recovered_signal_spectra);
plot(t,recovered_signal);
title("Recovered signal");
xlabel("Time");
ylabel("Amplitude");
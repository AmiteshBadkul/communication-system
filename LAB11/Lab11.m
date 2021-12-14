bits = randi([0 1], 1, 100);
fs = 10000;
dt = 1/fs;
N = 0.1/dt;
t = 0:dt:1;

mt = zeros(1, length(t));
for i = 1:100
    if bits(i) == 0
        mt(1+(i-1)*N:i*N) = -5;
    else
        mt(1+(i-1)*N:i*N) = 5;
    end
end

c1t = 3*sin(2*pi*50*t);

subplot(311);
plot(t, mt);
title('Message Signal');
subplot(312);
plot(t, c1t);
title('Carrier Signal');

modt = c1t.*mt
subplot(313);
plot(t, modt);
title('BPSK Signal');

f = -fs/2:fs/2;
ms = abs(fftshift(fft(mt*fs)));
c1s = abs(fftshift(fft(c1t*fs)));
mods = abs(fftshift(fft(modt*fs)));

figure();
subplot(311);
plot(f, ms);
title('Message Signal Spectrum');
subplot(312);
plot(f, c1s);
title('Carrier Signal Spectrum');
subplot(313);
plot(f, mods);
title('BPSK Signal Spectrum');

msdb = 10*log10(ms);
c1sdb = 10*log10(c1s);
modsdb = 10*log10(mods);

figure();
subplot(311);
plot(f, msdb);
title('Message Signal Spectrum in dB');
subplot(312);
plot(f, c1sdb);
title('Carrier Signal Spectrum');
subplot(313);
plot(f, modsdb);
title('BPSK Signal Spectrum in dB');

figure();

for i = 1:length(t)
    if c1t(i)*modt(i) > 0
        d(i) = 1;
    else
        d(i) = 0;
    end
end
plot(t, d);
title('Demodulated Signal');

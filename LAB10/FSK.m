bits = randi([0 1], 1, 10);
fs = 10000;
dt = 1/fs;
N = 0.1/dt;
t = 0:dt:1;

mt = zeros(1, length(t));
for i = 1:10
    if bits(i) == 0
        mt(1+(i-1)*N:i*N) = -5;
    else
        mt(1+(i-1)*N:i*N) = 5;
    end
end

c1t = 3*sin(2*pi*50*t);
c2t = 3*sin(2*pi*90*t);

modt = zeros(1, length(t));
for i =1:length(t)
    if mt(i) == 5
        modt(i) = c1t(i);
    else
        modt(i) = c2t(i);
    end
end

subplot(411);
plot(t, mt);
title('Message Signal');
subplot(412);
plot(t, c1t);
title('Carrier Signal 1');
subplot(413);
plot(t, c2t);
title('Carrier Signal 2');
subplot(414);
plot(t, modt);
title('FSK Signal');

modt = c1t.*(mt>0)

f = -fs/2:fs/2;
ms = abs(fftshift(fft(mt*fs)));
c1s = abs(fftshift(fft(c1t*fs)));
c2s = abs(fftshift(fft(c2t*fs)));
mods = abs(fftshift(fft(modt*fs)));

figure();
subplot(411);
plot(f, ms);
title('Message Signal Spectrum');
subplot(412);
plot(f, c1s);
title('Carrier Signal 1 Spectrum');
subplot(413);
plot(f, c2s);
title('Carrier Signal 2 Spectrum');
subplot(414);
plot(f, mods);
title('FSK Signal Spectrum');

msdb = 10*log10(ms);
c1sdb = 10*log10(c1s);
c2sdb = 10*log10(c2s);
modsdb = 10*log10(mods);

figure();
subplot(411);
plot(f, msdb);
title('Message Signal Spectrum in dB');
subplot(412);
plot(f, c1sdb);
title('Carrier Signal 1 Spectrum in dB');
subplot(413);
plot(f, c2sdb);
title('Carrier Signal 2 Spectrum in dB');
subplot(414);
plot(f, modsdb);
title('FSK Signal Spectrum in dB');

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



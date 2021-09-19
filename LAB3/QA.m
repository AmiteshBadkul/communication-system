fm = 2000;
fc = 100000;
Am = 2;
Ac = 6;
ta = 1/fm;
t1 = 0:ta/100:2*ta;
y1=Am*sin(2*pi*fm*t1); % message signal
y2=Ac*cos(2*pi*fc*t1); % carrier signal
eq=(Ac+Am.*y1).*cos(2*pi*fc*t1);
subplot(311);
plot(t1,y1);
axis([0, 1*10^-3, -2.5, 2.5]);
xlabel('Time');
ylabel('Amplitude');
title('Message signal')
subplot(312)
plot(t1,y2);
axis([0, 1*10^-3, -8, 8]);
xlabel('Time');
ylabel('Amplitude');
title('Carrier signal');
subplot(313);
plot(t1,eq);
plot(t1,eq,'r');
axis([0, 1*10^-3, -12, 12]);
xlabel('Time');
ylabel('Amplitude');
title('Modulated signal');
%%%%%spectra of the signals%%%%%%
N = length(t1);
sy1 = fft(y1,N);
sy2 = fft(y2,N);
sy3 = fft(eq,N);
z1 = sy1(1:(floor(N/2)+1));
z2 = sy2(1:(floor(N/2)+1));
z3 = sy3(1:(floor(N/2)+1));
k = 0:(floor(N/2));

figure
subplot(311);
stem(k,abs(z1));
axis([0, 10, 0, 202]);
title('Message signal spectrum');
subplot(312);
stem(k,abs(z2));
axis([60, 100, 0, 800]);
title('CArrier signal spectrum');
subplot(313);
stem(k,abs(z3));
axis([60, 100, 0, 800]);
title('AM signal spectrum');
clc;
clear all;
close all;
%
% All parameters given for the experiment
%
kf=5500;
am=1;
fm=2000;wm=2*pi*fm;
fc=10000;wc=2*pi*fc;
ac=3;
fs=10*fc;
t = 0:1/fs:1-1/fs;

s_m=am*sin(wm*t);
s_c=ac*sin(wc*t);

% A first part
% instantaneous angular velocity
wt = wc +kf.*s_m;
% frequency modulated signal

%Part C
%calculating delta f
del_f=kf*am;
fprintf("The delta f value is %0.2f",del_f);
phi_fm=ac*cos(wc*t+((del_f/fm)*sin(wm*t)));

%plot for part A
figure();
plot(t,phi_fm)
title("Frequency modulated signal");
xlabel("time");ylabel("amplitude");
ylim([-4 4])

%Part B
figure()
subplot(3,1,1)
plot(t,s_m)
title("Message signal");
xlabel("time");ylabel("amplitude");
subplot(3,1,2)
plot(t,s_c)
title("Carrier signal signal");
xlabel("time");ylabel("amplitude");
subplot(3,1,3)
plot(t,phi_fm)
title("Frequency modulated signal");
xlabel("time");ylabel("amplitude");

%Part F absolute
f = fs/2*linspace(-1,1,fs);
figure();
fft_m=fftshift(fft(s_m));
subplot(3,1,1)
plot(f,abs(fft_m))
title("Message signal non-shifted");
xlabel("frequency");ylabel("amplitude");
subplot(3,1,2)
fft_c=fftshift(fft(s_c));
plot(f,abs(fft_c))
title("Carrier signal signal non shifted");
xlabel("time");ylabel("Amplitude");
subplot(3,1,3)
fft_fm=fftshift(fft(phi_fm));
plot(f,abs(fft_fm))
title("Frequency modulated signal");
xlabel("time");ylabel("Amplitude");

%Part F dB scale

figure();
fft_m=fftshift(fft(s_m));
subplot(3,1,1)
plot(f,10*log(abs(fft_m)))
title("Message signal ");
xlabel("frequency");ylabel("amp in dB");
subplot(3,1,2)
fft_c=fftshift(fft(s_c));
plot(f,10*log(abs(fft_c)))
title("Carrier signal signal ");
xlabel("time");ylabel("Amplitude in dB");
subplot(3,1,3)
fft_fm=fftshift(fft(phi_fm));
plot(f,10*log(abs(fft_fm)))
title("Frequency modulated signal");
xlabel("time");ylabel("Amplitude in dB");

%PART I
beta=0.4377;
NBFM=cos(wc*t)+(beta/2)*cos(2*pi*(fc+fm)*t)-(beta/2)*cos(2*pi*(fc-fm)*t);
fft_NBFM=10*log(abs(fftshift(fft(NBFM))));
plot(t,fft_NBFM)
%part g
periodogram(phi_fm,hamming(length(phi_fm)),[],10*fc,'centered','psd')
[Pxx_hamming,F] = periodogram(phi_fm,hamming(length(yt)),[],10*fc,'psd');
power_freqdomain = bandpower(Pxx_hamming,F,'psd');
power_timedomain = sum(abs(phi_fm).^2)./length(phi_fm);
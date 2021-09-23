fftSignal = fft(yt); 
fftSignal = fftshift(fftSignal); 
%Next, calculate the frequency axis, which is defined by the sampling rate 
f = 5*fc*linspace(-1,1,length(yt)); 
plot(f, abs(fftSignal)); 
title('magnitude FFT of sine'); 
xlabel('Frequency (Hz)'); 
ylabel('magnitude'); 

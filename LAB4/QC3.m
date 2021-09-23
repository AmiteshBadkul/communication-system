figure() 
ft=fftshift(fft(upper_SSB_t)); 
n=length(upper_SSB_t); 
f=-fs/2:fs/(n-1):fs/2; 
plot(f,abs(ft))

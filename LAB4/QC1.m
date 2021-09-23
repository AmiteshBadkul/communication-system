clc; 
clear all; 
close all; 
fc = 100000; 
fs = 10*fc; 
t = (0:1/fs:500*(1/fs)); 
Am=1; 
Ac=2; 
fm=2000; 
m_t = Am*sin(2*pi*fm*t); 
c= Ac*sin(2*pi*fc*t); 
initialPhase = 0; 
hil_mt=hilbert(m_t); 
upper_SSB_t = m_t.*cos(2*pi*fc*t) + hil_mt.*sin(2*pi*fc*t); 
lower_SSB_t = m_t.*cos(2*pi*fc*t) - hil_mt.*sin(2*pi*fc*t); 
subplot(3,1,1) 
plot(t,m_t) 
title(' the message signal is'); 
ylabel('amplitude');xlabel('time'); 
subplot(3,1,2) 
plot(t,upper_SSB_t) 
title(' the (upper) SSB-SC signal is'); 
ylabel('amplitude');xlabel('time'); 
subplot(3,1,3) 
plot(t,lower_SSB_t) 
title(' the (lower) SSB-SC signal is'); 
ylabel('amplitude');xlabel('time');

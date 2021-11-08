clc;
clear all;
close all;
fc=10000;
fs=10*fc;
fm=2000;
t=0:1/fs:0.9;
am=1;
ac=1;
c_t=t;
a_saw=2;
m_t=am*sin(2*pi*fm*t);
m_saw=a_saw*sawtooth(2*pi*fc*t);
f = fs/2*linspace(-1,1,fs);
for i=1:length(t)
    if(i<length(t)/2)
        c_t(i)=1;
    else
        c_t(i)=0;
    end
end
m_pwm=1.*(m_saw<=m_t);
figure()
subplot(2,1,1)
hold on;
plot(t,m_t,'r');
plot(t,m_saw,'g');
ylim([-2 2]);
hold off;
subplot(2,1,2)
plot(t,m_pwm);
ylim([-0.05 1.4]);
m_ppm=zeros(1,length(t));
width=1/fs;
i=1;
while i<=(length(t)-3)
        
            m_ppm(i)=1;
            i=i+1;
            m_ppm(i)=1;
            i=i+1;
            m_ppm(i)=0;
            i=i+1;
            m_ppm(i)=0;
            i=i+1;
end
i=1;
while i<=(length(t)-3)
        
           if m_pwm(i)==0
            m_ppm(i)=1;
            i=i+1;
            m_ppm(i)=1;
            i=i+1;
           else
            m_ppm(i)=0;
            i=i+1;
            m_ppm(i)=0;
            i=i+1;
           end
end
figure()
subplot(2,1,1)
hold on;
plot(t,m_t,'r');
plot(t,m_saw,'g');
ylim([-2 2]);
xlim([0 0.001]);
hold off;
subplot(2,1,2)
plot(t,m_ppm);
ylim([-0.05 1.4]);
xlim([0 0.01]);
figure()
M_T=mag2db(abs(fftshift(fft(m_t))));
M_PWM=mag2db(abs(fftshift(fft(m_pwm))));
subplot(2,1,1)
stem(f(1:90001),M_T);
title('spectrum of message in db when fc=10000');
xlabel('frequency in hertz');
ylabel('magnitude in db');
subplot(2,1,2)
stem(f(1:90001),M_PWM);
title('spectrum of message in db when fc=10000');
xlabel('frequency in hertz');
ylabel('magnitude in db');
figure()
M_T=mag2db(abs(fftshift(fft(m_t))));
M_PPM=mag2db(abs(fftshift(fft(m_ppm))));
subplot(2,1,1)
stem(f(1:90001),M_T);
title('spectrum of message in db when fc=10000');
xlabel('frequency in hertz');
ylabel('magnitude in db');
subplot(2,1,2)
stem(f(1:90001),M_PPM);
title('spectrum of message in db when fc=10000');
xlabel('frequency in hertz');
ylabel('magnitude in db');

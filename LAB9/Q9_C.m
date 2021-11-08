figure()
deppm=demod(m_ppm,fc,fs,'pwm','centered');
depwm=demod(m_pwm,fc,fs,'ppm',0.5);
subplot(3,1,1)
plot(t,m_t);
title('message signal at fc=10KHz');
xlabel('time');
ylabel('amplitude');
subplot(3,1,2)
plot(t(1:9001),deppm);
title('demodulated ppm signal at fc=10KHz');
xlabel('time');
ylabel('amplitude');
subplot(3,1,3)
plot(t(1:9001),depwm);
title('demodulated pwm signal at fc=10KHz');
xlabel('time');
ylabel('amplitude');

clc;
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
del_f=kf*am;
phi_fm=ac*cos(wc*t+((del_f/fm)*sin(wm*t)));
%part A diffrentiating FM signal
figure();
diff_fm=diff(phi_fm);
z=zeros(1,1);
diff_fm=[diff_fm z];
plot(t,diff_fm)
title("diffrentiated Frequency modulated signal");
xlabel("time");ylabel("amplitude");
%part B passing it to an envelope
figure();
fm_env=abs(diff_fm);
plot(t,fm_env)
title("diffrentiated Frequency modulated signal sent through an envelope"); xlabel("time");ylabel("amplitude");
%Part C filtering using lowpass filter
figure();
fm_filtered=lowpass(fm_env);
plot(t,fm_filtered);
%Part D final plot
figure();
subplot(2,1,1)
plot(t,fm_filtered);
title('Demodulated signal')
xlabel("time");ylabel("amplitude");
subplot(2,1,2)
plot(t,s_m);
title('Message signal')
xlabel("time");ylabel("amplitude");
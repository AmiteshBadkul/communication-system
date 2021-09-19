t = 0:0.001:5;
fH  = 100;
fL = 2;
Ah = 6;
Al = 2;
xH = Ah*sin(2*pi*fH.*t);
xL = Al*sin(2*pi*fL.*t);
% Modulation
y = xL.*xH;
% De-Modulation By synchronous method
m = (y.*xH)./(Ah*Ah);
% Filtering high frequencies
[n,w] = buttord(2/1000,4/1000,.5,5);
[a,b] = butter(n,w,'low');
dem = filter(a,b,m);
subplot(2,2,1);
plot(t, xH, 'b', t, xL, 'r');
title('m(t) & c(t)');
grid;
subplot(2,2,2);
plot(t,y,'k');
title('DSBC');
grid;
subplot(2,2,3);
plot(t,m);
title('De-Modulated');
grid;
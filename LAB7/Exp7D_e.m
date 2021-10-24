T = 1/70;
x_c = cos(2*pi*10 * t);
nmin = ceil(tmin / T);
nmax = floor(tmax / T);
n = nmin:nmax;
x1 = cos(2*pi*f * n*T);
plot(t, x_c)
hold on
plot(n*T, x1, 'o')
hold off

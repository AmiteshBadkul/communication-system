T = 1/70;
nmin = ceil(tmin / T);
nmax = floor(tmax / T);
n = nmin:nmax;
x_c = cos(2*pi*f * n*T);
plot(n*T,x_c)
hold on
plot(n*T,x_c,'.')
hold off 
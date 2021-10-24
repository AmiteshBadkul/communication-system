f = 60;  % Hz
tmin = -0.05;
tmax = 0.05;
t = linspace(tmin, tmax, 400);
x_c = cos(2*pi*f * t);
plot(t,x_c)
xlabel('t (seconds)')

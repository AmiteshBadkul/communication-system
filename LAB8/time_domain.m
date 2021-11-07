clear;
clc;
N = 10;
input = randi([0, 1], 1, N)

%Input plot
ip_plot = [input input(10)];
t1 = linspace(0, 1, N+1);

subplot(511);
stairs(t1, ip_plot, 'black', 'linewidth',3)
title('Input');
% input plot end

% NRZ-L start
lc1 = input - 0.5 ;
lc11 = 2*[lc1 lc1(N)];
subplot(512);
stairs(t1, lc11, 'black', 'linewidth',3)
title('NRZ-L');
xlim([0 1])
% NRZ-L end

% Bi phi-L start
t3 =  linspace(0, 1, 2*N +1);
lc2 = zeros([1 2*N]);
for i = 1:N
    if (input(i) == 0)
        lc2(2*i-1) = -1;
        lc2(2*i) = 1;

    else
        lc2(2*i-1) = 1;
        lc2(2*i) = -1;  
    end    
end
lc2 = [lc2 lc2(2*N)];
subplot(513);
stairs(t3, lc2, 'black', 'linewidth',3)
title('Bi phi-L');
% Bi phi-L end

% RZ-AMI start
lc3 = zeros([1 N]);
k = -0.5;
for i = 1:10
    if(input(i) == 1)
        lc3(i) = k * input(i);
        k = -k;
    else
        lc3(i) = input(i);
    end
end
lc33 = zeros([1 2*N]);
t2 = linspace(0, 1, 2*N +1);
for i = 1:2*N
    if (mod(i,2) ~= 0)
        j = floor(i/2) + 1;
        lc33(i) = lc3(j);
    else
        lc33(i) = 0;
    end
end
lc33 = [lc33 lc33(2*N)];
subplot(514);
stairs(t2, lc33, 'black', 'linewidth',3)
title('RZ-AMI');
% RZ-AMI end

% NRZ-M start
lc4 = zeros([1 N]);
if (input(1) == 1)
    lc4(1) = 1;
end

for i = 2:N
    if(input(i) == 1)
        lc4(i) = 1 - lc4(i-1);
    else
        lc4(i) = lc4(i-1);
    end
end
subplot(515);
lc44 = [lc4 lc4(N)];
stairs(t1, lc44, 'black', 'linewidth',3)
title('NRZ-M');
% NRZ-M end


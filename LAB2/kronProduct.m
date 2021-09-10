% Taking user input for Matrix A
m = input('m ');
n = input('n ');

for i=1:1:n
    for j=1:1:n
        a(i,j) = input('Aij ');
    end
end
a = reshape(a,m,n);
% Taking user input for Matrix B

p = input('p ');
q = input('q ');
for i=1:1:p
    for j=1:1:q
        b(i,j) = input('Bij ');
    end
end
b = reshape(b,p,q);

for i = 1:size(a, 1)
    for j = 1:size(a, 2)
        AB(i, j) = a(i, j) * b;
    end
end

AB = cell2mat(AB);
disp(AB)


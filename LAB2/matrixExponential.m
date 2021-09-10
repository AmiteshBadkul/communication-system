function[C] = matrixExponential(A)
    C = A;
    temp_A = A;
    for i=2:1:10
        C = C + matmul(temp_A, A)/factorial(i);
    end
end

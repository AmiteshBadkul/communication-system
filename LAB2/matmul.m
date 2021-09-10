function [C] = matmul(A,B)
   [m,n] =  size(A);
   [k,l] =  size(B);
   if(n~=k)
       C=[];
       disp('Error');
       return 
   end
   C = A*B;
end
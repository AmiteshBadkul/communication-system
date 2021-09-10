function [val] = GaussianRandomVector(n)
    randomVec = randn(1,n);
    for i=1:1:n
        val = val + randomVec(i);
    end
    
    val = val/n;
end
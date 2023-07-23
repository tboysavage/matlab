function M = mybisect(f,a,b,maxit)
    L = a;
    R = b;
    for k=1:maxit
        M = (L+R)/2;
        if f(L) * f(M) <0
            R = M;
        else
            L = M;
        end
    end
end

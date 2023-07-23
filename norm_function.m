function y = norm_function(v,p)
    if p == 'inf'
        y = max(abs(v));
    else
        y = sum(abs(v).^p).^(1/p);
    end    
end
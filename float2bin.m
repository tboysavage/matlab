function [b,ex] = float2bin(f,t)
t= t+1;
integral_part = dec2bin(abs(f));
floating_part = dec2bin(mod(abs(f),1) * 2^100, 100);
if integral_part~='0'
    b = [integral_part '.' floating_part(1:t)];
    ex = 0;
else
    ex = 1-length(floating_part(1:strfind(floating_part,'1')));
    b = [integral_part '.' floating_part(-(ex-1):(t-ex))];
end

end


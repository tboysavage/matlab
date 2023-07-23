function [Minf,E0,oneplus,E1] = float_m_e0(a,k_plus,k_minus,t)
Minf = (a^k_plus)*(1-a^(-t));
E0 = a^(k_minus-1);
E1 = a^(1-t);
oneplus = 1 + (a^(1-t));
end
function [pdr] = compute_pdr(r,s,n,p)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
pdr = 0.626-(0.270*r)+(0.179*r*s)-(0.133*n)-(0.119*s*n)-(0.212*s*s)-(0.059*s)+(0.053*p)+(0.047*r*p)+(0.144*n*n)-(0.096*r*r)-(0.021*p*p);
end


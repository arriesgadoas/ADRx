function [sf,pow] = get_sf_power(radius,nodes)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
radius = (radius-3)/2;
nodes = (nodes-125)/75;
for i = 1:length(radius)
    syms r s n;
    
    out = expand(0.39+(-0.20*r)+(-0.18*s)+(-0.07*n)+(-0.09*r*r)+(0.18*r*s)+(-0.14*s*s)+(0.11*n*n));
    r = radius(i);
    n = nodes(i);
    out=subs(out);

    syms f(s)
    f(s) = out;
    Dfs = diff(f,s);
    
    sol = solve([Dfs(s)],s);
    
    sf_temp = sol;
    sf_temp = vpa(sf_temp,3);
    
    if sf_temp < -1
        sf(i) = -1;
    elseif sf_temp >1
        sf(i) = 1;
    else
        sf(i) = sf_temp;
    end 
    
    
    pow_temp = 1;
    pow(i) = pow_temp;
    
    
end 



end 

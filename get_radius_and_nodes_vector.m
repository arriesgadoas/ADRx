function [R,N] = get_radius_and_nodes_vector(radius,nodes,distance)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
min=1;
delta=1;
bins = ((radius-min)/delta)+1;
R = linspace(min,radius,bins);
N = zeros(1,length(R));
for i=1:nodes
    temp_distance = distance(i)/1000;
    idx =(R-temp_distance)>=0 & (R-temp_distance)<1;
    index = find(idx==1,1);
    N(index)=N(index)+1;
end


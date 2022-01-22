function [sf_alloc2, power_alloc2] = assign_sf_and_power(radius_of_each_cell,number_of_nodes_per_cell, distance_vector)
%UNTITLED6 Summary of this function goes here
%  Detailed explanation goes here
%     nodes = sum(number_of_nodes_per_cell);
%     [sf_of_cell,power_of_cell]=get_sf_power(radius_of_each_cell,number_of_nodes_per_cell);
%     
%     for i = 1:nodes
%        radius = floor(distance_vector(i)/1000)+1;
%        
%        
%        sf_alloc2(i)=sf_of_cell(radius);
%        power_alloc2(i)=power_of_cell(radius);
%     end
%     
%     sf_alloc2 = (12-floor((sf_alloc2*2.5)+9.5))';
%     power_alloc2 = (floor((power_alloc2*6)+8))';
% end
[SF,POW]=get_sf_power(radius_of_each_cell,number_of_nodes_per_cell);
R = radius_of_each_cell;
N = number_of_nodes_per_cell;
SF_index = floor((SF*2.5)+9.5);
POW_index = floor((POW*6)+8);
nodes = sum(number_of_nodes_per_cell);
for i=1:nodes
    radius_array(i,1) = floor(distance_vector(i)/1000)+1;
    radius_array(i,2) = i;
    sf_alloc(i) = SF_index(radius_array(i,1));
    power_alloc2(i) = POW_index(radius_array(i,1))';
end
unique_SFs = unique(sf_alloc);
radius_array = sortrows(radius_array);

sf_alloc2 = zeros(nodes,1);

for n = 1:length(R)
        start_index=0;
        ctr =0;
        temp = find(radius_array(:,1)==n);
        for i=start_index+1:start_index+(ceil(0.45*N(n)))
            if ctr == N(n)
                break;
            end
            sf_alloc2(radius_array(temp(i),2))=SF_index(n);
            start_index = i;
            ctr = ctr +1;
        end

        for i=start_index+1:start_index+(ceil(0.27*N(n)))
            if ctr == N(n)
                break;
            end
            sf_alloc2(radius_array(temp(i),2))=SF_index(n)+1;
            start_index = i;
            ctr = ctr +1;
        end

        for i=start_index+1:start_index+(ceil(0.14*N(n)))
            if ctr == N(n)
                break;
            end
            sf_alloc2(radius_array(temp(i),2))=SF_index(n)+2;
            start_index = i;
            ctr = ctr +1;
        end

        for i=start_index+1:start_index+(ceil(0.08*N(n)))
            if ctr == N(n)
                break;
            end
            sf_alloc2(radius_array(temp(i),2))=SF_index(n)+3;
            start_index = i;
            ctr = ctr +1;
        end

        for i=start_index+1:start_index+(ceil(0.04*N(n)))
            if ctr == N(n)
                break;
            end
            sf_alloc2(radius_array(temp(i),2))=SF_index(n)+4;
            start_index = i;
            ctr = ctr +1;
        end

        for i=start_index+1:start_index+(ceil(0.01*N(n)))
            if ctr == N(n)
                break;
            end
            sf_alloc2(radius_array(temp(i),2))=SF_index(n)+5;
            start_index = i;
            ctr = ctr +1;
        end
        %end
end
sf_alloc2(sf_alloc2>12) = 12;
sf_alloc2 = 12-sf_alloc2;


%ED_distribution - generates the coordinates of the EDs
%
% Syntax:  [cood_cartesian,cood_polar] = km_LoRaWAN_model_ED_distribution(input_number_devices,mode)
%
% Inputs:
%    input_number_devices - number of EDs
%    mode - mode of operation, 0 - normal, other values - different test
%
% Outputs:
%    cood_cartesian - cartesian 2D coordinates (distances are in meters)
%    cood_polar - polar 2D coordinates (distances are in meters)

function [cood_cartesian,cood_polar] = km_LoRaWAN_model_ED_distribution(input_number_devices,mode,input_radius)
    if(mode==0)%normal operation
        %rmin=(input_radius-0.05)*10^3;%EDs equidistant frm the center of circle with R = input_radius in meters
       % rmin = (input_radius*10^3) - 50;
        rmin = (input_radius-1)*10^3;
        %rmax=9*10^3; %maximum radius in meters
        rmax=input_radius*10^3;
        cood_cartesian=zeros(input_number_devices,2);
        cood_polar=zeros(input_number_devices,2);
        for i=1:input_number_devices
            while 1
               cood_cartesian(i,1)=(rand(1,1)-0.5)*2*rmax;%ordinate
               cood_cartesian(i,2)=(rand(1,1)-0.5)*2*rmax;%abscissa
               [cood_polar(i,1),cood_polar(i,2)]=cart2pol(cood_cartesian(i,1),cood_cartesian(i,2));
               if (cood_polar(i,2)>=rmin) && (cood_polar(i,2)<=rmax)
                    break
               end
            end
        end
    end
end


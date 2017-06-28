function [cylinderRE, cylinderCDY, sphereRE, sphereCDY] = fcnRECURVE()
% This function develops a log interpolation of CD for a range RE values
% for both a cylinder and sphere
%
% INPUTS : N/A
%
% OUTPUTS
%   cylinderRE - a vector of 100 interpolated cylinder RE values
%   sphereRE - a vector of 1000 interpolated sphere RE values
%   cylinderCDY - a vector of 100 interpolated cylinder drag values
%   sphereCDY - a vector of 1000 interpolated sphere drag values

% RE to CDY relationship from fig 4.6 in McCormick & fig. 3.18 in Katz &
% Plotkin
tempRE_SPHERE=[0.2 0.4 1 2 6 10 30 10^2 400 2000 10000 100000 400000 1000000 6000000];
tempCDY_SPHERE=[10^2 60 25 15 6 4 2 1 0.6 0.4 0.4 0.4 0.27 0.16 0.2];
tempRE_CYLINDER=[0.1 0.3 1 3 10 40 100 300 1000 10000 100000 300000 480000 1000000];
tempCDY_CYLINDER=[60 25 10 4 3 2 1.8 1 1 1 1 1 0.28 0.45];

% Use logarithmic interpolation to develops a database of RE to CD values
temp1 = ceil(log10(tempRE_CYLINDER(1))) - 1;
temp2 = ceil(log10(tempRE_CYLINDER(end)));
cylinderRE = logspace(temp1, temp2, 100);   
cylinderCDY = interp1(tempRE_CYLINDER, tempCDY_CYLINDER, cylinderRE, 'pchip', 'extrap');

temp1 = ceil(log10(tempRE_SPHERE(1))) - 1;
temp2 = ceil(log10(tempRE_SPHERE(end)));
sphereRE = logspace(temp1, temp2, 1000);
sphereCDY= interp1(tempRE_SPHERE, tempCDY_SPHERE, sphereRE, 'pchip', 'extrap');
end


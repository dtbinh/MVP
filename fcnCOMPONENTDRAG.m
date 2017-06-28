function [valD] = fcnCOMPONENTDRAG(flowV, flowRHO, flowMU, valRADIUS, valAREA, databaseRE, databaseCDY)
% This function calculates the drag of a cylinder
%
% INPUTS
%   flowV, flowRHO, flowMU - Flow properties
%   valRADUIS, valAREA - Component geometry
%   cylinderRE - Reynolds number database for cylinder
%   cylinderCD - Drag coefficicent database for cylinder
%
% OUTPUTS
%   valD - Drag force value of given component

% Calculate Reynolds number
Re=flowV*flowRHO*2*valRADIUS/flowMU;

% Interpolate CD for calculated RE
tempCD = interp1(databaseRE,databaseCDY,Re,'pchip', 'extrap');

% Calculate Drag Force Value
valD=0.5*tempCD*flowRHO*flowV^2*valAREA; 

end


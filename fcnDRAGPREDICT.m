function [powerPARASITIC, dragVEHICLE, dragARM, dragLEG, dragBODY, dragMOTOR, dragPAYLOAD] = fcnDRAGPREDICT(geomNumROTORS, flowV, flowRHO, flowMU,cylinderRE, cylinderCDY, sphereRE, sphereCDY, areaARM, areaLEG, areaMOTOR, areaPAYLOAD, areaBODY, geomARMradius, geomLEGradius, geomMOTORradius, geomPAYLOADradius, geomBODYradius)
% This function calculates parasitic drag for each vehicle component and 
% calculates power of flyer body
%
% INPUTS
%   geomNumROTORS - number of rotors
%   flow - flow velocitiy, density and viscosity
%   component geom - each components area and radius
%   CDY databases
%
% OUTPUTS
%   powerPARASITIC - parasitic power required by each rotor
%   dragVEHICLE - parasitic drag of the entire vehicle
%   dragCOMPONENT - parasitic drag of each components

%% Calculations for component parasite drag
[dragARM] = fcnCOMPONENTDRAG(flowV, flowRHO, flowMU, geomARMradius, areaARM, cylinderRE, cylinderCDY);
[dragLEG] = fcnCOMPONENTDRAG(flowV, flowRHO, flowMU, geomLEGradius, areaLEG, cylinderRE, cylinderCDY);
[dragMOTOR] = fcnCOMPONENTDRAG(flowV, flowRHO, flowMU, geomMOTORradius, areaMOTOR, cylinderRE, cylinderCDY);
[dragPAYLOAD] = fcnCOMPONENTDRAG(flowV, flowRHO, flowMU, geomPAYLOADradius, areaPAYLOAD, cylinderRE, cylinderCDY);
[dragBODY] = fcnCOMPONENTDRAG(flowV, flowRHO, flowMU, geomBODYradius, areaBODY, sphereRE, sphereCDY);

%% TOTAL PARASITIC DRAG AND POWER
dragVEHICLE = geomNumROTORS*dragARM + 4*dragLEG + geomNumROTORS*dragMOTOR + dragPAYLOAD + dragBODY;
powerPARASITIC = dragVEHICLE*flowV/geomNumROTORS; % Parasitic power per rotor

end


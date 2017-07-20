function [vi_int,vi_self,skewRAD,wi] = fcnPREDICTRPM(geomDIAMETER,geomNumBLADES,rotorHUBLOCATIONS,rotorTHRUST,rotorAngINFLOW,rotorVelINFLOW,flowRHO,rotorRPM,geomNumROTORS)
% This function uses flow conditions, vehicle geometry, vehicle forces and
% rotor data to determine the mutual interference velocity of each rotor (WIM)
% then using the velocity data to change the rotor inflow conditions to 
% determine a more accurate RPM required for each rotor to maintain a given thrust.

[vi_int,vi_self,skewRAD,wi] = fcnWIM(geomDIAMETER,geomNumBLADES,rotorHUBLOCATIONS,rotorTHRUST,rotorAngINFLOW,rotorVelINFLOW,flowRHO,rotorRPM,geomNumROTORS);

end


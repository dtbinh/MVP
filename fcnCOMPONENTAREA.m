function [areaLEG, areaARM, areaBODY, areaPAYLOAD, areaMOTOR] = fcnCOMPONENTAREA( geomLEGlength, geomLEGradius, geomARMlength, geomARMradius, geomBODYradius, geomPAYLOADradius, geomPAYLOADlength, geomMOTORradius, geomMOTORheight)
% This function calculates the wetted area of each vehicle components
%
% INPUTS
%   The radius and length values of the legs, arms, body, payload and motor
%
% OUTPUTS
%   areaLEG, areaARM, areaBODY, areaPAYLOAD, areaMOTOR - wetted area of
%   each associated component

areaLEG = 2*geomLEGlength*geomLEGradius;
areaARM = 2*geomARMlength*geomARMradius;
areaBODY = pi*geomBODYradius^2;
areaPAYLOAD = 2*geomPAYLOADradius*geomPAYLOADlength;
areaMOTOR = 2*geomMOTORradius*geomMOTORheight;

end


clear,clc
strFILE = 'inputs/SkyRangerTMotor.txt';

% variables - atmospheric, component geometries, component masses
[seqV, flowTEMP, flowALT, flowRHO, flowMU, flowM, flowR, flowALPHAT, ...
    angCLIMBdeg, angSIDEdeg, numLEADROTOR, geomTypeROTOR, geomNumROTORS,...
    geomDIAMETER, geomNumBLADES, geomARMlength, geomARMradius, ...
    geomBODYheight, geomBODYradius, geomLEGlength, geomLEGradius, ...
    geomLEGcentreradius, geomLEGcentreheight, geomPAYLOADlength, ...
    geomPAYLOADradius, geomPAYLOADheight, geomMOTORheight, ...
    geomMOTORradius, geomHUBheight, geomCGheight, massMOTOR, massARM, ...
    massLEG, massPAYLOAD, massBODY, massVEHICLE] = fcnMVPREAD(strFILE);

% Calculate Reynolds number to CDY database for cylinder and sphere
[cylinderRE, cylinderCDY, sphereRE, sphereCDY] = fcnRECURVE();

% Calculate wetted area of each component
[areaLEG, areaARM, areaBODY, areaPAYLOAD, areaMOTOR] = ...
    fcnCOMPONENTAREA(geomLEGlength, geomLEGradius, geomARMlength, ...
    geomARMradius, geomBODYradius, geomPAYLOADradius, geomPAYLOADlength,...
    geomMOTORradius, geomMOTORheight);

% setup component coordinates - variable rotor number for various
% orientations (1-leading vs 2-leading)

% START VELOCITY SEQUENCE
for i = 1:size(seqV,1)
    flowV = seqV(i);  
    
    % Calculate the drag of each component
    [powerPARASITIC, dragVEHICLE, dragARM, dragLEG, dragBODY, dragMOTOR,...
        dragPAYLOAD] = fcnDRAGPREDICT(geomNumROTORS, flowV, flowRHO, ...
        flowMU, cylinderRE, cylinderCDY, sphereRE, sphereCDY, areaARM, ...
        areaLEG, areaMOTOR, areaPAYLOAD, areaBODY, geomARMradius, ...
        geomLEGradius, geomMOTORradius, geomPAYLOADradius, geomBODYradius);

end

% fcnFORCETRIM
%   input:  dragVEHICLE -|
%           massVEHICLE -| first guess pitch (include P force from last iteration?)
%           V --> q     - for lookup table
%           rotor file  - for lookup table
%           geomNumROTORS - divides total forces
%           flowRHO
%           V
%           geomBODYradius

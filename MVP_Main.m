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

% fcnDRAG
%   output:Dpar_tot plus component drag values for moment function
%   new output variables: dragVECHICLE, dragARM, dragLEG, dragBODY,
%   dragMOTOR, dragPAYLOAD, powerPARASITIC





% fcnFORCETRIM
%   input:  dragVEHICLE -|
%           massVEHICLE -| first guess pitch (include P force from last iteration?)
%           V --> q     - for lookup table
%           rotor file  - for lookup table
%           geomNumROTORS - divides total forces
%           flowRHO
%           V
%           geomBODYradius

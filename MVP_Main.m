clear,clc

strFILE = 'inputs/SkyRangerTMotor.txt';

% variables - atmospheric, component geometries, component masses
[seqV, flowTEMP, flowALT, flowRHO, flowMU, flowM, flowR, flowALPHAT,...
            angCLIMBdeg, angSIDEdeg, numLEADROTOR,...
            geomTypeROTOR, geomNumROTORS, geomDIAMETER, geomNumBLADES,...
            geomARMlength, geomARMradius, geomBODYheight, geomBODYradius,...
            geomLEGlength, geomLEGradius, geomLEGcentreradius, geomLEGcentreheight,...
            geomPAYLOADlength, geomPAYLOADradius, geomPAYLOADheight,...
            geomMOTORheight, geomMOTORradius, geomHUBheight, geomCGheight,...
            massMOTOR, massARM, massLEG, massPAYLOAD, massBODY, massVEHICLE] = fcnMVPREAD(strFILE);

% wetted area function - use/move to in parasitic drag function

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

%% MVP CLIMB

clear,clc
% close all
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


% Create a table with all rotor performance from database
[tabLOOKUP, vecANGLELST] = fcnLOADTABLES(geomTypeROTOR);

% Setup coordinates for components
[positionROTOR, positionMOTOR, positionARM, positionLEG,...
    positionBODY, positionPAYLOAD] = fcnCOORDSETUP(numLEADROTOR, geomNumROTORS,...
    geomARMlength, geomBODYradius, geomMOTORradius, geomLEGcentreradius, geomLEGcentreheight, ...
    geomPAYLOADheight, geomHUBheight, geomCGheight);

% Mass offset with position
massOFFSET = 0; %kg
positionOFFSET = [0.3, 0, 0]; %on right arm near rotor 2

massVEHICLE = massVEHICLE + massOFFSET;

%% Preallocate
    countV = numel(seqV);
    
    flowV           = zeros(countV,1);
    flowq           = zeros(countV,1);
    
    % Force Trim reserved for number of velocity values under investigation
    powerPARASITIC  = zeros(countV,1);
    dragVEHICLE     = zeros(countV,1);
    dragARM         = zeros(countV,1);
    dragLEG         = zeros(countV,1);
    dragBODY        = zeros(countV,1);
    dragMOTOR       = zeros(countV,1);
    dragPAYLOAD     = zeros(countV,1);
    
    % Rotor forces and inflow angles - First Run
    rotorTHRUST     = zeros(countV,1,geomNumROTORS);
    rotorAngINFLOW  = zeros(countV,1,geomNumROTORS);
    rotorVelINFLOW  = zeros(countV,1,geomNumROTORS);
    rotorRPM        = zeros(countV,1,geomNumROTORS);
    dragBODYinduced = zeros(countV,1); 
    liftBODY        = zeros(countV,1);
    pitchVEHICLEdeg = zeros(countV,1);

   % Wake values 
    vi_int          = zeros(countV,3,geomNumROTORS);
    vi_self         = zeros(countV,3,geomNumROTORS);
    skewRAD         = zeros(countV,geomNumROTORS);  
    wi = zeros(geomNumROTORS,3, geomNumROTORS);
    rotorPx         = zeros(countV,1,geomNumROTORS);
    rotorPy         = zeros(countV,1,geomNumROTORS);
    rotorMx         = zeros(countV,1,geomNumROTORS);
    rotorMy         = zeros(countV,1,geomNumROTORS);
    rotorCP         = zeros(countV,1,geomNumROTORS); 
    rotorCMx        = zeros(countV,1,geomNumROTORS);
    rotorJinf       = zeros(countV,1,geomNumROTORS);

    powerROTOR      = zeros(countV,1,geomNumROTORS);
    powerTOTAL      = zeros(countV,1,geomNumROTORS); 
    powerVEHICLE    = zeros(countV,1);

%     momentROTORTHRUST = zeros(countV,3,geomNumROTORS);
%     momentROTORPx   = zeros(countV,3,geomNumROTORS); 
%     momentROTORPy   = zeros(countV,3,geomNumROTORS);
%     momentROTORMx   = zeros(countV,3,geomNumROTORS);
%     momentROTORMy   = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTMOTOR = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTARM = zeros(countV,3,geomNumROTORS);
%     momentDRAGMOTOR = zeros(countV,3,geomNumROTORS);
%     momentDRAGARM   = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTLEG = zeros(countV,3,geomNumROTORS);
%     momentDRAGLEG   = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTBODY = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTPAYLOAD = zeros(countV,3,geomNumROTORS);
%     momentDRAGBODY = zeros(countV,3,geomNumROTORS);
%     momentDRAGPAYLOAD = zeros(countV,3,geomNumROTORS);
%     momentLIFTBODY  = zeros(countV,3,geomNumROTORS);
%     momentDRAGBODYinduced = zeros(countV,3,geomNumROTORS);
%     momentTOTAL = zeros(countV,1);

 % Second Run
 
     % Rotor forces and inflow angles - First Run
    rotorTHRUST1     = zeros(countV,1,geomNumROTORS);
    rotorAngINFLOW1  = zeros(countV,1,geomNumROTORS);
    rotorVelINFLOW1  = zeros(countV,1,geomNumROTORS);
    rotorRPM1        = zeros(countV,1,geomNumROTORS);
    

   % Wake values 
    vi_int1          = zeros(countV,3,geomNumROTORS);
    vi_self1         = zeros(countV,3,geomNumROTORS);
    skewRAD1         = zeros(countV,geomNumROTORS);  
    wi1 = zeros(geomNumROTORS,3, geomNumROTORS);
    rotorPx1         = zeros(countV,1,geomNumROTORS);
    rotorPy1         = zeros(countV,1,geomNumROTORS);
    rotorMx1         = zeros(countV,1,geomNumROTORS);
    rotorMy1         = zeros(countV,1,geomNumROTORS);
    rotorCP1         = zeros(countV,1,geomNumROTORS); 
    rotorCMx1        = zeros(countV,1,geomNumROTORS);
    rotorJinf1       = zeros(countV,1,geomNumROTORS);

    powerROTOR1      = zeros(countV,1,geomNumROTORS);
    powerTOTAL1      = zeros(countV,1,geomNumROTORS); 
    powerVEHICLE1    = zeros(countV,1);
% 
%     momentROTORTHRUST1 = zeros(countV,3,geomNumROTORS);
%     momentROTORPx1   = zeros(countV,3,geomNumROTORS); 
%     momentROTORPy1   = zeros(countV,3,geomNumROTORS);
%     momentROTORMx1   = zeros(countV,3,geomNumROTORS);
%     momentROTORMy1   = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTMOTOR1 = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTARM1 = zeros(countV,3,geomNumROTORS);
%     momentDRAGMOTOR1 = zeros(countV,3,geomNumROTORS);
%     momentDRAGARM1   = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTLEG1 = zeros(countV,3,geomNumROTORS);
%     momentDRAGLEG1   = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTBODY1 = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTPAYLOAD1 = zeros(countV,3,geomNumROTORS);
%     momentDRAGBODY1 = zeros(countV,3,geomNumROTORS);
%     momentDRAGPAYLOAD1 = zeros(countV,3,geomNumROTORS);
%     momentLIFTBODY1  = zeros(countV,3,geomNumROTORS);
%     momentDRAGBODYinduced1 = zeros(countV,3,geomNumROTORS);
%     momentTOTAL1 = zeros(countV,1);
%     
%     
     % Third Run
 
     % Rotor forces and inflow angles - First Run
    rotorTHRUST2     = zeros(countV,1,geomNumROTORS);
    rotorAngINFLOW2  = zeros(countV,1,geomNumROTORS);
    rotorVelINFLOW2  = zeros(countV,1,geomNumROTORS);
    rotorRPM2        = zeros(countV,1,geomNumROTORS);
    

   % Wake values 
    vi_int2          = zeros(countV,3,geomNumROTORS);
    vi_self2         = zeros(countV,3,geomNumROTORS);
    skewRAD2         = zeros(countV,geomNumROTORS);  
    wi2 = zeros(geomNumROTORS,3, geomNumROTORS);
    rotorPx2         = zeros(countV,1,geomNumROTORS);
    rotorPy2         = zeros(countV,1,geomNumROTORS);
    rotorMx2         = zeros(countV,1,geomNumROTORS);
    rotorMy2         = zeros(countV,1,geomNumROTORS);
    rotorCP2         = zeros(countV,1,geomNumROTORS); 
    rotorCMx2        = zeros(countV,1,geomNumROTORS);
    rotorJinf2       = zeros(countV,1,geomNumROTORS);

    powerROTOR2      = zeros(countV,1,geomNumROTORS);
    powerTOTAL2      = zeros(countV,1,geomNumROTORS); 
    powerVEHICLE2    = zeros(countV,1);

%     momentROTORTHRUST2 = zeros(countV,3,geomNumROTORS);
%     momentROTORPx2   = zeros(countV,3,geomNumROTORS); 
%     momentROTORPy2   = zeros(countV,3,geomNumROTORS);
%     momentROTORMx2   = zeros(countV,3,geomNumROTORS);
%     momentROTORMy2   = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTMOTOR2 = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTARM2 = zeros(countV,3,geomNumROTORS);
%     momentDRAGMOTOR2 = zeros(countV,3,geomNumROTORS);
%     momentDRAGARM2   = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTLEG2 = zeros(countV,3,geomNumROTORS);
%     momentDRAGLEG2   = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTBODY2 = zeros(countV,3,geomNumROTORS);
%     momentWEIGHTPAYLOAD2 = zeros(countV,3,geomNumROTORS);
%     momentDRAGBODY2 = zeros(countV,3,geomNumROTORS);
%     momentDRAGPAYLOAD2 = zeros(countV,3,geomNumROTORS);
%     momentLIFTBODY2  = zeros(countV,3,geomNumROTORS);
%     momentDRAGBODYinduced2 = zeros(countV,3,geomNumROTORS);
%     momentTOTAL2 = zeros(countV,1);
%     
    
    
%% START VELOCITY SEQUENCE
for i = 1:size(seqV,1)
    flowV(i,1) = seqV(i);  
    flowq(i,1) = 0.5*flowRHO*flowV(i,1)^2;    % Calculate the drag of each component
    N = geomNumROTORS;
    
    %add weight offset
    [powerPARASITIC(i,1), dragVEHICLE(i,1), dragARM(i,1), dragLEG(i,1), dragBODY(i,1),...
            dragMOTOR(i,1), dragPAYLOAD(i,1)] = fcnDRAGPREDICT(geomNumROTORS,...
            flowV(i,1), flowRHO, flowMU, cylinderRE, cylinderCDY, sphereRE, sphereCDY, areaARM, ...
            areaLEG, areaMOTOR, areaPAYLOAD, areaBODY, geomARMradius, ...
            geomLEGradius, geomMOTORradius, geomPAYLOADradius, geomBODYradius);
    
    [rotorTHRUST(i,1,:), rotorAngINFLOW(i,1,:), rotorVelINFLOW(i,1,:),...
            rotorRPM(i,1,:), dragBODYinduced(i,1), liftBODY(i,1),...
            pitchVEHICLEdeg(i,1)] = fcnFORCETRIM( flowq(i,1), flowRHO, geomNumROTORS, ...
            geomBODYradius, dragVEHICLE(i,1), massVEHICLE, tabLOOKUP, vecANGLELST );
    
    % body interference on each rotor
    [vi_body(i,:,:)] = fcnBODYINTERFERENCE(flowV(i,1), geomBODYradius, pitchVEHICLEdeg(i,1), positionROTOR, geomNumROTORS);
    
    % body interference added to fcnpredictRPM    
    [vi_int(i,:,:), vi_self(i,:,:), skewRAD(i,:,:), wi, ...
            rotorAngINFLOW(i,1,:), rotorVelINFLOW(i,1,:), rotorRPM(i,1,:), ...
            rotorPx(i,1,:), rotorPy(i,1,:), rotorMx(i,1,:), rotorMy(i,1,:), ...
            rotorCP(i,1,:), rotorCMx(i,1,:), rotorJinf(i,1,:),vi_int_total(i,:,:),vi_z(i,:,:)] ...
            = fcnPREDICTRPM(flowq(i,1),flowRHO, geomNumROTORS,geomNumBLADES,...
            geomDIAMETER, positionROTOR, rotorTHRUST(i,1,:),rotorRPM(i,1,:), ...
            rotorAngINFLOW(i,1,:),rotorVelINFLOW(i,1,:), pitchVEHICLEdeg(i,1),vi_body(i,:,:),...
            tabLOOKUP, vecANGLELST);

    [powerROTOR(i,1,:), powerTOTAL(i,1,:), powerVEHICLE(i,1)] = fcnROTORPOWER (flowRHO, geomDIAMETER,...
            geomNumROTORS, rotorCP(i,1,:), rotorRPM(i,1,:), powerPARASITIC(i,1));

    [ momentROTORTHRUST(i,:,:), momentROTORPx(i,:,:), momentROTORPy(i,:,:), ...
            momentROTORMx(i,:,:), momentROTORMy(i,:,:), momentWEIGHTMOTOR(i,:,:),...
            momentWEIGHTARM(i,:,:), momentDRAGMOTOR(i,:,:), momentDRAGARM(i,:,:),...
            momentWEIGHTLEG(i,:,:), momentDRAGLEG(i,:,:), momentWEIGHTBODY(i,:),...
            momentWEIGHTPAYLOAD(i,:), momentDRAGBODY(i,:), momentDRAGPAYLOAD(i,:),...
            momentLIFTBODY(i,:), momentDRAGBODYinduced(i,:), momentWEIGHTOFFSET(i,:), momentTOTAL(i,:) ] ...
            = fcnCALCMOMENTS(massMOTOR, massARM, massLEG, massPAYLOAD, massBODY, massOFFSET, ...
            positionROTOR, positionMOTOR, positionARM, ...
            positionLEG, positionBODY, positionPAYLOAD,positionOFFSET,...
            dragVEHICLE(i,1), dragARM(i,1), dragLEG(i,1), ...
            dragBODY(i,1), dragMOTOR(i,1), dragPAYLOAD(i,1), ...
            dragBODYinduced(i,1), liftBODY(i,1), rotorTHRUST(i,1,:),...
            rotorPx(i,1,:), rotorPy(i,1,:), rotorMx(i,1,:), ...
            rotorMy(i,1,:),pitchVEHICLEdeg(i,1), geomNumROTORS);
    
%% moment to zero 1
    [rotorTHRUST1(i,1,:), rotorRPM1(i,1,:), rotorPx1(i,1,:), rotorPy1(i,1,:), ...
            rotorMx1(i,1,:), rotorMy1(i,1,:), rotorCP1(i,1,:), rotorCMx1(i,1,:), rotorJinf1(i,1,:)] ...
            = fcnMOMENTTRIM (rotorTHRUST(i,1,:), momentTOTAL(i,:,:), positionROTOR,...
            flowV(i,1), flowRHO, pitchVEHICLEdeg(i,1),geomNumROTORS,tabLOOKUP, vecANGLELST);

  
    [vi_int1(i,:,:), vi_self1(i,:,:), skewRAD1(i,:,:), wi1, rotorAngINFLOW1(i,1,:), ...
            rotorVelINFLOW1(i,1,:), rotorRPM1(i,1,:), rotorPx1(i,1,:), rotorPy1(i,1,:),...
            rotorMx1(i,1,:), rotorMy1(i,1,:), rotorCP1(i,1,:), rotorCMx1(i,1,:), ...
            rotorJinf1(i,1,:),vi_int_total1(i,:,:)] = fcnPREDICTRPM(flowq(i,1),flowRHO,...
            geomNumROTORS,geomNumBLADES,geomDIAMETER, positionROTOR,...updated rotor position from rotorRUBlocation 
            rotorTHRUST1(i,1,:),rotorRPM(i,1,:),rotorAngINFLOW(i,1,:),rotorVelINFLOW(i,1,:),...
            pitchVEHICLEdeg(i,1), vi_body(i,:,:), tabLOOKUP, vecANGLELST);


    [powerROTOR1(i,1,:), powerTOTAL1(i,1,:), powerVEHICLE1(i,1)] = fcnROTORPOWER (flowRHO, geomDIAMETER,...
            geomNumROTORS, rotorCP1(i,1,:), rotorRPM1(i,1,:), powerPARASITIC(i,1));

    [ momentROTORTHRUST1(i,:,:), momentROTORPx1(i,:,:), momentROTORPy1(i,:,:), ...
            momentROTORMx1(i,:,:), momentROTORMy1(i,:,:), momentWEIGHTMOTOR1(i,:,:),...
            momentWEIGHTARM1(i,:,:), momentDRAGMOTOR1(i,:,:), momentDRAGARM1(i,:,:),...
            momentWEIGHTLEG1(i,:,:), momentDRAGLEG1(i,:,:), momentWEIGHTBODY1(i,:),...
            momentWEIGHTPAYLOAD1(i,:), momentDRAGBODY1(i,:), momentDRAGPAYLOAD1(i,:),...
            momentLIFTBODY1(i,:), momentDRAGBODYinduced1(i,:), momentWEIGHTOFFSET1(i,:), momentTOTAL1(i,:) ] ...
            = fcnCALCMOMENTS(massMOTOR, massARM, massLEG, massPAYLOAD, massBODY, massOFFSET,...
            positionROTOR, positionMOTOR, positionARM, ...
            positionLEG, positionBODY, positionPAYLOAD, positionOFFSET,...
            dragVEHICLE(i,1), dragARM(i,1), dragLEG(i,1), ...
            dragBODY(i,1), dragMOTOR(i,1), dragPAYLOAD(i,1), ...
            dragBODYinduced(i,1), liftBODY(i,1), rotorTHRUST1(i,1,:),...
            rotorPx1(i,1,:), rotorPy1(i,1,:), rotorMx1(i,1,:), ...
            rotorMy1(i,1,:),pitchVEHICLEdeg(i,1), geomNumROTORS);

%% moment to zero 2
 [rotorTHRUST2(i,1,:), rotorRPM2(i,1,:), rotorPx2(i,1,:), rotorPy2(i,1,:), ...
            rotorMx2(i,1,:), rotorMy2(i,1,:), rotorCP2(i,1,:), rotorCMx2(i,1,:), rotorJinf2(i,1,:)] ...
            = fcnMOMENTTRIM (rotorTHRUST1(i,1,:), momentTOTAL1(i,:,:), positionROTOR,...
            flowV(i,1), flowRHO, pitchVEHICLEdeg(i,1),geomNumROTORS,tabLOOKUP, vecANGLELST);


 [vi_int2(i,:,:), vi_self2(i,:,:), skewRAD2(i,:,:), wi2, rotorAngINFLOW2(i,1,:),...
            rotorVelINFLOW2(i,1,:), rotorRPM2(i,1,:), rotorPx2(i,1,:), rotorPy2(i,1,:),...
            rotorMx2(i,1,:), rotorMy2(i,1,:), rotorCP2(i,1,:), rotorCMx2(i,1,:),...
            rotorJinf2(i,1,:),vi_int_total2(i,:,:)] = fcnPREDICTRPM(flowq(i,1),flowRHO,...
            geomNumROTORS,geomNumBLADES,geomDIAMETER, positionROTOR,...
            rotorTHRUST2(i,1,:),rotorRPM2(i,1,:),rotorAngINFLOW2(i,1,:),rotorVelINFLOW2(i,1,:),...
            pitchVEHICLEdeg(i,1), vi_body(i,:,:),tabLOOKUP,vecANGLELST);


 [powerROTOR2(i,1,:), powerTOTAL2(i,1,:), powerVEHICLE2(i,1)] = fcnROTORPOWER (flowRHO, geomDIAMETER,...
            geomNumROTORS, rotorCP2(i,1,:), rotorRPM2(i,1,:), powerPARASITIC(i,1));

    [ momentROTORTHRUST2(i,:,:), momentROTORPx2(i,:,:), momentROTORPy2(i,:,:), ...
            momentROTORMx2(i,:,:), momentROTORMy2(i,:,:), momentWEIGHTMOTOR2(i,:,:),...
            momentWEIGHTARM2(i,:,:), momentDRAGMOTOR2(i,:,:), momentDRAGARM2(i,:,:),...
            momentWEIGHTLEG2(i,:,:), momentDRAGLEG2(i,:,:), momentWEIGHTBODY2(i,:),...
            momentWEIGHTPAYLOAD2(i,:), momentDRAGBODY2(i,:), momentDRAGPAYLOAD2(i,:),...
            momentLIFTBODY2(i,:), momentDRAGBODYinduced2(i,:), momentWEIGHTOFFSET2(i,:), momentTOTAL2(i,:) ] ...
            = fcnCALCMOMENTS(massMOTOR, massARM, massLEG, massPAYLOAD, massBODY, massOFFSET,...
            positionROTOR, positionMOTOR, positionARM, ...
            positionLEG, positionBODY, positionPAYLOAD, positionOFFSET,...
            dragVEHICLE(i,1), dragARM(i,1), dragLEG(i,1), ...
            dragBODY(i,1), dragMOTOR(i,1), dragPAYLOAD(i,1), ...
            dragBODYinduced(i,1), liftBODY(i,1), rotorTHRUST2(i,1,:),...
            rotorPx2(i,1,:), rotorPy2(i,1,:), rotorMx2(i,1,:), ...
            rotorMy2(i,1,:),pitchVEHICLEdeg(i,1), geomNumROTORS);
 

%% TO DO       
     %add Px convergence(from last time step)

 
end


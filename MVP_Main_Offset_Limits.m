% OFFSET LIMITS   - create operation limits to extra mass payload and position of 
%                   payload applied to multirotor vehicle for a vehicle to still
%                   maintain steady level flight
%
% orientation       = square or diamond
% velocity range    = 0:15m/s
% mass range        = 0:0.5 kg
% offset locations  = [-0.1:-0.2, 0, 0] R1
%                   = [0, -0.1:-0.2, 0] R2
%                   = [0.1:0.2, 0, 0]   R3
%                   = [0, 0.1:0.2, 0]   R4


% RPM limit = 5100 x 75% = 3820 RPM

clear,clc 
%% NO PAYLOAD WITH OFFSET

strFILE = 'inputs/SkyRangerHawk.txt';

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

%% NO Payload and WITH Offset

countOM = 0;
countOX = 0;
N = geomNumROTORS;



   
for j = 0.01:0.02:0.1 %mass offset
countOM = countOM + 1;

for k = 0.1:0.02:0.2    % Rotor 3 limits
% Mass offset with position
countOX = countOX + 1;

    massOFFSET(countOM) = j

% massOFFSET = 0.1; %kg
    positionOFFSET = [k, 0, 0]; %on right arm near rotor 2
    massVEHICLE = massVEHICLE + massOFFSET - massPAYLOAD;

    x(countOX) = k

massPAYLOAD = 0;
geomPAYLOADradius = 0;
areaPAYLOAD = 0;
%change the CG of the vehicle

% NEW - update CG location in x direction
[geomCGoffset]=fcnCGOFFSET(massBODY,massOFFSET,positionOFFSET,geomCGheight);

% Setup coordinates for components
[positionROTOR, positionMOTOR, positionARM, positionLEG,...
    positionBODY, positionPAYLOAD] = fcnCOORDSETUP(numLEADROTOR, geomNumROTORS,...
    geomARMlength, geomBODYradius, geomMOTORradius, geomLEGcentreradius, geomLEGcentreheight, ...
    geomPAYLOADheight, geomHUBheight, geomCGheight, geomCGoffset);




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

     

%% START VELOCITY SEQUENCE

for i = 1:size(seqV,1)
    flowV(i,1) = seqV(i);
    seqV(i)
    flowq(i,1) = 0.5*flowRHO*flowV(i,1)^2;    % Calculate the drag of each component
     
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
    [vi_body(i,:,:)] = fcnBODYINTERFERENCE(flowV(i,1), geomBODYradius, pitchVEHICLEdeg(i,1),...
            positionROTOR, geomNumROTORS);
    
    % body interference added to fcnpredictRPM    
    [vi_int(i,:,:), vi_self(i,:,:), skewRAD(i,:,:), wi, ...
            rotorAngINFLOW(i,1,:), rotorVelINFLOW(i,1,:), rotorRPM(i,1,:), ...
            rotorPx(i,1,:), rotorPy(i,1,:), rotorMx(i,1,:), rotorMy(i,1,:), ...
            rotorCP(i,1,:), rotorCMx(i,1,:), rotorJinf(i,1,:),vi_int_total(i,:,:),vi_z(i,:,:),...
            vi_int_only(i,:,:), AngINT(i,:,:),magvi_int_only(i,:,:)] ...
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
            flowV(i,1), flowRHO, pitchVEHICLEdeg(i,1),geomNumROTORS,tabLOOKUP, vecANGLELST,numLEADROTOR);

  
    [vi_int1(i,:,:), vi_self1(i,:,:), skewRAD1(i,:,:), wi1, rotorAngINFLOW1(i,1,:), ...
            rotorVelINFLOW1(i,1,:), rotorRPM1(i,1,:), rotorPx1(i,1,:), rotorPy1(i,1,:),...
            rotorMx1(i,1,:), rotorMy1(i,1,:), rotorCP1(i,1,:), rotorCMx1(i,1,:), ...
            rotorJinf1(i,1,:),vi_int_total1(i,:,:),vi_z1(i,:,:),vi_int_only1(i,:,:), ...
            AngINT1(i,:,:),magvi_int_only1(i,:,:)] = fcnPREDICTRPM(flowq(i,1),flowRHO,...
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
            flowV(i,1), flowRHO, pitchVEHICLEdeg(i,1),geomNumROTORS,tabLOOKUP, vecANGLELST,numLEADROTOR);


 [vi_int2(i,:,:), vi_self2(i,:,:), skewRAD2(i,:,:), wi2, rotorAngINFLOW2(i,1,:),...
            rotorVelINFLOW2(i,1,:), rotorRPM2_withoffset(i,1,:), rotorPx2(i,1,:), rotorPy2(i,1,:),...
            rotorMx2(i,1,:), rotorMy2(i,1,:), rotorCP2(i,1,:), rotorCMx2(i,1,:),...
            rotorJinf2(i,1,:),vi_int_total2(i,:,:),vi_z2(i,:,:),vi_int_only2(i,:,:), AngINT2(i,:,:),magvi_int_only2(i,:,:)] = fcnPREDICTRPM(flowq(i,1),flowRHO,...
            geomNumROTORS,geomNumBLADES,geomDIAMETER, positionROTOR,...
            rotorTHRUST2(i,1,:),rotorRPM2(i,1,:),rotorAngINFLOW2(i,1,:),rotorVelINFLOW2(i,1,:),...
            pitchVEHICLEdeg(i,1), vi_body(i,:,:),tabLOOKUP,vecANGLELST);


 [powerROTOR2_withoffset(i,1,:), powerTOTAL2_withoffset(i,1,:), powerVEHICLE2_withoffset(i,1)] = fcnROTORPOWER (flowRHO, geomDIAMETER,...
            geomNumROTORS, rotorCP2(i,1,:), rotorRPM2_withoffset(i,1,:), powerPARASITIC(i,1));

    [ momentROTORTHRUST2_withoffset(i,:,:), momentROTORPx2_withoffset(i,:,:), momentROTORPy2_withoffset(i,:,:), ...
            momentROTORMx2_withoffset(i,:,:), momentROTORMy2_withoffset(i,:,:), momentWEIGHTMOTOR2_withoffset(i,:,:),...
            momentWEIGHTARM2_withoffset(i,:,:), momentDRAGMOTOR2_withoffset(i,:,:), momentDRAGARM2_withoffset(i,:,:),...
            momentWEIGHTLEG2_withoffset(i,:,:), momentDRAGLEG2_withoffset(i,:,:), momentWEIGHTBODY2_withoffset(i,:),...
            momentWEIGHTPAYLOAD2_withoffset(i,:), momentDRAGBODY2_withoffset(i,:), momentDRAGPAYLOAD2_withoffset(i,:),...
            momentLIFTBODY2_withoffset(i,:), momentDRAGBODYinduced2_withoffset(i,:), momentWEIGHTOFFSET2_withoffset(i,:), ...
            momentTOTAL2_withoffset(i,:) ] ...
            = fcnCALCMOMENTS(massMOTOR, massARM, massLEG, massPAYLOAD, massBODY, massOFFSET,...
            positionROTOR, positionMOTOR, positionARM, ...
            positionLEG, positionBODY, positionPAYLOAD, positionOFFSET,...
            dragVEHICLE(i,1), dragARM(i,1), dragLEG(i,1), ...
            dragBODY(i,1), dragMOTOR(i,1), dragPAYLOAD(i,1), ...
            dragBODYinduced(i,1), liftBODY(i,1), rotorTHRUST2(i,1,:),...
            rotorPx2(i,1,:), rotorPy2(i,1,:), rotorMx2(i,1,:), ...
            rotorMy2(i,1,:),pitchVEHICLEdeg(i,1), geomNumROTORS);
 
   % save RPM
   % save x
   % save mass
   % saveCG 
    offset(countALL).flowV(countALL = rotorRPM2_withoffset(i,1,:);    
    offset(countALL).massOFFSET(countOM) = j
    x(countOX) = k
    geomCGoffset
        
    countALL = countALL + 1;
    
end % Velocity sequence



str1 = sprintf('_mass_%.3fkg',massOFFSET(countOM));
str2 = sprintf('__x_%.3fm',x(countOX));
str3 = '.mat';
fname = strcat('Oct17HAWKoffset',str1,str2,str3);

save(fname, 'flowV', 'massOFFSET', 'positionOFFSET', 'geomCGoffset', 'massVEHICLE',...
            'momentROTORTHRUST2_withoffset', 'momentROTORPx2_withoffset', 'momentROTORPy2_withoffset', ...
            'momentROTORMx2_withoffset', 'momentROTORMy2_withoffset', 'momentWEIGHTMOTOR2_withoffset',...
            'momentWEIGHTARM2_withoffset', 'momentDRAGMOTOR2_withoffset', 'momentDRAGARM2_withoffset',...
            'momentWEIGHTLEG2_withoffset', 'momentDRAGLEG2_withoffset', 'momentWEIGHTBODY2_withoffset',...
            'momentWEIGHTPAYLOAD2_withoffset', 'momentDRAGBODY2_withoffset', 'momentDRAGPAYLOAD2_withoffset',...
            'momentLIFTBODY2_withoffset', 'momentDRAGBODYinduced2_withoffset', 'momentWEIGHTOFFSET2_withoffset', 'momentTOTAL2_withoffset',...
            'powerROTOR2_withoffset', 'powerTOTAL2_withoffset', 'powerVEHICLE2_withoffset','rotorRPM2_withoffset')



end % x position sequence
end % mass sequence




clear 
clc
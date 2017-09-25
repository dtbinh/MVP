clear,clc
% close all

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

%% CASE for VETRICAL DESCENDING FLIGHT
% with Rotor Interference and no Body Interference
    clear seqV

% --INPUT--------------------------------------------------------
    % Descent rate
    seqV = 0:0.05:1; % range of descent speeds (0 is hover)
    seqV = seqV';
% ----------------------------------------------------------    

%% START VELOCITY SEQUENCE
for i = 1:size(seqV,1) % range of decent rates
    
    flowVdescent(i,1)   = seqV(i); % descent rate
    flowV               = 0;       % no forward flight speed      
    flowq(i,1)          = 0.5*flowRHO*flowVdescent(i,1)^2;    % Calculate the drag of each component
    N = geomNumROTORS;
    
% DRAG PREDICTION - based on the vehicle descenting
    [powerPARASITIC(i,1), dragVEHICLE(i,1), dragARM(i,1), dragLEG(i,1), dragBODY(i,1),...
            dragMOTOR(i,1), dragPAYLOAD(i,1)] = fcnDRAGPREDICT(geomNumROTORS,...
            flowVdescent(i,1), flowRHO, flowMU, cylinderRE, cylinderCDY, sphereRE, sphereCDY, areaARM, ...
            areaLEG, areaMOTOR, areaPAYLOAD, areaBODY, geomARMradius, ...
            geomLEGradius, geomMOTORradius, geomPAYLOADradius, geomBODYradius);
     
   
% THRUST PREDICTION - For N number of rotors
   %Thrust for all rotors needs to be the same for steady descending flight
   tempTHRUST(i,1) = (massVEHICLE*9.81 - dragVEHICLE(i,1))./N; %Equation of motion for descending flight - sum of forces in z-direction
   
% SETUP for RPM LOOKUP
   rotorAngINFLOW  = repmat(-90, i, 1, N);          % Rotor inflow angle for descent
%    rotorVelINFLOW  = flowVdescent % Input speed
   dragBODYinduced = repmat(0,i,1);                 % Not considered
   liftBODY        = repmat(0,i,1);                 % Not considered
   pitchVEHICLEdeg = repmat(-90,i,1);               % Assume pitch and inflow angle are equal
       
% LOOKUP RPM FOR EACH ROTOR - (FIRST GUESS RPM for WIM) based on given fixed thrust and q value
   % based on freestream only (i.e. no interference)
    for j = 1:N
         rotorTHRUST(i,1,j) = tempTHRUST(end,1);
       [ rotorRPM(i,:,j), rotorPx(i,:,j), rotorPy(i,:,j), rotorMx(i,:,j), rotorMy(i,:,j), rotorCP(i,:,j), rotorCMx(i,:,j), rotorJinf(i,:,j) ] ...
        = fcnRPMLOOKUP( flowq(i,1), flowRHO, pitchVEHICLEdeg(i,1),rotorTHRUST(i,1,j)./flowRHO, ...
        tabLOOKUP, vecANGLELST );
    end
        
% NO BODY INTERFERENCE - body interference on each rotor
    [vi_body(i,:,:)] = fcnBODYINTERFERENCE(flowVdescent(i,1), geomBODYradius, pitchVEHICLEdeg(i,1), positionROTOR, geomNumROTORS);
    vi_body(i,:,:) = repmat(0,1,3,N);
    
    
% WIM MODEL - find rotor mutual interference velocities (vi_int)
    % vi_int - mutual interference on one rotor i
    % rotorVelINFLOW - final resultant inflow velocity
    % rotorAngINGLOW - final resultant inflow angle
    % rotorPx, Py, Mx, My, CP, CMx - (not used) rotor inline forces, rotor moments
    % power coef and roll moment coef
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

end

%% SAMPLE PLOTS
figure;
plot(flowVdescent,rotorVelINFLOW(:,:,1) ,'-ro',...
    flowVdescent,rotorVelINFLOW(:,:,2),'-b+',...
    flowVdescent,rotorVelINFLOW(:,:,3),'-ks',...
    flowVdescent,rotorVelINFLOW(:,:,4),'-gx')
legend('Rotor 1 - Lead','Rotor 2 - Right','Rotor 3 - Rear','Rotor 4 - Left')
xlabel('Vertical Descent Rate - V_{d}[m/s]')
ylabel('Resultant Rotor Inflow Velocity - V_{R} [m/s]')
title('Inflow Velocity by Descent Rate')


figure;
plot(flowVdescent,rotorVelINFLOW(:,:,1)./flowVdescent ,'-ro',...
    flowVdescent,rotorVelINFLOW(:,:,2)./flowVdescent,'-b+',...
    flowVdescent,rotorVelINFLOW(:,:,3)./flowVdescent,'-ks',...
    flowVdescent,rotorVelINFLOW(:,:,4)./flowVdescent,'-gx')
legend('Rotor 1 - Lead','Rotor 2 - Right','Rotor 3 - Rear','Rotor 4 - Left')
xlabel('Vertical Descent Rate - V_{d} [m/s]')
ylabel('V_{R} / V_{d} [m/s]')
title('Ratio of Resultant Inflow Velocity and Descent Rate by Vertical Descent Rate')


vh = vi_int(1,3,1); % Induced velocity at hover - no descent rate
vy = rotorVelINFLOW(:,:,:); % Vertial descent rate
vyvh = vy./vh;      % vy/vh
vxvh = zeros(21,1); % vx/vh - vertical only

figure;
plot(flowVdescent,vyvh(:,:,1),'-ro',...
    flowVdescent,vyvh(:,:,2),'-b+',...
    flowVdescent,vyvh(:,:,3),'-ks',...
    flowVdescent,vyvh(:,:,4),'-gx')
legend('Rotor 1 - Lead','Rotor 2 - Right','Rotor 3 - Rear','Rotor 4 - Left')
xlabel('Vertical Descent Rate - V_{d} [m/s]')
ylabel('vy / vh')


figure;
plot(vxvh,vyvh(:,:,1),'-ro',...
    vxvh,vyvh(:,:,2),'-b+',...
    vxvh,vyvh(:,:,3),'-ks',...
    vxvh,vyvh(:,:,4),'-gx')
legend('Rotor 1 - Lead','Rotor 2 - Right','Rotor 3 - Rear','Rotor 4 - Left')
xlabel('vx / vh')
ylabel('vy / vh')



function [testAngTOTAL, VR_total, rotorRPMtest, ...
    rotorPxtest, rotorPytest, rotorMxtest, rotorMytest, rotorCPtest, ...
    rotorCMxtest, rotorJinftest, vi_int_rotbod,vi_z,...
    vi_int_only, AngINT,magvi_int_only] ...
     = fcnRPMUPDATE_rotorplane (flowq, flowRHO, vecINT, geomNumROTORS, rotorTHRUST,...
     pitchVEHICLEdeg, vi_body, tabLOOKUP, vecANGLST)
 %%
 
     V              = sqrt(flowq/(0.5*flowRHO));
     vecFREE        = repmat (V, 1, 1, geomNumROTORS);              %freestream repeated for each rotor
     vecPITCH       = repmat(pitchVEHICLEdeg, 1, 1, geomNumROTORS); %pitch repeated for each rotor
     
         rotorRPMtest = zeros(1,1,geomNumROTORS);
         rotorPxtest = zeros(1,1,geomNumROTORS);
         rotorPytest = zeros(1,1,geomNumROTORS);
         rotorMxtest = zeros(1,1,geomNumROTORS);
         rotorMytest = zeros(1,1,geomNumROTORS);
         rotorCPtest = zeros(1,1,geomNumROTORS);
         rotorCMxtest = zeros(1,1,geomNumROTORS);
         rotorJinftest = zeros(1,1,geomNumROTORS);
         
if V == 0 % hover case
     
         vecVelNEW = sqrt((vecFREE+vecINT.*sind(vecPITCH)).^2+(vecINT.*cosd(vecPITCH)).^2);
         vecAngNEW = -89.99; % lookup needs high and low aoa tables
         vecAngNEW = repmat (vecAngNEW, 1, 1, geomNumROTORS);
         vecflowqNEW = 0.5*flowRHO*vecVelNEW.^2;
         rotorTHRUSTrho = rotorTHRUST/flowRHO;
              
 % lookup new rotor performance data based on new inflow velocity and angle         
     for i = 1:geomNumROTORS
            [ rotorRPM(:,:,i), rotorPx(:,:,i), rotorPy(:,:,i), ...
                rotorMx(:,:,i), rotorMy(:,:,i), rotorCP(:,:,i), ...
                rotorCMx(:,:,i), rotorJinf(:,:,i) ] ...
                = fcnRPMLOOKUP( vecflowqNEW(:,:,i), flowRHO, ...
                vecAngNEW(:,:,i), rotorTHRUSTrho(:,:,i), tabLOOKUP, vecANGLST );
     end
         
         vecAngNEW = repmat(-90,1,1,geomNumROTORS);
         testAngTOTAL = repmat(-90,1,1,geomNumROTORS);
         magVelTOTAL = vecVelNEW;
         
         
        Vint(:,1) = (vecINT.*sind(vecPITCH)); %Vx
        Vint(:,3) = (vecINT.*cosd(vecPITCH)); %Vz
        
        vi_z = reshape(Vint', [1 3 geomNumROTORS]);
         vi_int_rotbod = vi_z;
         vi_int_only = vi_z;
         AngINT = repmat (-90, 1, 1, geomNumROTORS);
         magvi_int_only = magVelTOTAL;
         
else
    % rotate freestream velocity from global to rotor plane
    Vx = vecFREE.*cosd(vecPITCH);
    Vz = vecFREE.*sind(vecPITCH);
    
    % rotate body interference velocity from global to rotor plane
    VbodyX = vi_body(:,1);
    VbodyZ = vi_body(:,1);
    
    Vbodyxx = VbodyX.*cosd(vecPITCH);
    Vbodyxz = VbodyX.*sind(vecPITCH);
    
    Vbodyzx = VbodyZ.*sind(vecPITCH);
    Vbodyzz = VbodyZ.cosd(vecPITCH);
    
    VintZ = vecINT;
    
    VRx = [Vx + Vbodyxx + Vbodyzx, 0, 0];
    VRz = [0,0,Vz + Vbodyxz + Vbodyzz + VintZ];
    
    VR_total = VRx + VRz;
    vecflowqNEW = 0.5*flowRHO*VR_total.^2;
    %
    %Calculate angle
    
    rotorTHRUSTrho = rotorTHRUST/flowRHO;
              
 % lookup new rotor performance data based on new inflow velocity and angle         
     for i = 1:geomNumROTORS
            [ rotorRPM(:,:,i), rotorPx(:,:,i), rotorPy(:,:,i), ...
                rotorMx(:,:,i), rotorMy(:,:,i), rotorCP(:,:,i), ...
                rotorCMx(:,:,i), rotorJinf(:,:,i) ] ...
                = fcnRPMLOOKUP( vecflowqNEW(:,:,i), flowRHO, ...
                vecAngNEW(:,:,i), rotorTHRUSTrho(:,:,i), tabLOOKUP, vecANGLST );
     end
    
end
function [vecANG, magvecVR, vecVR, vecINT, vecBODY, rotorRPM, ...
    rotorPx, rotorPy, rotorMx, rotorMy, rotorQ, rotorCP, ...
    rotorCMx, rotorJinf] ...
     = fcnRPMUPDATEv2 (flowq, flowRHO, Vint, geomNumROTORS, rotorTHRUST,...
     pitchVEHICLEdeg, vecBODY, tabLOOKUP, vecANGLST)
 %% Initiate Variables
     V              = sqrt(flowq/(0.5*flowRHO));
     vecFREE        = repmat ([V 0 0], 1, 1, geomNumROTORS);              %freestream repeated for each rotor
     vecPITCH       = repmat(pitchVEHICLEdeg, 1, 1, geomNumROTORS); %pitch repeated for each rotor
%% Preallocate     
         rotorRPM = zeros(1,1,geomNumROTORS);
         rotorPx = zeros(1,1,geomNumROTORS);
         rotorPy = zeros(1,1,geomNumROTORS);
         rotorMx = zeros(1,1,geomNumROTORS);
         rotorMy = zeros(1,1,geomNumROTORS);
         rotorQ = zeros(1,1,geomNumROTORS);
         rotorCP = zeros(1,1,geomNumROTORS);
         rotorCMx = zeros(1,1,geomNumROTORS);
         rotorJinf = zeros(1,1,geomNumROTORS);
%% Predict RPM Based on New Inflow Conditions
     if V == 0 % hover case
 %% Hover Case   
     tempvecINT(:,1) = (-Vint.*sind(vecPITCH)); %Vx
         tempvecINT(:,3) = (Vint.*cosd(vecPITCH)); %Vz
         vecINT = reshape(tempvecINT', [1 3 geomNumROTORS]);
         
         vecVR           = vecFREE + vecINT + vecBODY;
         
         tempmagvecVR    = sqrt(sum(abs(vecVR).^2,2)); % same results as vecVelNEW
         magvecVR        = reshape(tempmagvecVR, [1 1 geomNumROTORS]);
         
         vecANG = repmat (-89.99, 1, 1, geomNumROTORS);% lookup needs high and low aoa tables
         q = 0.5*flowRHO*magvecVR.^2;
         rotorTHRUSTrho = rotorTHRUST/flowRHO;   
         
 % lookup new rotor performance data based on new inflow velocity and angle         
         for i = 1:geomNumROTORS
            [ rotorRPM(:,:,i), rotorPx(:,:,i), rotorPy(:,:,i), rotorMx(:,:,i), rotorMy(:,:,i), rotorQ(:,:,i),rotorCP(:,:,i), rotorCMx(:,:,i), rotorJinf(:,:,i) ] ...
                    = fcnRPMLOOKUPv2( q(:,:,i), flowRHO, vecANG(:,:,i), rotorTHRUSTrho(:,:,i), ...
                    tabLOOKUP, vecANGLST );
         end
         
        vecANG = repmat(-90,1,1,geomNumROTORS);
       
    else % all forward flight cases
%% Forward Flight
% upwash/induced angle deflects resultant velocity upwards from rotor plane reducing the inflow angle
              
        % Test for vector addition when adding results for body
        % interference
        %vecINT is the z component of interference velocity through the
        %rotor. Here vecINT (z) is transposed into global plane
        tempvecINT(:,1) = (-Vint.*sind(vecPITCH)); %Vx in global
        tempvecINT(:,3) = (Vint.*cosd(vecPITCH)); %Vz in global
        vecINT          = reshape(tempvecINT', [1 3 geomNumROTORS]); % mutual interference velocity in z-direction of rotor plane
                        %1x3x4 structure for saving purposes
     
        % Resultant velocity of each rotor
        vecVR           = vecFREE + vecINT + vecBODY;

        tempmagvecVR    = sqrt(sum(abs(vecVR).^2,2)); % same results as vecVelNEW
        magvecVR        = reshape(tempmagvecVR, [1 1 geomNumROTORS]);
        
        q               = 0.5*flowRHO*magvecVR.^2;
        vecANG          = pitchVEHICLEdeg - atan2d(vecVR(:,3,:),vecVR(:,1,:));
        rotorTHRUSTrho  = rotorTHRUST/flowRHO;
        
        % lookup new rotor performance data based on new inflow velocity and angle         
        for i = 1:geomNumROTORS
            [ rotorRPM(:,:,i), rotorPx(:,:,i), rotorPy(:,:,i), rotorMx(:,:,i), rotorMy(:,:,i), rotorQ(:,:,i),rotorCP(:,:,i), rotorCMx(:,:,i), rotorJinf(:,:,i) ] ...
                    = fcnRPMLOOKUPv2( q(:,:,i), flowRHO, vecANG(:,:,i), rotorTHRUSTrho(:,:,i), ...
                    tabLOOKUP, vecANGLST );
        end
         
     end
end


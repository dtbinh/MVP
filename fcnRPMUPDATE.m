function [testAngTOTAL, magVelTOTAL, rotorRPMtest, ...
    rotorPxtest, rotorPytest, rotorMxtest, rotorMytest, rotorCPtest, rotorCMxtest, rotorJinftest, vi_int_rotbod,vi_z] ...
     = fcnRPMUPDATE (flowq, flowRHO, vecINT, geomNumROTORS, rotorTHRUST,...
     pitchVEHICLEdeg, vi_body, tabLOOKUP, vecANGLST)
 
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
         
 % preallocate        
         
 % lookup new rotor performance data based on new inflow velocity and angle         
         for i = 1:geomNumROTORS
            [ rotorRPMtest(:,:,i), rotorPxtest(:,:,i), rotorPytest(:,:,i), rotorMxtest(:,:,i), rotorMytest(:,:,i), rotorCPtest(:,:,i), rotorCMxtest(:,:,i), rotorJinftest(:,:,i) ] ...
                    = fcnRPMLOOKUP( vecflowqNEW(:,:,i), flowRHO, vecAngNEW(:,:,i), rotorTHRUSTrho(:,:,i), ...
                    tabLOOKUP, vecANGLST );
         end
         
         vecAngNEW = repmat(-90,1,1,geomNumROTORS);
         testAngTOTAL = repmat(-90,1,1,geomNumROTORS);
         magVelTOTAL = vecVelNEW;
         
         
         Vint(:,1) = (vecINT.*sind(vecPITCH)); %Vx
        Vint(:,3) = (vecINT.*cosd(vecPITCH)); %Vz
        
        vi_z = reshape(Vint', [1 3 geomNumROTORS]);
         vi_int_rotbod = vi_z;
     else % all forward flight cases
         
% upwash/induced angle deflects resultant velocity upwards from rotor plane reducing the inflow angle
        vecVelNEW = sqrt((vecFREE-(vecINT).*sind(vecPITCH)).^2+((vecINT).*cosd(vecPITCH)).^2); %McCormick 8.86? (propeller)   
        vecAngNEW = vecPITCH - asind((vecINT).*cosd(vecPITCH)./vecVelNEW); %use in tablelookup
        vecflowqNEW = 0.5*flowRHO*vecVelNEW.^2;
        rotorTHRUSTrho = rotorTHRUST/flowRHO;
       
        
        % Test for vector addition when adding results for body
        % interference
        %vecINT is the z component of interference velocity through the
        %rotor. Here vecINT (z) is transposed into global plane
        Vint(:,1) = (-vecINT.*sind(vecPITCH)); %Vx
        Vint(:,3) = (vecINT.*cosd(vecPITCH)); %Vz
        
        vi_z = reshape(Vint', [1 3 geomNumROTORS]); %1x3x4 structure for saving purposes
        
        vecFREEglobal = repmat([V 0 0], 1, 1, geomNumROTORS);
        
        testVelTOTAL      = vecFREEglobal + vi_z + vi_body;

        testmagVelTOTAL   = sqrt(sum(abs(testVelTOTAL).^2,2)); % same results as vecVelNEW
        magVelTOTAL  = reshape(testmagVelTOTAL, [1 1 geomNumROTORS]);
%         testVelTOTAL        = testVelNEW + vi_body;
        
        vi_int_rotbod = vi_body + vi_z;
        

        
        testflowqTOTAL      = 0.5*flowRHO*testmagVelTOTAL.^2;
% %         testAngNEW          = pitchVEHICLEdeg + atan2d(testVelNEW(:,3,:),testVelNEW(:,1,:));
        testAngTOTAL          = pitchVEHICLEdeg + atan2d(testVelTOTAL(:,3,:),testVelTOTAL(:,1,:));
%          AngTOTAL           = reshape(testAngTOTAL, [1 1 4]);
        
        % lookup new rotor performance data based on new inflow velocity and angle         
         for i = 1:geomNumROTORS
            [ rotorRPM(:,:,i), rotorPx(:,:,i), rotorPy(:,:,i), rotorMx(:,:,i), rotorMy(:,:,i), rotorCP(:,:,i), rotorCMx(:,:,i), rotorJinf(:,:,i) ] ...
                    = fcnRPMLOOKUP( vecflowqNEW(:,:,i), flowRHO, vecAngNEW(:,:,i), rotorTHRUSTrho(:,:,i), ...
                    tabLOOKUP, vecANGLST );

         end
         
         for i = 1:geomNumROTORS
            [ rotorRPMtest(:,:,i), rotorPxtest(:,:,i), rotorPytest(:,:,i), rotorMxtest(:,:,i), rotorMytest(:,:,i), rotorCPtest(:,:,i), rotorCMxtest(:,:,i), rotorJinftest(:,:,i) ] ...
                    = fcnRPMLOOKUP( testflowqTOTAL(:,:,i), flowRHO, testAngTOTAL(:,:,i), rotorTHRUSTrho(:,:,i), ...
                    tabLOOKUP, vecANGLST );

         end
         
     end
end


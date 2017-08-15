function [vecAngNEW, vecVelNEW, rotorRPM, ...
    rotorPx, rotorPy, rotorMx, rotorMy, rotorCP, rotorCMx, rotorJinf] ...
     = fcnRPMUPDATE (flowq, flowRHO, vecINT, geomNumROTORS, rotorTHRUST,...
     pitchVEHICLEdeg, tabLOOKUP, vecANGLST)
 
     V              = sqrt(flowq/(0.5*flowRHO));
     vecFREE        = repmat (V, 1, 1, geomNumROTORS);              %freestream repeated for each rotor
     vecPITCH       = repmat(pitchVEHICLEdeg, 1, 1, geomNumROTORS); %pitch repeated for each rotor
     
         rotorRPM = zeros(1,1,geomNumROTORS);
         rotorPx = zeros(1,1,geomNumROTORS);
         rotorPy = zeros(1,1,geomNumROTORS);
         rotorMx = zeros(1,1,geomNumROTORS);
         rotorMy = zeros(1,1,geomNumROTORS);
         rotorCP = zeros(1,1,geomNumROTORS);
         rotorCMx = zeros(1,1,geomNumROTORS);
         rotorJinf = zeros(1,1,geomNumROTORS);
     
     if V == 0 % hover case
     
         vecVelNEW = sqrt((vecFREE+vecINT.*sind(vecPITCH)).^2+(vecINT.*cosd(vecPITCH)).^2);
         vecAngNEW = -89.99; % lookup needs high and low aoa tables
         vecAngNEW = repmat (vecAngNEW, 1, 1, geomNumROTORS);
         vecflowqNEW = 0.5*flowRHO*vecVelNEW.^2;
         rotorTHRUSTrho = rotorTHRUST/flowRHO;
         
 % preallocate        
         
 % lookup new rotor performance data based on new inflow velocity and angle         
         for i = 1:geomNumROTORS
            [ rotorRPM(:,:,i), rotorPx(:,:,i), rotorPy(:,:,i), rotorMx(:,:,i), rotorMy(:,:,i), rotorCP(:,:,i), rotorCMx(:,:,i), rotorJinf(:,:,i) ] ...
                    = fcnRPMLOOKUP( vecflowqNEW(:,:,i), flowRHO, vecAngNEW(:,:,i), rotorTHRUSTrho(:,:,i), ...
                    tabLOOKUP, vecANGLST );
         end
         
         vecAngNEW = repmat(-90,1,1,geomNumROTORS);
         
     else % all forward flight cases
         
% upwash/induced angle deflects resultant velocity upwards from rotor plane reducing the inflow angle
        vecVelNEW = sqrt((vecFREE-(vecINT).*sind(vecPITCH)).^2+((vecINT).*cosd(vecPITCH)).^2); %McCormick 8.86? (propeller)   
        vecAngNEW = vecPITCH - asind((vecINT).*cosd(vecPITCH)./vecVelNEW); %use in tablelookup
        vecflowqNEW = 0.5*flowRHO*vecVelNEW.^2;
        rotorTHRUSTrho = rotorTHRUST/flowRHO;
       
         % lookup new rotor performance data based on new inflow velocity and angle         
         for i = 1:geomNumROTORS
            [ rotorRPM(:,:,i), rotorPx(:,:,i), rotorPy(:,:,i), rotorMx(:,:,i), rotorMy(:,:,i), rotorCP(:,:,i), rotorCMx(:,:,i), rotorJinf(:,:,i) ] ...
                    = fcnRPMLOOKUP( vecflowqNEW(:,:,i), flowRHO, vecAngNEW(:,:,i), rotorTHRUSTrho(:,:,i), ...
                    tabLOOKUP, vecANGLST );

         end 
     end
end


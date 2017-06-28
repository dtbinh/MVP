function [ rotorTHRUST, rotorAngINFLOW, rotorVelINFLOW,...
            rotorRPM, rotorPx, rotorPy, rotorMx,...
            dragBODYinduced, liftBODY, pitchVEHICLE] ...
                = fcnFORCETRIM( V, rho, numrotors, geomBODYradius, dragVEHICLE, massVEHICLE )
%% FORCE TRIM
% This function determines the thrust and pitch attitude required to
% maintain the multirotor vehicle in force equilibrium. 

    valWEIGHT           = massVEHICLE*9.81;                  % Vehicle weight - value
        
    tempPITCHrad         = atan(dragVEHICLE/(valWEIGHT)); % First guess pitch - value

    coefLIFT            = 1.8*(valPITCHrad); % Assume body has puck shape
    coefDRAGinduced     = 0.81*(valPITCHrad)^2;
    
    liftBODY            = 0.5*rho*V^2*pi()*geomBODYradius^2*coefLIFT;
    dragBODYinduced     = 0.5*rho*V^2*pi()*geomBODYradius^2*coefDRAGinduced;
    
    tempTHRUST          = sqrt((weightVEHICLE+liftBODY)^2 + ...
                                (dragVEHICLE+dragBODYinduced)^2)/numrotors; % first guess thrust
    
    tempTHRUSTrho       = tempTHRUST/rho;
    
  %% look up rpm and Px based on thrust and inflow q and pitch
    % temp outputs
    rotorPx = 0;
    rpm = 2000;
    CP = 1;
    CM = 1;
    Py = 0;
    Mx = 1;
    My = 1;
    Jint = 1;
    
    %% inclues hover case
    
    valPITCHrad = asin((dragVEHICLE/numrotors*tempTHRUST+Px*valWEIGHT/numrotors+...
                                Px*liftBODY/numrotors+tempTHRUST*dragBODYinduced/numrotors)...
                                /(tempTHRUST^2+Px^2));
    
    tempTHRUST = sqrt((valWEIGHT/numrotors+liftBODY/numrotors+Px*sind(alpha2))^2 + (Dpar_tot/n+Di_body/n+Px*cosd(alpha2))^2);
    rotorTHRUST     = repmat(tempTHRUST, 1, 1, geomNumROTORS);

        
        
        
        

    

    
    
    
    
end


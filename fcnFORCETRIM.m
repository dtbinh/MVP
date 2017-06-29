function [ rotorTHRUST, rotorAngINFLOW, rotorVelINFLOW,...
            rotorRPM, rotorPx, rotorPy, rotorMx,...
            dragBODYinduced, liftBODY, pitchVEHICLE] ...
                = fcnFORCETRIM( flowq, flowRHO, numrotors, geomBODYradius, dragVEHICLE, massVEHICLE, tabLOOKUP, vecANGLELST )
%% FORCE TRIM
% This function determines the thrust and pitch attitude required to
% maintain the multirotor vehicle in force equilibrium. 

    valWEIGHT           = massVEHICLE*9.81;                  % Vehicle weight - value
        
    tempPITCHdeg         = atand(dragVEHICLE/(valWEIGHT)); % First guess pitch - value
    tempPITCHrad        = deg2rad(tempPITCHdeg);
    
    coefLIFT            = 1.8*(tempPITCHrad); % Assume body has puck shape
    coefDRAGinduced     = 0.81*(tempPITCHrad)^2;
    
    liftBODY            = flowq*pi()*geomBODYradius^2*coefLIFT;
    dragBODYinduced     = flowq*pi()*geomBODYradius^2*coefDRAGinduced;
    
    tempTHRUST          = sqrt((valWEIGHT+liftBODY)^2 + ...
                                (dragVEHICLE+dragBODYinduced)^2)/numrotors; % first guess thrust
    
    tempTHRUSTrho       = tempTHRUST/flowRHO;
    
  %% look up rpm and Px based on thrust and inflow q and pitch
    % temp outputs for single rotors - to be saved into 3d matrices for
    % variable tem
    % inputs: flowq, flowRHO, tempPITCHdeg, tempTHRUST, tabLOOKUP, vecANGLELST
    
    [ rotorRPM, rotorPx, rotorPy, rotorMx, rotorMy, rotorCP, rotorCMx, rotorJinf ] = fcnRPMLOOKUP( flowq, flowRHO, tempPITCHdeg, tempTHRUSTrho, tabLOOKUP, vecANGLELST );
    % outputs:
%     tempRPM = 2000;
%     tempPx = 0;
%     tempPy = 0;
%     tempMx = 1;
%     tempMy = 1;
%     tempCP = 1;
%     tempCMx = 1;
%     tempJinf = 1;
    
    %% inclues hover case
    
    valPITCHdeg = asind((dragVEHICLE/numrotors*tempTHRUST+tempPx*valWEIGHT/numrotors+...
                                tempPx*liftBODY/numrotors+tempTHRUST*dragBODYinduced/numrotors)...
                                /(tempTHRUST^2+tempPx^2));
    
                             
    tempTHRUST = sqrt((valWEIGHT/numrotors+liftBODY/numrotors+tempPx*sind(valPITCHdeg))^2 + (dragVEHICLE/numrotors+dragBODYinduced/numrotors+tempPx*cosd(valPITCHdeg))^2);
    rotorTHRUST     = repmat(tempTHRUST, 1, 1, geomNumROTORS);

        
        
        
        

    

    
    
    
    
end


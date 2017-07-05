function [ valPITCHdeg_in, valPITCHdeg_out, rotorTHRUST, liftBODY, dragBODYinduced, ...
            rotorRPM, rotorPx, rotorPy, rotorMx, rotorMy, rotorCP, ...
            rotorCMx, rotorJinf] = fcnCALCFORCES( flowq, flowRHO, geomBODYradius, ...
            numrotors, tempPITCHrad, dragVEHICLE, valWEIGHT, tabLOOKUP, vecANGLELST)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    valPITCHdeg_in      = rad2deg(tempPITCHrad);
    
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
    
    %outputs
    [ rotorRPM, rotorPx, rotorPy, rotorMx, rotorMy, rotorCP, rotorCMx, rotorJinf ] ...
        = fcnRPMLOOKUP( flowq, flowRHO, valPITCHdeg_in, tempTHRUSTrho, ...
        tabLOOKUP, vecANGLELST );

    
    %% inclues hover case
    
    valPITCHdeg_out     = asind((dragVEHICLE/numrotors*tempTHRUST+rotorPx*valWEIGHT/numrotors+...
                                rotorPx*liftBODY/numrotors+tempTHRUST*dragBODYinduced/numrotors)...
                                /(tempTHRUST^2+rotorPx^2));
    
                             
    rotorTHRUST = sqrt((valWEIGHT/numrotors+liftBODY/numrotors...
                        +rotorPx*sind(valPITCHdeg_out))^2 + ...
                        (dragVEHICLE/numrotors+dragBODYinduced/numrotors...
                        +rotorPx*cosd(valPITCHdeg_out))^2);
    


end


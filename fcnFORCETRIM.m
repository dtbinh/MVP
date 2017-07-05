function [ rotorTHRUST, rotorAngINFLOW, rotorVelINFLOW,...
            rotorRPM, rotorPx, rotorPy, rotorMx, rotorMy, ...
            rotorCP, rotorCMx, rotorJinf, dragBODYinduced, liftBODY,...
            pitchVEHICLEdeg] = fcnFORCETRIM( flowq, flowRHO, numrotors, ...
            geomBODYradius, dragVEHICLE, massVEHICLE, tabLOOKUP, vecANGLELST )
%% FORCE TRIM
% This function determines the thrust and pitch attitude required to
% maintain the multirotor vehicle in force equilibrium. 

% INPUTS
%   flowq       - dynamic pressure
%   flowRHO     - density at altitude
%   numrotors   - number of rotors
%   geomBODYradius - radius of central body
%   dragVEHICLE - parasitic drag calculated from fcnDRAGPREDICT
%   massVEHICLE - total mass
%   tabLOOKUP   - rotor data in lookup table form
%   vecANGLST   - list of angle of attacks available from rotor data

% OUTPUTS
%     rotorTHRUST   - for each rotor    
%     rotorRPM      - ""   
%     rotorPx       - ""
%     rotorPy       - ""    
%     rotorMx       - ""  
%     rotorMy       - ""   
%     rotorCP       - ""   
%     rotorCMx      - ""    
%     rotorJinf     - ""   
%     rotorAngINFLOW  - ""
%     rotorVelINFLOW  - ""
%     pitchVEHICLEdeg - vehicle pitch in degrees
%     dragBODYinduced - induced drag of body based on lift & pitch
%     liftBODY      - lift of body


    valWEIGHT       = massVEHICLE*9.81;                  % Vehicle weight - value
        
    tempPITCHdeg    = atand(dragVEHICLE/(valWEIGHT)); % First guess pitch - value
    tempPITCHrad    = deg2rad(tempPITCHdeg);
    
    [valPITCHdeg_in, valPITCHdeg_out, rotorTHRUST, liftBODY, dragBODYinduced, ...
            rotorRPM, rotorPx, rotorPy, rotorMx, rotorMy, rotorCP, ...
            rotorCMx, rotorJinf] = fcnCALCFORCES( flowq, flowRHO, geomBODYradius, ...
            numrotors, tempPITCHrad, dragVEHICLE, valWEIGHT, tabLOOKUP, vecANGLELST);

    while (1-valPITCHdeg_out/valPITCHdeg_in)*(1-valPITCHdeg_out/valPITCHdeg_in)>0.000001 % tmotor converges after 2
        
         [valPITCHdeg_in, valPITCHdeg_out, rotorTHRUST, liftBODY, dragBODYinduced, ...
            rotorRPM, rotorPx, rotorPy, rotorMx, rotorMy, rotorCP, ...
            rotorCMx, rotorJinf] = fcnCALCFORCES( flowq, flowRHO, geomBODYradius, ...
            numrotors, deg2rad(valPITCHdeg_out), dragVEHICLE, valWEIGHT, tabLOOKUP, vecANGLELST);
    end   
        
    % Save variables for each rotor
    % At the end of the force trim function, all rotors will have the same
    % performance properties. Repmat repeats the results of the force trim
    % function for each rotor on the vehicle.
    rotorTHRUST     = repmat(rotorTHRUST, 1, 1, numrotors);
    rotorRPM        = repmat(rotorRPM, 1, 1, numrotors);
    rotorPx         = repmat(rotorPx, 1, 1, numrotors);
    rotorPy         = repmat(rotorPy, 1, 1, numrotors);    
    rotorMx         = repmat(rotorMx, 1, 1, numrotors);    
    rotorMy         = repmat(rotorMy, 1, 1, numrotors);    
    rotorCP         = repmat(rotorCP, 1, 1, numrotors);
    rotorCMx        = repmat(rotorCMx, 1, 1, numrotors);
    rotorJinf       = repmat(rotorJinf, 1, 1, numrotors);
    rotorAngINFLOW  = repmat(valPITCHdeg_out, 1, 1, numrotors);
    rotorVelINFLOW  = repmat(sqrt(flowq/(0.5*flowRHO)), 1, 1, numrotors);
    pitchVEHICLEdeg = valPITCHdeg_out; % pitch of the vehicle based on equilibrium

end


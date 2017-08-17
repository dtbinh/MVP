function [rotorTHRUST, rotorRPM, rotorPx, rotorPy, ...
            rotorMx, rotorMy, rotorCP, rotorCMx, rotorJinf] ...
            = fcnMOMENTTRIM (rotorTHRUST, momentTOTAL, positionROTOR,...
            flowV, flowRHO, pitchVEHICLEdeg, geomNumROTORS, tabLOOKUP, vecANGLELST)
% Force trim gives equal thrust to all rotors.
%       ex. T1=T2=T3=T4
%
% Residual moments are calculated and the total residual moment of the
% vehicle, which is positive due to the heavy influence of positive rotor
% moments, is divided between the lead and trailing rotors to estimate
% rotor thrust by subtracting the moment contribution to the lead rotor and
% adding the rotor contribution to the trailing rotor. 
% (lead)        dT*R = -dM/2 --> Tnew = Told - dM/2R
% (trailing)    dT*R = +dM/2 --> Tnew = Told + dM/2R
%
% Once new thrust values are determined, new rotor speeds must be
% determined and rotor interference funciton applied. 
%
% Rotor performance values will be determined.
%
% Moments recalculated.

% CORRECT PITCHING MOMENT
% LEAD ROTOR THRUST in DIAMOND CONFIG ONLY (CHECK)
leadTHRUST = rotorTHRUST(:,:,1);
rotorTHRUST(:,:,1) = leadTHRUST - momentTOTAL(1,2)/(2*norm(positionROTOR(1,:)));

% TRAILING ROTOR THRUST in DIAMOND CONFIG ONLY (CHECK)
rearTHRUST = rotorTHRUST(:,:,3);
rotorTHRUST(:,:,3) = rearTHRUST + momentTOTAL(1,2)/(2*norm(positionROTOR(3,:)));

  
%CORRECT ROLL MOMENT
%LEFT ROTOR THRUST in DIAMOND CONFIG ONLY
leftTHRUST = rotorTHRUST(:,:,2);
rotorTHRUST(:,:,2) = leftTHRUST + momentTOTAL(1,1)/(2*norm(positionROTOR(2,:)));
    

%RIGHT ROTOR THRUST in DIAMOND CONFIG ONLY
rightTHRUST = rotorTHRUST(:,:,4);
rotorTHRUST(:,:,4) = rightTHRUST - momentTOTAL(1,1)/(2*norm(positionROTOR(4,:)));

rotorTHRUSTrho = rdivide(rotorTHRUST,flowRHO);

    %lookup new variables
    % Lookup new rotor data based on updated thrust
    for j = 1:geomNumROTORS
        [ rotorRPM(:,:,j), rotorPx(:,:,j), rotorPy(:,:,j), ...
            rotorMx(:,:,j), rotorMy(:,:,j), rotorCP(:,:,j),...
            rotorCMx(:,:,j), rotorJinf(:,:,j) ] = fcnRPMLOOKUP...
            ( flowV, flowRHO, pitchVEHICLEdeg, ...
            rotorTHRUSTrho(:,:,j), tabLOOKUP, vecANGLELST );
    end

    
    
end
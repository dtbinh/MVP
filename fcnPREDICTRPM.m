function [vi_int,vi_self,skewRAD,wi,...
            rotorAngINFLOW, rotorVelINFLOW, rotorRPM, rotorPx, rotorPy,...
            rotorMx, rotorMy, rotorCP, rotorCMx, rotorJinf,vi_int_total,vi_z] = fcnPREDICTRPM(flowq,flowRHO,geomNumROTORS,...
            geomNumBLADES,geomDIAMETER,rotorHUBLOCATIONS,rotorTHRUST,rotorRPM,...
            rotorAngINFLOW,rotorVelINFLOW, pitchVEHICLEdeg, vi_body,tabLOOKUP,vecANGLST)

% This function uses flow conditions, vehicle geometry, vehicle forces and
% rotor data to determine the mutual interference velocity of each rotor (WIM)
% then using the velocity data to change the rotor inflow conditions to 
% determine a more accurate RPM required for each rotor to maintain a given thrust.

% Initialize for convergence
%     counttemp=0;    % start counter to record number of error iterations until convergence is reached

    error=repmat(10000,1,1,geomNumROTORS);   % initialize error value to be above convergence value and 
    errorsum = sum(abs(error));

    vecFREE = repmat(sqrt(flowq/(flowRHO*0.5)),1,1, geomNumROTORS);
    vecPITCHdeg = repmat(pitchVEHICLEdeg,1,1, geomNumROTORS);    

    count = 0;

while errorsum(end) > 0.000001
count = count +1

% vi_int, vi_self...verified with old code
    [vi_int,vi_self,skewRAD,wi] = fcnWIM(flowRHO,geomNumROTORS,geomNumBLADES,geomDIAMETER,rotorHUBLOCATIONS,rotorTHRUST,rotorRPM,vecPITCHdeg,vecFREE);

    
    [rotorAngINFLOW, rotorVelINFLOW, rotorRPM_new, rotorPx, rotorPy, rotorMx, rotorMy, rotorCP, rotorCMx, rotorJinf, vi_int_total, vi_z] ...
        = fcnRPMUPDATE (flowq, flowRHO, vi_int(:,3,:), geomNumROTORS, rotorTHRUST, pitchVEHICLEdeg, vi_body, tabLOOKUP, vecANGLST);

    vi_int_total = reshape(vi_int_total,[1 3 geomNumROTORS]);
    
    error                   = rotorRPM_new-rotorRPM;
    errorsum                  = sum(abs(error));
        
% rpm reassign to final variable/variable used in next loop
    rotorRPM                = rotorRPM_new;

    
end

end


function [powerROTOR, powerTOTAL, powerVEHICLE] = fcnROTORPOWER (flowRHO, geomDIAMETER,...
                geomNumROTORS, rotorCP, rotorRPM, powerPARASITIC)
% This function calculates total power of eachh rotor

        tempRHO = repmat(flowRHO,1,1,geomNumROTORS);
        tempR   = repmat(geomDIAMETER/2,1,1,geomNumROTORS);
        tempPI  = repmat(pi(),1,1,geomNumROTORS);
        tempPAR = repmat(powerPARASITIC,1,1,geomNumROTORS);
        
        
        powerROTOR = rotorCP.*tempRHO.*tempPI.*tempR.^2.*(rotorRPM.*2./60.*tempPI.*tempR).^3;

        powerTOTAL = powerROTOR + tempPAR;

        powerVEHICLE = sum(powerTOTAL);

end
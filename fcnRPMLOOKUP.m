function [ rotorRPM, rotorPx, rotorPy, rotorMx, rotorMy, rotorCP, ...
            rotorCMx, rotorJinf ] = fcnRPMLOOKUP( flowq, flowRHO, ...
            valPITCHdeg, valTHRUSTrho, tabLOOKUP, vecANGLELST )

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[ highang, lowang ] = fcnFINDANG( valPITCHdeg, vecANGLELST );

% get RPM values
vecRPMhigh = unique(tabLOOKUP.RPM(tabLOOKUP.alpha == highang));
vecRPMlow = unique(tabLOOKUP.RPM(tabLOOKUP.alpha == lowang)); %delete

[ valRPM, valPx_rho, valPy_rho, valMx_rho, valMy_rho, valCP, valCMx, valJinf ] = fcnTABINTERP( vecRPMhigh, highang, tabLOOKUP, flowq, valTHRUSTrho );

[ valRPM(2), valPx_rho(2), valPy_rho(2), valMx_rho(2), valMy_rho(2), valCP(2), valCMx(2), valJinf(2) ] = fcnTABINTERP( vecRPMlow, lowang, tabLOOKUP, flowq, valTHRUSTrho );

tempANGS = [ highang, lowang ];
rotorRPM = interp1(tempANGS,valRPM,valPITCHdeg);
rotorPx = -1*interp1(tempANGS,valPx_rho,valPITCHdeg)*flowRHO; % Px is negative in lookup tables but needs to be positive for convention
rotorPy = interp1(tempANGS,valPy_rho,valPITCHdeg)*flowRHO;
rotorMx = interp1(tempANGS,valMx_rho,valPITCHdeg)*flowRHO;
rotorMy = interp1(tempANGS,valMy_rho,valPITCHdeg)*flowRHO;
rotorCP = interp1(tempANGS,valCP,valPITCHdeg);
rotorCMx = interp1(tempANGS,valCMx,valPITCHdeg);
rotorJinf = interp1(tempANGS,valJinf,valPITCHdeg);

end


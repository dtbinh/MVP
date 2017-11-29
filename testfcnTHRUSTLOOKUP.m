function [ rotorTHRUST, rotorPx, rotorPy, rotorMx, rotorMy, rotorCP, ...
            rotorCMx, rotorJinf ] = testfcnTHRUSTLOOKUP( flowq, flowRHO, ...
            valPITCHdeg, valRPM, tabLOOKUP, vecANGLELST, vecRPMLST ) 

%LOOKUP THRUST based on input RPM
%   sort aoa - low high
%   sort rpm - low high
%   sort q   - low high
% find thrust based on low and high qs
% interpolate at multiple levels



[ highang, lowang ] = fcnFINDANG( valPITCHdeg, vecANGLELST );
[ highrpm, lowrpm ] = testfcnFINDRPM( valRPM, vecRPMLST );


temprpm = [ lowrpm, highrpm ];



%will give two alpha values for low RPM and high RPM thrust values - then
%they will be interpolated again.

[ valTHRUST, valPx_rho, valPy_rho, valMx_rho, valMy_rho, valCP, valCMx, valJinf ] ...
    = testfcnTABINTERP_THRUST( temprpm, highang, tabLOOKUP, flowq, valRPM);

[ valTHRUST(2), valPx_rho(2), valPy_rho(2), valMx_rho(2), valMy_rho(2), valCP(2), valCMx(2), valJinf(2) ] ...
    = testfcnTABINTERP_THRUST( temprpm, lowang, tabLOOKUP, flowq, valRPM );

tempANGS = [ highang, lowang ];
rotorTHRUST = interp1(tempANGS,valTHRUST,valPITCHdeg)*flowRHO;
rotorPx = -1*interp1(tempANGS,valPx_rho,valPITCHdeg)*flowRHO; % Px is negative in lookup tables but needs to be positive for convention
rotorPy = interp1(tempANGS,valPy_rho,valPITCHdeg)*flowRHO;
rotorMx = interp1(tempANGS,valMx_rho,valPITCHdeg)*flowRHO;
rotorMy = interp1(tempANGS,valMy_rho,valPITCHdeg)*flowRHO;
rotorCP = interp1(tempANGS,valCP,valPITCHdeg);
rotorCMx = interp1(tempANGS,valCMx,valPITCHdeg);
rotorJinf = interp1(tempANGS,valJinf,valPITCHdeg);

end


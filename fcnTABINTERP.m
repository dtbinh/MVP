function [ valRPM, valPx_rho, valPy_rho, valMx_rho, valMy_rho, valCP, valCMx, valJinf ] = fcnTABINTERP( vecRPM, alpha, tabLOOKUP, flowq, valTHRUSTrho )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here


% interpolate for everything based on q and T
for i = 1:length(vecRPM)
    tempTHRUST = tabLOOKUP.Thrust_rho((tabLOOKUP.RPM(tabLOOKUP.alpha == alpha)) == vecRPM(i));
    tempq = tabLOOKUP.q((tabLOOKUP.RPM(tabLOOKUP.alpha == alpha)) == vecRPM(i));
    tempPx = tabLOOKUP.Px_rho((tabLOOKUP.RPM(tabLOOKUP.alpha == alpha)) == vecRPM(i));
    tempPy = tabLOOKUP.Py_rho((tabLOOKUP.RPM(tabLOOKUP.alpha == alpha)) == vecRPM(i));
    tempMx = tabLOOKUP.Mx_rho((tabLOOKUP.RPM(tabLOOKUP.alpha == alpha)) == vecRPM(i));
    tempMy = tabLOOKUP.My_rho((tabLOOKUP.RPM(tabLOOKUP.alpha == alpha)) == vecRPM(i));
    tempCP = tabLOOKUP.CP((tabLOOKUP.RPM(tabLOOKUP.alpha == alpha)) == vecRPM(i));
    tempCMx = tabLOOKUP.CM((tabLOOKUP.RPM(tabLOOKUP.alpha == alpha)) == vecRPM(i));
    tempJinf = tabLOOKUP.Jinf((tabLOOKUP.RPM(tabLOOKUP.alpha == alpha)) == vecRPM(i));
    
    vecTHRUST(i) = interp1(tempq,tempTHRUST,flowq)';
    vecPx(i) = interp1(tempq,tempPx,flowq)';
    vecPy(i) = interp1(tempq,tempPy,flowq)';
    vecMx(i) = interp1(tempq,tempMx,flowq)';
    vecMy(i) = interp1(tempq,tempMy,flowq)';
    vecCP(i) = interp1(tempq,tempCP,flowq)';
    vecCMx(i) = interp1(tempq,tempCMx,flowq)';
    vecJinf(i) = interp1(tempq,tempJinf,flowq)';


end

tempCURVE=polyfit(vecTHRUST,vecRPM',2);

valRPM=tempCURVE(1)*valTHRUSTrho^2+tempCURVE(2)*valTHRUSTrho+tempCURVE(3);

% interpolate rest of variables
valPx_rho=interp1(vecRPM,vecPx',valRPM,'linear','extrap');
valPy_rho=interp1(vecRPM',vecPy,valRPM,'linear','extrap');
valMx_rho=interp1(vecRPM',vecMx,valRPM,'linear','extrap');
valMy_rho=interp1(vecRPM',vecMy,valRPM,'linear','extrap');
valCP=interp1(vecRPM',vecCP,valRPM,'pchip','extrap');
valCMx=interp1(vecRPM',vecCMx,valRPM,'linear','extrap');
valJinf=interp1(vecRPM',vecJinf,valRPM,'linear','extrap');


end


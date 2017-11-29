function [ valTHRUST_rho, valPx_rho, valPy_rho, valMx_rho, valMy_rho, valCP, valCMx, valJinf ] ...
    = testfcnTABINTERP_THRUST( vecRPM, alpha, tabLOOKUP, flowq, valRPM)

%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%will give two alpha values for low RPM and high RPM thrust values - then
%they will be interpolated again.

for i = 1:2 %low and high q
% interpolate for everything based on q and T
   tempTHRUST = tabLOOKUP.Thrust_rho(tabLOOKUP.alpha == alpha & tabLOOKUP.RPM == vecRPM(i));
    tempq = tabLOOKUP.q(tabLOOKUP.alpha == alpha & tabLOOKUP.RPM == vecRPM(i));
    tempPx = tabLOOKUP.Px_rho(tabLOOKUP.alpha == alpha & tabLOOKUP.RPM == vecRPM(i));
    tempPy = tabLOOKUP.Py_rho(tabLOOKUP.alpha == alpha & tabLOOKUP.RPM == vecRPM(i));
    tempMx = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == alpha & tabLOOKUP.RPM == vecRPM(i));
    tempMy = tabLOOKUP.My_rho(tabLOOKUP.alpha == alpha & tabLOOKUP.RPM == vecRPM(i));
    tempCP = tabLOOKUP.CP(tabLOOKUP.alpha == alpha & tabLOOKUP.RPM == vecRPM(i));
    tempCMx = tabLOOKUP.CM(tabLOOKUP.alpha == alpha & tabLOOKUP.RPM == vecRPM(i));
    tempJinf = tabLOOKUP.Jinf(tabLOOKUP.alpha == alpha & tabLOOKUP.RPM == vecRPM(i));


    vecTHRUST(i) = interp1(tempq,tempTHRUST,flowq)';%lowq
    vecPx(i) = interp1(tempq,tempPx,flowq)';
    vecPy(i) = interp1(tempq,tempPy,flowq)';
    vecMx(i) = interp1(tempq,tempMx,flowq)';
    vecMy(i) = interp1(tempq,tempMy,flowq)';
    vecCP(i) = interp1(tempq,tempCP,flowq)';
    vecCMx(i) = interp1(tempq,tempCMx,flowq)';
    vecJinf(i) = interp1(tempq,tempJinf,flowq)';

end


% tempCURVE=polyfit(vecTHRUST,vecRPM',2);

% valRPM=tempCURVE(1)*valTHRUSTrho^2+tempCURVE(2)*valTHRUSTrho+tempCURVE(3);

% interpolate rest of variables
valTHRUST_rho=interp1(vecRPM',vecTHRUST,valRPM,'linear','extrap');
valPx_rho=interp1(vecRPM',vecPx,valRPM,'linear','extrap');
valPy_rho=interp1(vecRPM',vecPy,valRPM,'linear','extrap');
valMx_rho=interp1(vecRPM',vecMx,valRPM,'linear','extrap');
valMy_rho=interp1(vecRPM',vecMy,valRPM,'linear','extrap');
valCP=interp1(vecRPM',vecCP,valRPM,'pchip','extrap');
valCMx=interp1(vecRPM',vecCMx,valRPM,'linear','extrap');
valJinf=interp1(vecRPM',vecJinf,valRPM,'linear','extrap');


end


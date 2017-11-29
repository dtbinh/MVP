function [ high, low ] = testfcnFINDRPM( valRPM, vecRPMLST )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here


% Sort Angle - put in right before this function is called
    tempRPMDIFF = valRPM - vecRPMLST;

% send in high first then low
    high = vecRPMLST(tempRPMDIFF == max(tempRPMDIFF(tempRPMDIFF<0)));
    low = vecRPMLST(tempRPMDIFF == min(tempRPMDIFF(tempRPMDIFF>=0)));



end


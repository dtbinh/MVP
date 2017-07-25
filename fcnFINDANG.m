function [ high, low ] = fcnFINDANG( valPITCHdeg, vecANGLELST )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

% Sort Angle - put in right before this function is called
    tempANGLEDIFF = valPITCHdeg - vecANGLELST;

% send in high first then low
    high = vecANGLELST(tempANGLEDIFF == max(tempANGLEDIFF(tempANGLEDIFF<0)));
    low = vecANGLELST(tempANGLEDIFF == min(tempANGLEDIFF(tempANGLEDIFF>=0)));



end


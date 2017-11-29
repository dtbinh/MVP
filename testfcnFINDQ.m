function [ high, low ] = testfcnFINDQ( valQ, vecQLST )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here


 
% Sort Angle - put in right before this function is called
    tempQDIFF = valQ - vecQLST;

% send in high first then low
    high = vecQLST(tempQDIFF == max(tempQDIFF(tempQDIFF<0)));
    low = vecQLST(tempQDIFF == min(tempQDIFF(tempQDIFF>=0)));



end

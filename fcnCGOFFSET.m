function [geomCGoffset]=fcnCGOFFSET(massVEHICLE,massOFFSET,positionOFFSET,geomCGheight)

% Change the CG position where the Drag and Weight components act if offset
% is applied

% CASE - REAR ROTOR IN DIAMOND FORMATION ONLY

% Masses
% ------
% massOFFSET  - mass offset
% massVEHICLE - mass of vehicle
% (offset test does not include payload)
% 
% Lengths
% -------
% positionOFFSET  - length between origin and mass offset on rear rotor only



% Sum Moments about y
geomCGoffset(1,1) = (massOFFSET*positionOFFSET(1,1)+massVEHICLE*0)./(massVEHICLE+massOFFSET);

%Sum Moments in y
geomCGoffset(1,2) = (massOFFSET*positionOFFSET(1,2)+massVEHICLE*0)./(massVEHICLE+massOFFSET);

%Sum Moments in z
geomCGoffset(1,3) = (massOFFSET*positionOFFSET(1,3)+massVEHICLE*-geomCGheight)./(massVEHICLE+massOFFSET);


end
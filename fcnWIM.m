function [vi_int,vi_self,skewRAD,wi] = fcnWIM(flowRHO,geomNumROTORS,geomNumBLADES,geomDIAMETER,rotorHUBLOCATIONS,rotorTHRUST,rotorRPM,vecPITCH,vecFREE)
% This is the vectorize version of WIM_V12.m (verified July 21st 2017)
    % This function calculates the induced velocity caused by rotor/wake/body
    % interference in a rotorcraft/UAV at the center of the rotor. To be used
    % with TABLE LOOKUP
    % thrust(N), azimuth(rad), V(m/s), 
    % updated structures, geometry
    % Wake Interference Model V.10 Uses updated vortring and vortsegment


    
%% General Parameters 
    noseg=100;   % number of segments for VortRing calculation that divide rotor area
    nowakes=200; % number of wakes for VortRing calculation represented sequential rings below rotor plane

% Calculate rotor area
    rotorAREA = pi*(geomDIAMETER/2)^2;

% Calculate Circulation 
    vecCIRCULATION = rotorTHRUST./(flowRHO.*(rotorRPM./60)*rotorAREA*geomNumBLADES);
    vecCIRCULATION = permute(vecCIRCULATION,[1 3 2]);

% Assign the rotor hubs as the points of interest
    pointInterest = rotorHUBLOCATIONS;

%% Calculate skew angle and z offset
    u_wake = (vecFREE.*cosd(vecPITCH));
% Velocity perpendicular to plane plus velocity induced at rotor disc 6.15 in mccormick and find in leishmann
    w_wake = 0.5*(vecFREE.*sind(vecPITCH)+sqrt((vecFREE.*sind(vecPITCH).^2+2.*rotorTHRUST/(flowRHO*rotorAREA))));
    skewRAD=atan2(u_wake,w_wake); %calculate skew angle of wakes for influencing rotor 3.18 issi thesis

    vecZOFFSET = 1/(rotorRPM./60).*0.5.*(vecFREE.*sind(vecPITCH)+sqrt((vecFREE.*sind(vecPITCH)).^2+(2.*rotorTHRUST./(flowRHO.*rotorAREA))))*(1/geomNumBLADES);
    vecZOFFSET = permute(vecZOFFSET,[1 3 2]);
    [wi] = VortRingV(nowakes,noseg,geomNumBLADES,vecZOFFSET,skewRAD(1),geomDIAMETER/2,vecCIRCULATION,pointInterest,rotorHUBLOCATIONS);

%add induced velocities and subtract rotor of interest to get interference 
    vi_int = zeros(1,3,geomNumROTORS);
    vi_self = zeros(1,3,geomNumROTORS);
    temp = sum(wi,3);

% NOTE: this only works when number of rotor = number of POI
    for m=1:geomNumROTORS
            vi_int(:,:,m)= temp(m,:) -  wi(m,:,m);
            vi_self(:,:,m) = wi(m,3,m); % self induced velocities
    end


end


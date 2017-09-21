% Rotor Ring Wake Test
clear,clc
% close all
flowRHO = 1.225;
geomNumROTORS = 1;
geomNumBLADES = 2;
geomDIAMETER = 0.4572;
rotorHUBLOCATIONS = [0 0 0]; %10000 10000 10000; 10000 10000 10000; 10000 10000 10000];
rotorTHRUST = 9;
rotorRPM = 2600;
vecPITCH = 25.15;
vecFREE = 15;


   
%% General Parameters 
    noseg=100;   % number of segments for VortRing calculation that divide rotor area
    nowakes=200; % number of wakes for VortRing calculation represented sequential rings below rotor plane

% Calculate rotor area
    rotorAREA = pi*(geomDIAMETER/2)^2;

% Calculate Circulation 
    vecCIRCULATION = rotorTHRUST./(flowRHO.*(rotorRPM./60)*rotorAREA*geomNumBLADES);
    vecCIRCULATION = permute(vecCIRCULATION,[1 3 2]);

    i = 1;
    
% Assign the rotor hubs as the points of interest
for X = -0.6:0.05:0.6
for Y = -0.6:0.05:0.6
pointInterest = [X Y 0];
    %% Calculate skew angle and z offset
    u_wake = (vecFREE.*cosd(vecPITCH));
% Velocity perpendicular to plane plus velocity induced at rotor disc 6.15 in mccormick and find in leishmann
    w_wake = 0.5*(vecFREE.*sind(vecPITCH)+sqrt((vecFREE.*sind(vecPITCH).^2+2.*rotorTHRUST/(flowRHO*rotorAREA))));
    skewRAD=atan2(u_wake,w_wake); %calculate skew angle of wakes for influencing rotor 3.18 issi thesis

    vecZOFFSET = 1/(rotorRPM./60).*0.5.*(vecFREE.*sind(vecPITCH)+sqrt((vecFREE.*sind(vecPITCH)).^2+(2.*rotorTHRUST./(flowRHO.*rotorAREA))))*(1/geomNumBLADES);
    vecZOFFSET = permute(vecZOFFSET,[1 3 2]);
    [wi(i,:)] = VortRingV(nowakes,noseg,geomNumBLADES,vecZOFFSET,skewRAD(1),geomDIAMETER/2,vecCIRCULATION,pointInterest,rotorHUBLOCATIONS);

%add induced velocities and subtract rotor of interest to get interference 
    vi_int = zeros(1,3,geomNumROTORS);
    vi_self = zeros(1,3,geomNumROTORS);
    temp = sum(wi,3);

% NOTE: this only works when number of rotor = number of POI
    for m=1:geomNumROTORS
            vi_int(i,:,m)= temp(m,:) -  wi(m,:,m);
            vi_self(i,:,m) = wi(m,3,m); % self induced velocities
    end
    i = i+1;
end
end
    
%% VAPTOR 
ynew = -0.6:0.05:0.6;
x = -0.6:0.05:0.6;
RING = reshape(wi(:,3),[length(ynew),length(x)]);

load('Julia2600rpmFFSEPT20.mat')

%average the normal induced velocity by number of azimuth stations
avg = mean(induced_vel1(:,3,:),3);

VAPTOR = reshape(avg,[25,25]);

%% PLOT
for i = 1:3:length(ynew)
    figure(i)
    hold on
    plot(ynew,RING(:,i),'g',ynew,VAPTOR(:,i),'k')
    xlabel('rotor span in y-dir [m]')
    ylabel('normal component of induced velocity [m/s]')
    str = sprintf('x = %f',y(i));
    title(str);
end

%% Quiver Plot
z = 0;
y= ynew;
x = ynew;
[X,Y,Z]=meshgrid(x,y,z);
X = X(:);
Y = Y(:);
Z = Z(:);

w = wi(:,3);
u = zeros(length(w),1);
v = zeros(length(w),1);
z = repmat(z,length(w),1,1);

figure;
quiver3(X,Y,Z,u,v,w)

function [positionROTOR, positionMOTOR, positionARM, positionLEG,...
            positionBODY, positionPAYLOAD] = fcnCOORDSETUP(numLEADROTOR, geomNumROTORS,...
            geomARMlength, geomBODYradius, geomMOTORradius, geomLEGcentreradius, geomLEGcentreheight, ...
            geomPAYLOADheight, geomHUBheight, geomCGheight, geomCGoffset)
%% COORDINATE SYSTEM
%  Coordinate system for diamond configuration.
%                            |y
%                     4      |  +      (+z up) 
%                     |      |_____x
%                     |     
%                     |
% Vinf --> 1 ---------|---------3
%                     |
%                     |
%                     |
%                     2
%                  Top View
        
        
        
%% Angle between arms based on variable number of rotors
    tempangARMS = 360/geomNumROTORS;


%% Moment arms per component
%Rotor
%Distance from origin to rotor hub
    distROTORHUB    = sqrt((geomARMlength + geomBODYradius + geomMOTORradius)^2+geomHUBheight^2);
    distHUBHEIGHT   = geomHUBheight;
%Arm
%Distance from origin to centre of arm
    distARMCENTRE   = 0.5*geomARMlength+geomBODYradius;
    
%Motor
%Distance from origin to centre of motor
    distMOTORCENTRE = geomARMlength + geomBODYradius + geomMOTORradius;

%Leg
    distLEGRADIAL   = geomLEGcentreradius;
    distLEGHEIGHT   = geomLEGcentreheight;

%CG
    distCGz          = geomCGheight;
    
%PAYLOAD
    distPAYLOADHEIGHT = geomPAYLOADheight;
    
    
%% Set up coodinate system for each component based on flight orientation
if numLEADROTOR == 1 % square
    positionROTOR = zeros(geomNumROTORS,3);
    positionMOTOR = zeros(geomNumROTORS,3);
    positionARM = zeros(geomNumROTORS,3);
    positionLEG = zeros(geomNumROTORS,3);
    positionBODY = zeros(geomNumROTORS,3);
    positionPAYLOAD = zeros(geomNumROTORS,3);
    
     for i=1:geomNumROTORS
            positionROTOR(i,1:3)    = [-distMOTORCENTRE*cosd((i-1)*tempangARMS),-distMOTORCENTRE*sind((i-1)*tempangARMS),-distHUBHEIGHT]; %rotors labelled 1-4 ccw
            positionMOTOR(i,1:3)    = [-distMOTORCENTRE*cosd((i-1)*tempangARMS),-distMOTORCENTRE*sind((i-1)*tempangARMS),0]; %rotors labelled 1-4 ccw
            positionARM(i,1:3)      = [-distARMCENTRE*cosd((i-1)*tempangARMS),-distARMCENTRE*sind((i-1)*tempangARMS),0]; %rotors labelled 1-4 ccw
            positionLEG(i,1:3)      = [-distLEGRADIAL*cosd((i-1)*tempangARMS),-distLEGRADIAL*sind((i-1)*tempangARMS),-distLEGHEIGHT]; %rotors labelled 1-4 ccw
            positionBODY(i,1:3)     = geomCGoffset; %xyz components of CG
            positionPAYLOAD(i,1:3)  = [0,0,-distPAYLOADHEIGHT];
     end
    
elseif numLEADROTOR == 2
    
    positionROTOR = zeros(geomNumROTORS,3);
    positionMOTOR = zeros(geomNumROTORS,3);
    positionARM = zeros(geomNumROTORS,3);
    positionLEG = zeros(geomNumROTORS,3);
    positionBODY = zeros(geomNumROTORS,3);
    positionPAYLOAD = zeros(geomNumROTORS,3);
    
    for i=1:geomNumROTORS
            positionROTOR(i,1:3) = [-distMOTORCENTRE*cosd((i-1)*tempangARMS+tempangARMS*0.5),-distMOTORCENTRE*sind((i-1)*tempangARMS+tempangARMS*0.5),-geomHUBheight]; %rotors labelled 1-4 ccw
            positionMOTOR(i,1:3) = [-distMOTORCENTRE*cosd((i-1)*tempangARMS+tempangARMS*0.5),-distMOTORCENTRE*sind((i-1)*tempangARMS+tempangARMS*0.5),0]; %rotors labelled 1-4 ccw
            positionARM(i,1:3) = [-distARMCENTRE*cosd((i-1)*tempangARMS+tempangARMS*0.5),-distARMCENTRE*sind((i-1)*tempangARMS+tempangARMS*0.5),0]; %rotors labelled 1-4 ccw
            positionLEG(i,1:3) = [-distLEGRADIAL*cosd((i-1)*tempangARMS+tempangARMS*0.5),-distLEGRADIAL*sind((i-1)*tempangARMS+tempangARMS*0.5),-distLEGHEIGHT]; %rotors labelled 1-4 ccw
            positionBODY(i,1:3) = geomCGoffset;
            positionPAYLOAD(i,1:3) = [0,0,-distPAYLOADHEIGHT];
    end
        
     
end   

end
function [seqV, flowTEMP, flowALT, flowRHO, flowMU, flowM, flowR, flowALPHAT,...
            angCLIMBdeg, angSIDEdeg, numLEADROTOR,...
            geomTypeROTOR, geomNumROTORS, geomDIAMETER, geomNumBLADES,...
            geomARMlength, geomARMradius, geomBODYheight, geomBODYradius,...
            geomLEGlength, geomLEGradius, geomLEGcentreradius, geomLEGcentreheight,...
            geomPAYLOADlength, geomPAYLOADradius, geomPAYLOADheight,...
            geomMOTORheight, geomMOTORradius, geomHUBheight, geomCGheight,...
            massMOTOR, massARM, massLEG, massPAYLOAD, massBODY, massVEHICLE] = fcnMVPREAD( strFILE )
% This function reads the MVP input file

fp = fopen(strFILE);

%% Reading Flow Velocity
% Reading flow velocity sweep numbers
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
seqV = fscanf(fp,'%f');

%% Reading Atmospheric Conditions
% Reading flow tempurature
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
flowTEMP = fscanf(fp,'%f');

% Reading flow altitude
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
flowALT = fscanf(fp,'%f');

% Reading flow altitude
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
flowRHO = fscanf(fp,'%f');

% Reading flow dynamic viscosity
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
flowMU = fscanf(fp,'%f');

% Reading flow kg/mol
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
flowM = fscanf(fp,'%f');

% Reading flow gas constant
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
flowR = fscanf(fp,'%f');

% Reading flow alpha coefficient
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
flowALPHAT = fscanf(fp,'%f');


%% Reading Flight Orientation
% Reading climb angle
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
angCLIMBdeg = fscanf(fp,'%f');

% Reading side slip angle
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
angSIDEdeg = fscanf(fp,'%f');

% Reading number of leading rotors 1 or 2
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
numLEADROTOR = fscanf(fp,'%f');


%% Reading Rotor Geometry and Properties
% Reading rotor type
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
d = 0;
j = 0;
while(d~=2)
    ch = fscanf(fp,'%c',1);
    if(ch=='"')
        d = d+1;
    else
        j = j+1;
        geomTypeROTOR(j) = ch;
    end
end

% Reading number of rotors
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomNumROTORS = fscanf(fp,'%d');

% Reading rotor diameter
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomDIAMETER = fscanf(fp,'%f');

% Reading number of blades per rotor
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomNumBLADES = fscanf(fp,'%f');


%% Reading Vehicle Geomertry 
% Reading arm length
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomARMlength = fscanf(fp,'%f');


% Reading arm radius
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomARMradius = fscanf(fp,'%f');


% Reading body height
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomBODYheight = fscanf(fp,'%f');


% Reading body radius
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomBODYradius = fscanf(fp,'%f');


% Reading leg length
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomLEGlength = fscanf(fp,'%f');


% Reading leg radius
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomLEGradius = fscanf(fp,'%f');


% Reading leg centre radius (from origin to leg centre in radial direction only)
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomLEGcentreradius = fscanf(fp,'%f');


% Reading leg centre height (from origin to leg centre in vertical direction only)
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomLEGcentreheight = fscanf(fp,'%f');

% Reading payload length (as cylinder)
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomPAYLOADlength = fscanf(fp,'%f');


% Reading payload radius (as cylinder)
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomPAYLOADradius = fscanf(fp,'%f');


% Reading payload height (from origin to payload centre in vertical direction only)
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomPAYLOADheight = fscanf(fp,'%f');



% Reading motor height (width of motor casing)
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomMOTORheight = fscanf(fp,'%f');


% Reading motor radius
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomMOTORradius = fscanf(fp,'%f');


% Reading rotor hub height (from mid motor (along x axis only) to mid rotor
% hub)
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomHUBheight = fscanf(fp,'%f');

% Reading height from origin to CG
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
geomCGheight = fscanf(fp,'%f');


%% Reading Vehicle Component Masses
% Reading motor mass
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
massMOTOR = fscanf(fp,'%f');

% Reading arm mass
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
massARM = fscanf(fp,'%f');

% Reading leg mass
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
massLEG = fscanf(fp,'%f');

% Reading payload mass
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
massPAYLOAD = fscanf(fp,'%f');

% Reading body mass
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
massBODY = fscanf(fp,'%f');

% Reading total vehicle mass
ch = fscanf(fp,'%c',1);
while(ch~='=')
    ch = fscanf(fp,'%c',1);
end
massVEHICLE = fscanf(fp,'%f');


end


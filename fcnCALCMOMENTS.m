function [ momentROTORTHRUST, momentROTORPx, momentROTORPy, momentROTORMx, momentROTORMy,...
            momentWEIGHTMOTOR, momentWEIGHTARM, momentDRAGMOTOR, momentDRAGARM, momentWEIGHTLEG,...
            momentDRAGLEG, momentWEIGHTBODY, momentWEIGHTPAYLOAD, momentDRAGBODY, momentDRAGPAYLOAD,...
            momentLIFTBODY, momentDRAGBODYinduced, momentTOTAL] ...
            = fcnCALCMOMENTS(massMOTOR, massARM, massLEG, massPAYLOAD, massBODY, ...
            positionROTOR, positionMOTOR, positionARM, positionLEG, positionBODY, positionPAYLOAD,...
            dragVEHICLE, dragARM, dragLEG, dragBODY, dragMOTOR, dragPAYLOAD, dragBODYinduced, liftBODY, ...
            rotorTHRUST, rotorPx, rotorPy, rotorMx, rotorMy,pitchVEHICLEdeg, geomNumROTORS)

% Rotate component coordinates by pitch attitude

    [matROTATEVEHICLE]      = fcnROTATE(0,pitchVEHICLEdeg,0); %pitch angle   
    [rotpositionROTOR, rotpositionMOTOR, rotpositionARM, rotpositionLEG,...
        rotpositionBODY, rotpositionPAYLOAD] = fcnCOORDROTATE(positionROTOR, ...
        positionMOTOR, positionARM, positionLEG,...
        positionBODY, positionPAYLOAD, matROTATEVEHICLE);  

  % variable number of rotors 
  % forces that rotate based on pitch attitude
  
  % preallocate for number of rotors
        momentROTORTHRUST   = zeros(geomNumROTORS,3);
        momentROTORPx       = zeros(geomNumROTORS,3);
        momentROTORPy       = zeros(geomNumROTORS,3);
        momentROTORMx       = zeros(geomNumROTORS,3);
        momentROTORMy       = zeros(geomNumROTORS,3);
        momentWEIGHTMOTOR   = zeros(geomNumROTORS,3);
        momentWEIGHTARM     = zeros(geomNumROTORS,3);
        momentDRAGMOTOR     = zeros(geomNumROTORS,3);
        momentDRAGARM       = zeros(geomNumROTORS,3);
        momentWEIGHTLEG     = zeros(4,3);
        momentDRAGLEG     = zeros(4,3);
    
    for i = 1:geomNumROTORS
        momentROTORTHRUST(i,1:3) = cross(rotpositionROTOR(i,:),[0,0,rotorTHRUST(i)]*matROTATEVEHICLE,2);
        momentROTORPx(i,1:3) = cross(rotpositionROTOR(i,:),[rotorPx(i),0,0]*matROTATEVEHICLE,2);
        momentROTORPy(i,1:3) = cross(rotpositionROTOR(i,:),[0,rotorPy(i),0]*matROTATEVEHICLE,2);
        momentROTORMx(i,1:3) = [rotorMx(i),0,0];
        momentROTORMy(i,1:3) = [0,-rotorMy(i),0];
        momentWEIGHTMOTOR(i,1:3) = cross(rotpositionMOTOR(i,:),[0,0,-massMOTOR*9.81],2);
        momentWEIGHTARM(i,1:3) = cross(rotpositionARM(i,:),[0,0,-massARM*9.81],2);
        momentDRAGMOTOR(i,1:3) = cross(rotpositionMOTOR(i,:),[dragMOTOR,0,0],2);
        momentDRAGARM(i,1:3) = cross(rotpositionARM(i,:),[dragARM,0,0],2);
    end

% set number of legs
    for i = 1:4
        momentWEIGHTLEG(i,1:3) = cross(rotpositionLEG(i,:),[0,0,-massLEG*9.81],2);
        momentDRAGLEG(i,1:3) = cross(rotpositionLEG(i,:),[dragLEG,0,0],2);
    end

% forces that rotate based on flight path angle
        momentWEIGHTBODY(1,1:3) = cross(rotpositionBODY(1,:),[0,0,-massBODY*9.81],2);
        momentWEIGHTPAYLOAD(1,1:3) = cross(rotpositionPAYLOAD(1,:),[0,0,-massPAYLOAD*9.81],2);
        momentDRAGBODY(1,1:3) = cross(rotpositionBODY(1,:),[dragBODY(1,:),0,0],2);  
        momentDRAGPAYLOAD(1,1:3) = cross(rotpositionPAYLOAD(1,:),[dragPAYLOAD,0,0],2);
        momentDRAGBODYinduced(1,1:3) = cross(rotpositionBODY(1,:),[dragBODYinduced,0,0],2);  
        momentLIFTBODY(1,1:3) = cross(rotpositionBODY(1,:),[0,0,-liftBODY],2);

% Calculate total moments
momentTOTAL = sum(momentROTORTHRUST) + sum(momentROTORPx) + sum(momentROTORPy) + ...
    sum(momentROTORMx) + sum(momentROTORMy) + sum(momentWEIGHTMOTOR) + sum(momentWEIGHTARM) + ...
    sum(momentDRAGMOTOR) + sum(momentDRAGARM)+ sum(momentWEIGHTLEG) + sum(momentDRAGLEG) + ...
    momentWEIGHTBODY + momentWEIGHTPAYLOAD + momentDRAGBODY + momentDRAGPAYLOAD + ...
            momentLIFTBODY + momentDRAGBODYinduced;
      
      
      
end
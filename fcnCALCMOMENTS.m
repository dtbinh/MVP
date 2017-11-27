function [ momentROTORTHRUST, momentROTORPx, momentROTORPy, momentROTORMx, momentROTORMy,...
            momentWEIGHTMOTOR, momentWEIGHTARM, momentDRAGMOTOR, momentDRAGARM, momentWEIGHTLEG,...
            momentDRAGLEG, momentWEIGHTBODY, momentWEIGHTPAYLOAD, momentDRAGBODY, momentDRAGPAYLOAD,...
            momentLIFTBODY, momentDRAGBODYinduced, momentWEIGHTOFFSET, momentTOTAL,rotorPy2] ...
            = fcnCALCMOMENTS(massMOTOR, massARM, massLEG, massPAYLOAD, massBODY, massOFFSET, ...
            positionROTOR, positionMOTOR, positionARM, positionLEG, positionBODY, positionPAYLOAD,positionOFFSET,...
            dragVEHICLE, dragARM, dragLEG, dragBODY, dragMOTOR, dragPAYLOAD, dragBODYinduced, liftBODY, ...
            rotorTHRUST, rotorPx, rotorPy, rotorMx, rotorMy,pitchVEHICLEdeg, geomNumROTORS)

% Rotate component coordinates by pitch attitude

    [matROTATEVEHICLE]      = fcnROTATE(0,pitchVEHICLEdeg,0); %pitch angle   
    [rotpositionROTOR, rotpositionMOTOR, rotpositionARM, rotpositionLEG,...
        rotpositionBODY, rotpositionPAYLOAD,rotpositionOFFSET] = fcnCOORDROTATE(positionROTOR, ...
        positionMOTOR, positionARM, positionLEG,...
        positionBODY, positionPAYLOAD, positionOFFSET, matROTATEVEHICLE);  

  % variable number of rotors 
  % forces that rotate based on pitch attitude
  
  % preallocate for number of rotors
        momentROTORTHRUST   = zeros(1,3,geomNumROTORS);
        momentROTORPx       = zeros(1,3,geomNumROTORS);
        momentROTORPy       = zeros(1,3,geomNumROTORS);
        momentROTORMx       = zeros(1,3,geomNumROTORS);
        momentROTORMy       = zeros(1,3,geomNumROTORS);
        momentWEIGHTMOTOR   = zeros(1,3,geomNumROTORS);
        momentWEIGHTARM     = zeros(1,3,geomNumROTORS);
        momentDRAGMOTOR     = zeros(1,3,geomNumROTORS);
        momentDRAGARM       = zeros(1,3,geomNumROTORS);
        momentWEIGHTLEG     = zeros(1,3,4);
        momentDRAGLEG     = zeros(1,3,4);
        
 
        
    for i = 1:geomNumROTORS
        momentROTORTHRUST(:,1:3,i) = cross(rotpositionROTOR(i,:),[0,0,rotorTHRUST(i)]*matROTATEVEHICLE,2);
        momentROTORPx(:,1:3,i) = cross(rotpositionROTOR(i,:),[rotorPx(i),0,0]*matROTATEVEHICLE,2);
        
                
        % Rolling moments - CCW is +ve and CW is -ve
        if i == 1 || i == 3 %if lead and 
            rotorPy2(i) = -rotorPy(i);
            momentROTORMx(:,1:3,i) = [-rotorMx(i),0,0]; % CCW is +ve Py
        else
            rotorPy2(i) = rotorPy(i);
            momentROTORMx(:,1:3,i) = [rotorMx(i),0,0]; %CW
        end
        
        momentROTORPy(:,1:3,i) = cross(rotpositionROTOR(i,:),[0,rotorPy2(i),0]*matROTATEVEHICLE,2);
        
        momentROTORMy(:,1:3,i) = [0,rotorMy(i),0];
        momentWEIGHTMOTOR(:,1:3,i) = cross(rotpositionMOTOR(i,:),[0,0,-massMOTOR*9.81],2);
        momentWEIGHTARM(:,1:3,i) = cross(rotpositionARM(i,:),[0,0,-massARM*9.81],2);
        momentDRAGMOTOR(:,1:3,i) = cross(rotpositionMOTOR(i,:),[dragMOTOR,0,0],2);
        momentDRAGARM(:,1:3,i) = cross(rotpositionARM(i,:),[dragARM,0,0],2);
    end

    for i = 1:geomNumROTORS
        moment2ROTORTHRUST(:,1:3,i) = cross(rotpositionROTOR(i,:),[0,0,rotorTHRUST(i)]*matROTATEVEHICLE,2);
        moment2ROTORPx(:,1:3,i) = cross(rotpositionROTOR(i,:),[rotorPx(i),0,0]*matROTATEVEHICLE,2);
    end
    
    
% set number of legs
    for i = 1:4
        momentWEIGHTLEG(:,1:3,i) = cross(rotpositionLEG(i,:),[0,0,-massLEG*9.81],2);
        momentDRAGLEG(:,1:3,i) = cross(rotpositionLEG(i,:),[dragLEG,0,0],2);
    end

% forces that rotate based on flight path angle
        momentWEIGHTBODY(:,1:3) = cross(rotpositionBODY(1,:),[0,0,-massBODY*9.81],2);
        momentWEIGHTPAYLOAD(:,1:3) = cross(rotpositionPAYLOAD(1,:),[0,0,-massPAYLOAD*9.81],2);
        momentDRAGBODY(:,1:3,1) = cross(rotpositionBODY(1,:),[dragBODY(1,:),0,0],2);  
        momentDRAGPAYLOAD(:,1:3) = cross(rotpositionPAYLOAD(1,:),[dragPAYLOAD,0,0],2);
        momentDRAGBODYinduced(:,1:3) = cross(rotpositionBODY(1,:),[dragBODYinduced,0,0],2);  
        momentLIFTBODY(:,1:3) = cross(rotpositionBODY(1,:),[0,0,-liftBODY],2);
      %%%%%%%%%%%%NEW%%%%%%%%%%%%%%%%
        momentWEIGHTOFFSET(:,1:3) = cross(rotpositionOFFSET(1,:),[0,0,-massOFFSET*9.81],2);

% Calculate total moments
momentTOTAL = sum(momentROTORTHRUST(end,:,:),3) + sum(momentROTORPx(end,:,:),3) + sum(momentROTORPy(end,:,:),3) + ...
    sum(momentROTORMx(end,:,:),3) + sum(momentROTORMy(end,:,:),3) + sum(momentWEIGHTMOTOR(end,:,:),3) + sum(momentWEIGHTARM(end,:,:),3) + ...
    sum(momentDRAGMOTOR(end,:,:),3) + sum(momentDRAGARM(end,:,:),3)+ sum(momentWEIGHTLEG(end,:,:),3) + sum(momentDRAGLEG(end,:,:),3) + ...
    momentWEIGHTBODY(end,:) + momentWEIGHTPAYLOAD(end,:) + momentDRAGBODY(end,:) + momentDRAGPAYLOAD(end,:) + ...
    momentLIFTBODY(end,:) + momentDRAGBODYinduced(end,:) +momentWEIGHTOFFSET(end,:);
                                                                %%%%%%%%%%%%%%
      
      
end
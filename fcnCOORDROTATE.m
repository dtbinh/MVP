function [rotpositionROTOR, rotpositionMOTOR, rotpositionARM, rotpositionLEG,...
            rotpositionBODY, rotpositionPAYLOAD,rotpositionOFFSET] = fcnCOORDROTATE(positionROTOR, ...
            positionMOTOR, positionARM, positionLEG,...
            positionBODY, positionPAYLOAD, positionOFFSET, matROTATE)


    rotpositionROTOR = positionROTOR*matROTATE;
    rotpositionMOTOR = positionMOTOR*matROTATE;
    rotpositionARM = positionARM*matROTATE;
    rotpositionLEG = positionLEG*matROTATE;
    rotpositionBODY = positionBODY(1,:)*matROTATE;
    rotpositionPAYLOAD = positionPAYLOAD(1,:);
    rotpositionOFFSET = positionOFFSET*matROTATE;


end
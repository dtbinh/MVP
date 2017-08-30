%% TOTALS - First
momentTOTALROTORFORCES = momentROTORTHRUST(:,:,1)+momentROTORTHRUST(:,:,2)+ ...
                    momentROTORTHRUST(:,:,3)+momentROTORTHRUST(:,:,4)+ ...
                    momentROTORPx(:,:,1)+momentROTORPx(:,:,2)+ ...
                    momentROTORPx(:,:,3)+momentROTORPx(:,:,4)+ ...
                    momentROTORPy(:,:,1)+momentROTORPy(:,:,2)+ ...
                    momentROTORPy(:,:,3)+momentROTORPy(:,:,4);
                  
momentTOTALROTORMOMENTS = momentROTORMx(:,:,1)+momentROTORMx(:,:,2)+ ...
                    momentROTORMx(:,:,3)+momentROTORMx(:,:,4)+ ...
                    momentROTORMy(:,:,1)+momentROTORMy(:,:,2)+ ...
                    momentROTORMy(:,:,3)+momentROTORMy(:,:,4);
              
momentTOTALDRAG =  momentDRAGMOTOR(:,:,1)+momentDRAGMOTOR(:,:,2)+...
                   momentDRAGMOTOR(:,:,3)+momentDRAGMOTOR(:,:,4)+...
                   momentDRAGARM(:,:,1)+momentDRAGARM(:,:,2)+...
                   momentDRAGARM(:,:,3)+momentDRAGARM(:,:,4)+...
                   momentDRAGLEG(:,:,1)+momentDRAGLEG(:,:,2)+...
                   momentDRAGLEG(:,:,3)+momentDRAGLEG(:,:,4)+...
                   momentDRAGBODY(:,:)+momentDRAGPAYLOAD(:,:)+...
                   momentDRAGBODYinduced(:,:);

momentTOTALWEIGHTS = momentWEIGHTMOTOR(:,:,1)+momentWEIGHTMOTOR(:,:,2)+...
                   momentWEIGHTMOTOR(:,:,3)+momentWEIGHTMOTOR(:,:,4)+...
                   momentWEIGHTARM(:,:,1)+momentWEIGHTARM(:,:,2)+...
                   momentWEIGHTARM(:,:,3)+momentWEIGHTARM(:,:,4)+...
                   momentWEIGHTLEG(:,:,1)+momentWEIGHTLEG(:,:,2)+... 
                   momentWEIGHTLEG(:,:,3)+momentWEIGHTLEG(:,:,4)+...
                   momentWEIGHTBODY(:,:)+momentWEIGHTPAYLOAD(:,:)+momentWEIGHTOFFSET(:,:);

momentTOTALLIFTBODY = momentLIFTBODY(:,:);

% TESTmomentTOTAL = sum(momentTOTALROTORFORCES(:,1),momentTOTALROTORMOMENTS(:,1),momentTOTALDRAG(:,1),...
%     momentTOTALWEIGHTS(:,1),momentTOTALLIFTBODY(:,1));

%% LAST TOTALS
momentTOTALROTORFORCES2 = momentROTORTHRUST2(:,:,1)+momentROTORTHRUST2(:,:,2)+ ...
                    momentROTORTHRUST2(:,:,3)+momentROTORTHRUST2(:,:,4)+ ...
                    momentROTORPx2(:,:,1)+momentROTORPx2(:,:,2)+ ...
                    momentROTORPx2(:,:,3)+momentROTORPx2(:,:,4)+ ...
                    momentROTORPy2(:,:,1)+momentROTORPy2(:,:,2)+ ...
                    momentROTORPy2(:,:,3)+momentROTORPy2(:,:,4);
                  
momentTOTALROTORMOMENTS2 = momentROTORMx2(:,:,1)+momentROTORMx2(:,:,2)+ ...
                    momentROTORMx2(:,:,3)+momentROTORMx2(:,:,4)+ ...
                    momentROTORMy2(:,:,1)+momentROTORMy2(:,:,2)+ ...
                    momentROTORMy2(:,:,3)+momentROTORMy2(:,:,4);
              
momentTOTALDRAG2 =  momentDRAGMOTOR2(:,:,1)+momentDRAGMOTOR2(:,:,2)+...
                   momentDRAGMOTOR2(:,:,3)+momentDRAGMOTOR2(:,:,4)+...
                   momentDRAGARM2(:,:,1)+momentDRAGARM2(:,:,2)+...
                   momentDRAGARM2(:,:,3)+momentDRAGARM2(:,:,4)+...
                   momentDRAGLEG2(:,:,1)+momentDRAGLEG2(:,:,2)+...
                   momentDRAGLEG2(:,:,3)+momentDRAGLEG2(:,:,4)+...
                   momentDRAGBODY2(:,:)+momentDRAGPAYLOAD2(:,:)+...
                   momentDRAGBODYinduced2(:,:);

momentTOTALWEIGHTS2 = momentWEIGHTMOTOR2(:,:,1)+momentWEIGHTMOTOR2(:,:,2)+...
                   momentWEIGHTMOTOR2(:,:,3)+momentWEIGHTMOTOR2(:,:,4)+...
                   momentWEIGHTARM2(:,:,1)+momentWEIGHTARM2(:,:,2)+...
                   momentWEIGHTARM2(:,:,3)+momentWEIGHTARM2(:,:,4)+...
                   momentWEIGHTLEG2(:,:,1)+momentWEIGHTLEG2(:,:,2)+... 
                   momentWEIGHTLEG2(:,:,3)+momentWEIGHTLEG2(:,:,4)+...
                   momentWEIGHTBODY2(:,:)+momentWEIGHTPAYLOAD2(:,:)+momentWEIGHTOFFSET2(:,:);

momentTOTALLIFTBODY2 = momentLIFTBODY2(:,:);

%% GRADIENTS
% First Run
for j = 1:1:countV
     if j>1                             

            gradmomentFORCES(j,1)            = momentTOTALROTORFORCES(j,1) - momentTOTALROTORFORCES(j-1,1);
            gradmomentMOMENTS(j,1)           = momentTOTALROTORMOMENTS(j,1) - momentTOTALROTORMOMENTS(j-1,1);
            gradmomentDRAG(j,1)              = momentTOTALDRAG(j,1) - momentTOTALDRAG(j-1,1);
            gradmomentWEIGHTS(j,1)           = momentTOTALWEIGHTS(j,1) - momentTOTALWEIGHTS(j-1,1);
            gradmomentLIFT(j,1)              = momentLIFTBODY(j,1) - momentLIFTBODY(j-1,1);
            gradmomentTOTAL(j,1)             = momentTOTAL(j,1) - momentTOTAL(j-1,1); 

     else
            gradmomentFORCES(j,1)            = 0;
            gradmomentMOMENTS(j,1)           = 0;
            gradmomentDRAG(j,1)              = 0;
            gradmomentWEIGHTS(j,1)           = 0;
            gradmomentLIFT(j,1)              = 0;
            gradmomentTOTAL(j,1)             = 0;

     end
end

% Last Run
for j = 1:1:countV
     if j>1                             

            gradmomentFORCES2(j,1)            = momentTOTALROTORFORCES2(j,1) - momentTOTALROTORFORCES2(j-1,1);
            gradmomentMOMENTS2(j,1)           = momentTOTALROTORMOMENTS2(j,1) - momentTOTALROTORMOMENTS2(j-1,1);
            gradmomentDRAG2(j,1)              = momentTOTALDRAG2(j,1) - momentTOTALDRAG2(j-1,1);
            gradmomentWEIGHTS2(j,1)           = momentTOTALWEIGHTS2(j,1) - momentTOTALWEIGHTS2(j-1,1);
            gradmomentLIFT2(j,1)              = momentLIFTBODY2(j,1) - momentLIFTBODY2(j-1,1);
            gradmomentTOTAL2(j,1)             = momentTOTAL2(j,1) - momentTOTAL2(j-1,1); 
            
     else
            gradmomentFORCES2(j,1)            = 0;
            gradmomentMOMENTS2(j,1)           = 0;
            gradmomentDRAG2(j,1)              = 0;
            gradmomentWEIGHTS2(j,1)           = 0;
            gradmomentLIFT2(j,1)              = 0;
            gradmomentTOTAL2(j,1)             = 0;

     end
end


%% ROLL MOMENTS
% Residual moments (force trim only) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
% Weights - from components
figure;
plot(flowV, momentTOTALROTORFORCES(:,1),'--b+',...
    flowV, momentTOTALROTORMOMENTS(:,1),'--ro',...
    flowV, momentTOTALDRAG(:,1),':rs',...
    flowV, momentTOTALLIFTBODY(:,1),'-.kh',...
    flowV, momentTOTALWEIGHTS(:,1), '-gd')
hold on
plot (flowV, momentTOTAL(:,1), 'LineWidth',2)
title('Residual Moments vs Airspeed (Force Trim Only)')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')

% Residual moments (force and moment trim) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
% Weights - from components
figure;
plot(flowV, momentTOTALROTORFORCES2(:,1),'--b+',...
    flowV, momentTOTALROTORMOMENTS2(:,1),'--ro',...
    flowV, momentTOTALDRAG2(:,1),':rs',...
    flowV, momentTOTALLIFTBODY2(:,1),'-.kh',...
    flowV, momentTOTALWEIGHTS2(:,1), '-gd')
hold on
plot (flowV, momentTOTAL2(:,1), 'LineWidth',2)
title('Residual Moments vs Airspeed (Force and Moment Trim)')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')


% Gradients of residual moments (force trim only) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
% Weights - from components
figure;
plot(flowV, gradmomentFORCES(:,1),'--b+',...
    flowV, gradmomentMOMENTS(:,1),'--ro',...
    flowV, gradmomentDRAG(:,1),':rs',...
    flowV, gradmomentLIFT(:,1),'-.kh',...
    flowV, gradmomentWEIGHTS(:,1), '-gd')
hold on
plot (flowV, gradmomentTOTAL(:,1), 'LineWidth',2)
title('Gradients of Residual Moments vs Airspeed (Force Trim Only)')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')

% Gradients of residual moments (force and moment trim) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
% Weights - from components
figure;
plot(flowV, gradmomentFORCES2(:,1),'--b+',...
    flowV, gradmomentMOMENTS2(:,1),'--ro',...
    flowV, gradmomentDRAG2(:,1),':rs',...
    flowV, gradmomentLIFT2(:,1),'-.kh',...
    flowV, gradmomentWEIGHTS2(:,1), '-gd')
hold on
plot (flowV, gradmomentTOTAL2(:,1), 'LineWidth',2)
title('Gradients of Residual Moments vs Airspeed (Force and Moment Trim)')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')


%% PLOTS flowV
% Residual moments (force trim only) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
% Weights - from components
figure;
plot(flowV, momentTOTALROTORFORCES(:,2),'--b+',...
    flowV, momentTOTALROTORMOMENTS(:,2),'--ro',...
    flowV, momentTOTALDRAG(:,2),':rs',...
    flowV, momentTOTALLIFTBODY(:,2),'-.kh',...
    flowV, momentTOTALWEIGHTS(:,2), '-gd')
hold on
plot (flowV, momentTOTAL(:,2), 'LineWidth',2)
title('Residual Moments vs Airspeed (Force Trim Only)')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')

% Residual moments (force and moment trim) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
% Weights - from components
figure;
plot(flowV, momentTOTALROTORFORCES2(:,2),'--b+',...
    flowV, momentTOTALROTORMOMENTS2(:,2),'--ro',...
    flowV, momentTOTALDRAG2(:,2),':rs',...
    flowV, momentTOTALLIFTBODY2(:,2),'-.kh',...
    flowV, momentTOTALWEIGHTS2(:,2), '-gd')
hold on
plot (flowV, momentTOTAL2(:,2), 'LineWidth',2)
title('Residual Moments vs Airspeed (Force and Moment Trim)')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')

% Rotor thrust (force trim only) vs airspeed
figure;
plot(flowV, rotorTHRUST(:,:,1), flowV, rotorTHRUST(:,:,2),...
    flowV, rotorTHRUST(:,:,3),flowV, rotorTHRUST(:,:,4))
title('Rotor Thrust vs Airspeed (Force Trim Only)')
legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')


% Rotor thrust (after moment trim) vs airspeed
figure;
plot(flowV, rotorTHRUST2(:,:,1), flowV, rotorTHRUST2(:,:,2),...
    flowV, rotorTHRUST2(:,:,3),flowV, rotorTHRUST2(:,:,4))
title('Rotor Thrust vs Airspeed (Force and Moment Trim)')
legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')

% Rotor RPM (force trim only) vs airspeed
figure;
plot(flowV, rotorRPM(:,:,1), flowV, rotorRPM(:,:,2),...
    flowV, rotorRPM(:,:,3),flowV, rotorRPM(:,:,4))
title('Rotor RPM vs Airspeed (Force Trim Only)')
legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')

% Rotor RPM (after moment trim) vs airspeed
figure;
plot(flowV, rotorRPM2(:,:,1), flowV, rotorRPM2(:,:,2),...
    flowV, rotorRPM2(:,:,3),flowV, rotorRPM2(:,:,4))
title('Rotor RPM vs Airspeed (Force and Moment Trim)')
legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')

% Rotor Power (force trim only) vs airspeed
figure;
plot(flowV, powerTOTAL(:,:,1), flowV, powerTOTAL(:,:,2),...
    flowV, powerTOTAL(:,:,3),flowV, powerTOTAL(:,:,4))
title('Rotor Power vs Airspeed (Force Trim Only)')
legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')

% Rotor Power (after moment trim) vs airspeed
figure;
plot(flowV, powerTOTAL2(:,:,1), flowV, powerTOTAL2(:,:,2),...
    flowV, powerTOTAL2(:,:,3),flowV, powerTOTAL2(:,:,4))
title('Total Rotor Power vs Airspeed (Force and Moment Trim)')
legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')

% Total Power vs aispeed
figure;
plot(flowV, powerVEHICLE(:,1), flowV, powerVEHICLE2(:,1))
title('Total Vehicle Power vs Airspeed (Force and Moment Trim)')
legend('Force Trim Only','Moment and Force Trim','Location','northwest')


% Gradients of residual moments (force trim only) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
% Weights - from components
figure;
plot(flowV, gradmomentFORCES(:,2),'--b+',...
    flowV, gradmomentMOMENTS(:,2),'--ro',...
    flowV, gradmomentDRAG(:,2),':rs',...
    flowV, gradmomentLIFT(:,2),'-.kh',...
    flowV, gradmomentWEIGHTS(:,2), '-gd')
hold on
plot (flowV, gradmomentTOTAL(:,2), 'LineWidth',2)
title('Gradients of Residual Moments vs Airspeed (Force Trim Only)')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')

% Gradients of residual moments (force and moment trim) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
% Weights - from components
figure;
plot(flowV, gradmomentFORCES2(:,2),'--b+',...
    flowV, gradmomentMOMENTS2(:,2),'--ro',...
    flowV, gradmomentDRAG2(:,2),':rs',...
    flowV, gradmomentLIFT2(:,2),'-.kh',...
    flowV, gradmomentWEIGHTS2(:,2), '-gd')
hold on
plot (flowV, gradmomentTOTAL2(:,2), 'LineWidth',2)
title('Gradients of Residual Moments vs Airspeed (Force and Moment Trim)')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')



%% PLOTS pitch 
% 
% % Residual moments (force trim only) vs airspeed
% % About y-axis only (pitch)
% % Rotor Forces - Thrust, Px, Py
% % Rotor Moments - Mx, My
% % Drag - Dpar, Dind
% % Lift - from body
% % Weights - from components
% figure;
% plot(pitchVEHICLEdeg, momentTOTALROTORFORCES,'--b+',...
%     pitchVEHICLEdeg, momentTOTALROTORMOMENTS,'--ro',...
%     pitchVEHICLEdeg, momentTOTALDRAG,':rs',...
%     pitchVEHICLEdeg, momentTOTALLIFTBODY,'-.kh',...
%     pitchVEHICLEdeg, momentTOTALWEIGHTS, '-gd')
% hold on
% plot (pitchVEHICLEdeg, momentTOTAL(:,2), 'LineWidth',2)
% title('Residual Moments vs Airspeed (Force Trim Only)')
% legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')
% 
% % Residual moments (force and moment trim) vs airspeed
% % About y-axis only (pitch)
% % Rotor Forces - Thrust, Px, Py
% % Rotor Moments - Mx, My
% % Drag - Dpar, Dind
% % Lift - from body
% % Weights - from components
% figure;
% plot(pitchVEHICLEdeg, momentTOTALROTORFORCES2,'--b+',...
%     pitchVEHICLEdeg, momentTOTALROTORMOMENTS2,'--ro',...
%     pitchVEHICLEdeg, momentTOTALDRAG2,':rs',...
%     pitchVEHICLEdeg, momentTOTALLIFTBODY2,'-.kh',...
%     pitchVEHICLEdeg, momentTOTALWEIGHTS2, '-gd')
% hold on
% plot (pitchVEHICLEdeg, momentTOTAL2(:,2), 'LineWidth',2)
% title('Residual Moments vs Airspeed (Force and Moment Trim)')
% legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')
% 
% % Rotor thrust (after moment trim) vs airspeed
% figure;
% plot(pitchVEHICLEdeg, rotorTHRUST2(:,:,1), pitchVEHICLEdeg, rotorTHRUST2(:,:,2),...
%     pitchVEHICLEdeg, rotorTHRUST2(:,:,3),pitchVEHICLEdeg, rotorTHRUST2(:,:,4))
% title('Rotor Thrust vs Airspeed (Force and Moment Trim)')
% legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')
% 
% % Rotor RPM (force trim only) vs airspeed
% figure;
% plot(pitchVEHICLEdeg, rotorRPM(:,:,1), pitchVEHICLEdeg, rotorRPM(:,:,2),...
%     pitchVEHICLEdeg, rotorRPM(:,:,3),pitchVEHICLEdeg, rotorRPM(:,:,4))
% title('Rotor RPM vs Airspeed (Force Trim Only)')
% legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')
% 
% % Rotor RPM (after moment trim) vs airspeed
% figure;
% plot(pitchVEHICLEdeg, rotorRPM2(:,:,1), pitchVEHICLEdeg, rotorRPM2(:,:,2),...
%     pitchVEHICLEdeg, rotorRPM2(:,:,3),pitchVEHICLEdeg, rotorRPM2(:,:,4))
% title('Rotor RPM vs Airspeed (Force and Moment Trim)')
% legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')
% 
% % Rotor Power (force trim only) vs airspeed
% figure;
% plot(pitchVEHICLEdeg, powerTOTAL(:,:,1), pitchVEHICLEdeg, powerTOTAL(:,:,2),...
%     pitchVEHICLEdeg, powerTOTAL(:,:,3),pitchVEHICLEdeg, powerTOTAL(:,:,4))
% title('Rotor Power vs Airspeed (Force Trim Only)')
% legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')
% 
% % Rotor Power (after moment trim) vs airspeed
% figure;
% plot(pitchVEHICLEdeg, powerTOTAL2(:,:,1), pitchVEHICLEdeg, powerTOTAL2(:,:,2),...
%     pitchVEHICLEdeg, powerTOTAL2(:,:,3),pitchVEHICLEdeg, powerTOTAL2(:,:,4))
% title('Total Rotor Power vs Airspeed (Force and Moment Trim)')
% legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')
% 
% % Total Power vs aispeed
% figure;
% plot(pitchVEHICLEdeg, powerVEHICLE(:,1), pitchVEHICLEdeg, powerVEHICLE2(:,1))
% title('Total Vehicle Power vs Airspeed (Force and Moment Trim)')
% legend('Force Trim Only','Moment and Force Trim','Location','northwest')
% 
% 
% % Gradients of residual moments (force trim only) vs airspeed
% % About y-axis only (pitch)
% % Rotor Forces - Thrust, Px, Py
% % Rotor Moments - Mx, My
% % Drag - Dpar, Dind
% % Lift - from body
% % Weights - from components
% figure;
% plot(pitchVEHICLEdeg, gradmomentFORCES,'--b+',...
%     pitchVEHICLEdeg, gradmomentMOMENTS,'--ro',...
%     pitchVEHICLEdeg, gradmomentDRAG,':rs',...
%     pitchVEHICLEdeg, gradmomentLIFT,'-.kh',...
%     pitchVEHICLEdeg, gradmomentWEIGHTS, '-gd')
% hold on
% plot (pitchVEHICLEdeg, gradmomentTOTAL(:,2), 'LineWidth',2)
% title('Gradients of Residual Moments vs Airspeed (Force Trim Only)')
% legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')
% 
% % Gradients of residual moments (force and moment trim) vs airspeed
% % About y-axis only (pitch)
% % Rotor Forces - Thrust, Px, Py
% % Rotor Moments - Mx, My
% % Drag - Dpar, Dind
% % Lift - from body
% % Weights - from components
% figure;
% plot(pitchVEHICLEdeg, gradmomentFORCES2,'--b+',...
%     pitchVEHICLEdeg, gradmomentMOMENTS2,'--ro',...
%     pitchVEHICLEdeg, gradmomentDRAG2,':rs',...
%     pitchVEHICLEdeg, gradmomentLIFT2,'-.kh',...
%     pitchVEHICLEdeg, gradmomentWEIGHTS2, '-gd')
% hold on
% plot (pitchVEHICLEdeg, gradmomentTOTAL2(:,2), 'LineWidth',2)
% title('Gradients of Residual Moments vs Airspeed (Force and Moment Trim)')
% legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')
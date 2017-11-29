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
                    momentROTORMy(:,:,3)+momentROTORMy(:,:,4)+...
                    momentROTORQ(:,:,1)+momentROTORQ(:,:,2)+ ...
                    momentROTORQ(:,:,3)+momentROTORQ(:,:,4);
              
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

                        momentTOTALROTORTORQUES2 =     momentROTORQ2(:,:,1)+momentROTORQ2(:,:,2)+ ...
                    momentROTORQ2(:,:,3)+momentROTORQ2(:,:,4);
                
                
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

%% THRUST
% Rotor thrust (force trim only) vs airspeed
% figure;
% plot(flowV, rotorTHRUST(:,:,1),'-ro', flowV, rotorTHRUST(:,:,2),'-b+',...
%     flowV, rotorTHRUST(:,:,3),'-ks',flowV, rotorTHRUST(:,:,4),'-gx')
% title('Rotor Thrust vs Airspeed (Force Trim)')
% xlabel('Airspeed [m/s]')
% ylabel('Rotor Thrust [N]')
% legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')

% Rotor thrust (after moment trim) vs airspeed
figure;
plot(flowV, rotorTHRUST2(:,:,1),'-ro', flowV, rotorTHRUST2(:,:,2),'-b+',...
    flowV, rotorTHRUST2(:,:,3),'-ks',flowV, rotorTHRUST2(:,:,4),'-gx')
title('Rotor Thrust vs Airspeed (Moment Trim)')
xlabel('Airspeed [m/s]')
ylabel('Rotor Thrust [N]')
legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')


%% RPM
% Rotor RPM (after moment trim) vs airspeed
% figure;
% plot(flowV, rotorRPM(:,:,1),'-ro', flowV, rotorRPM(:,:,2),'-b+',...
%     flowV, rotorRPM(:,:,3),'-ks',flowV, rotorRPM(:,:,4),'-gx')
% title('Rotor RPM vs Airspeed (Force Trim)')
% xlabel('Airspeed [m/s]')
% ylabel('Rotor RPM')
% legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')


% Rotor RPM (force trim only) vs airspeed
figure;
plot(flowV, rotorRPM2(:,:,1),'-ro', flowV, rotorRPM2(:,:,4),'-b+',...
    flowV, rotorRPM2(:,:,3),'-ks',flowV, rotorRPM2(:,:,2),'-gx')
% title('Rotor RPM vs Airspeed (Moment Trim)')
xlabel('Airspeed [m/s]')
ylabel('RPM')
legend('Lead','Right','Rear','Left','Location','northwest')

%% MOMENTS
% Residual moments (force trim only) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
%% Weights - from components
% figure;
% plot(flowV, momentTOTALROTORFORCES(:,2),'--b+',...
%     flowV, momentTOTALROTORMOMENTS(:,2),'--mo',...
%     flowV, momentTOTALDRAG(:,2),':rs',...
%     flowV, momentTOTALLIFTBODY(:,2),'-.kh',...
%     flowV, momentTOTALWEIGHTS(:,2), '-gd')
% hold on
% plot (flowV, momentTOTAL(:,2), 'LineWidth',2)
% title('Residual Moments vs Airspeed (Force Trim Only)')
% xlabel('Airspeed [m/s]')
% ylabel('Residual Moments [Nm]')
% legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')

% Residual moments (force and moment trim) vs airspeed
% About y-axis only (pitch)
% Rotor Forces - Thrust, Px, Py
% Rotor Moments - Mx, My
% Drag - Dpar, Dind
% Lift - from body
% Weights - from components
figure;
plot(flowV, momentTOTALROTORFORCES2(:,1),'--b+',...
    flowV, momentTOTALROTORMOMENTS2(:,1),'--mo',...
    flowV, momentTOTALROTORTORQUES2(:,1),'--co',...
    flowV, momentTOTALDRAG2(:,1),':rs',...
    flowV, momentTOTALLIFTBODY2(:,1),'-.kh',...
    flowV, momentTOTALWEIGHTS2(:,1), '-gd')
hold on
plot (flowV, momentTOTAL2(:,1), 'LineWidth',2)
title('Roll')
xlabel('Airspeed [m/s]')
ylabel('Residual Rolling Moment [Nm]')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')



figure;
plot(flowV, momentTOTALROTORFORCES2(:,2),'--b+',...
    flowV, momentTOTALROTORMOMENTS2(:,2),'--mo',...
    flowV, momentTOTALROTORTORQUES2(:,2),'--co',...
    flowV, momentTOTALDRAG2(:,2),':rs',...
    flowV, momentTOTALLIFTBODY2(:,2),'-.kh',...
    flowV, momentTOTALWEIGHTS2(:,2), '-gd')
hold on
plot (flowV, momentTOTAL2(:,2), 'LineWidth',2)
title('Pitch')
xlabel('Airspeed [m/s]')
ylabel('Residual Pitching Moment [Nm]')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')


figure;
plot(flowV, momentTOTALROTORFORCES2(:,3),'--b+',...
    flowV, momentTOTALROTORMOMENTS2(:,3),'--mo',...
    flowV, momentTOTALROTORTORQUES2(:,3),'--co',...
    flowV, momentTOTALDRAG2(:,3),':rs',...
    flowV, momentTOTALLIFTBODY2(:,3),'-.kh',...
    flowV, momentTOTALWEIGHTS2(:,3), '-gd')
hold on
plot (flowV, momentTOTAL2(:,3), 'LineWidth',2)
title('Yaw')
xlabel('Airspeed [m/s]')
ylabel('Residual Yawing Moment [Nm]')
legend('Rotor Forces','Rotor Moments','Drag','Lift','Weights','Total','Location','southwest')

figure;
Mx_total = momentROTORMx2(:,1,1)+ momentROTORMx2(:,1,2)+momentROTORMx2(:,1,3)+momentROTORMx2(:,1,4);
plot(flowV,momentROTORMx2(:,1,1),'-ro',...
    flowV,momentROTORMx2(:,1,2),'-b+',...
    flowV,momentROTORMx2(:,1,3),'-ks',...
    flowV,momentROTORMx2(:,1,4),'-gx','LineWidth',1.5)
title('Roll')
xlabel('Airspeed [m/s]')
ylabel('Residual Rolling Moment [Nm]')
legend('Mx - Lead','Mx - Left','Mx - Rear','Mx - Right','Location','northwest')

figure;
Py_total = momentROTORPy2(:,3,1)+ momentROTORPy2(:,3,2)+momentROTORPy2(:,3,3)+momentROTORPy2(:,3,4);
Px_total = momentROTORPx2(:,3,1)+ momentROTORPx2(:,3,2)+momentROTORPx2(:,3,3)+momentROTORPx2(:,3,4);

plot(flowV,momentROTORPy2(:,3,1),'-ro',...
    flowV,momentROTORPy2(:,3,2),'-b+',...
    flowV,momentROTORPy2(:,3,3),'-ks',...
    flowV,momentROTORPy2(:,3,4),'-gx','LineWidth',1.5)
hold on
plot(flowV,momentROTORPx2(:,3,1),'--ro',...
    flowV,momentROTORPx2(:,3,2),'--b+',...
    flowV,momentROTORPx2(:,3,3),'--ks',...
    flowV,momentROTORPx2(:,3,4),'--gx','LineWidth',1.5)
hold on
plot(flowV,Py_total + Px_total);
title('Yaw')
xlabel('Airspeed [m/s]')
ylabel('Residual Yawing Moment [Nm]')
legend('Py - Lead','Py - Left','Py - Rear','Py - Right',...
    'Px - Lead','Px - Left','Px - Rear','Px - Right','Total','Location','northwest')

%% POWER
% Rotor Power (force trim only) vs airspeed
% figure;
% plot(flowV, powerTOTAL(:,:,1),'-ro', flowV, powerTOTAL(:,:,2),'-b+',...
%     flowV, powerTOTAL(:,:,3),'-ks',flowV, powerTOTAL(:,:,4),'-gx')
% title('Rotor Power vs Airspeed (Force Trim)')
% xlabel('Airspeed [m/s]')
% ylabel('Rotor Power [W]')
% legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')

% Rotor Power (after moment trim) vs airspeed
figure;
plot(flowV, powerTOTAL2(:,:,1),'-ro', flowV, powerTOTAL2(:,:,2),'-b+',...
    flowV, powerTOTAL2(:,:,3),'-ks',flowV, powerTOTAL2(:,:,4),'-gx')
title('Total Rotor Power vs Airspeed (Moment Trim)')
xlabel('Airspeed [m/s]')
ylabel('Rotor Power [W]')
legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','northwest')

% Total Power vs aispeed
figure;
plot(flowV, powerVEHICLE(:,1), flowV, powerVEHICLE2(:,1))
title('Total Vehicle Power vs Airspeed (Moment Trim)')
xlabel('Airspeed [m/s]')
ylabel('Vehicle Power [W]')
legend('Force Trim Only','Moment and Force Trim','Location','northwest')


%% WAKE INTERFERENCE - INFLOW ANGLES

%% aR/theta vs Airspeed
angRATIO= rotorAngINFLOW(:,:,:)./pitchVEHICLEdeg(:,1); 
 angRATIO(angRATIO>10^3)="";

angRATIO_int_only = AngINT(:,:,:)./pitchVEHICLEdeg(:,1);
 angRATIO_int_only(angRATIO_int_only>10^3)="";

figure;
plot(flowV,angRATIO(:,1,1),'-ro',...
    flowV,angRATIO(:,1,2),'-b+',...
    flowV,angRATIO(:,1,3),'-ks',...
    flowV,angRATIO(:,1,4),'-gx')
title('Ratio of rotor inflow angle by vehicle pitch')
xlabel('Airspeed [m/s]')
ylabel('\alpha_{R} / \theta')
hold on
plot(flowV,angRATIO_int_only(:,1),'-.ro',...
    flowV,angRATIO_int_only(:,2),'-.b+',...
    flowV,angRATIO_int_only(:,3),'-.ks',...
    flowV,angRATIO_int_only(:,4),'-.gx')
legend('Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Rotor 1 - Lead','Rotor 2 - Left','Rotor 3 - Rear','Rotor 4 - Right','Location','southeast')
hold off

%% aR and theta vs Airspeed
figure;
plot(flowV, pitchVEHICLEdeg,'k',...
    flowV,rotorAngINFLOW(:,:,1),'-ro',...
    flowV,rotorAngINFLOW(:,:,2),'-b+',...
    flowV,rotorAngINFLOW(:,:,3),'-ks',...
    flowV,rotorAngINFLOW(:,:,4),'-gx')
legend('Vehicle Pitch','Lead','Left','Rear','Right','Location','southeast')
xlabel('Airspeed [m/s]')
ylabel('Inflow Angle \alpha_{R}')

figure;
plot(flowV, pitchVEHICLEdeg,'k',...
    flowV,rotorAngINFLOW(:,:,1)- pitchVEHICLEdeg,'-ro',...
    flowV,rotorAngINFLOW(:,:,2)-  pitchVEHICLEdeg,'-b+',...
    flowV,rotorAngINFLOW(:,:,3)- pitchVEHICLEdeg,'-ks',...
    flowV,rotorAngINFLOW(:,:,4)-  pitchVEHICLEdeg,'-gx')
legend('Vehicle Pitch','Lead','Left','Rear','Right','Location','southeast')
xlabel('Airspeed [m/s]')
ylabel('Inflow Angle \alpha_{R}')

%% mutual interference velocity
FREE = [flowV zeros(length(flowV),1) zeros(length(flowV),1)]
FREEplusINT = FREE + vi_z;
VR_INT = sqrt(sum(abs(FREEplusINT).^2,2))
FREEplusINTplusBODY = FREEplusINT + vi_body;
VR_INT_BODY = sqrt(sum(abs(FREEplusINTplusBODY).^2,2))

% resultant velocity including body interference only
figure;
plot(flowV, flowV./flowV,'k',...
    flowV,norm(VR_INT(:,:,1))./flowV ,'-.ro',...
    flowV,norm(VR_INT(:,:,2))./flowV,'-.b+',...
    flowV,norm(VR_INT(:,:,3))./flowV,'-.ks',...
    flowV,norm(VR_INT(:,:,4))./flowV,'-.gx')
xlabel('Vehicle Pitch [deg]')
ylabel('V_{R} / V_{\infty}')




% resultant velocity including body interference only
figure;
plot(flowV, flowV./flowV,'k',...
    flowV,(VR_INT(:,:,1))./flowV ,'-.ro',...
    flowV,(VR_INT(:,:,2))./flowV,'-.b+',...
    flowV,(VR_INT(:,:,3))./flowV,'-.ks',...
    flowV,(VR_INT(:,:,4))./flowV,'-.gx')
xlabel('Vehicle Pitch [deg]')
ylabel('V_{R} / V_{\infty}')



% 
% hold on
% % resultant velocity including rotor and body interference
% plot(pitchVEHICLEdeg,VR_INT_BODY(:,:,1)./flowV,'-ro',...
%     pitchVEHICLEdeg,VR_INT_BODY(:,:,2)./flowV,'-b+',...
%     pitchVEHICLEdeg,VR_INT_BODY(:,:,3)./flowV,'-ks',...
%     pitchVEHICLEdeg,VR_INT_BODY(:,:,4)./flowV,'-gx')
% hold off
% legend('Pitch', 'Rotor 1 V+vint - Lead','Rotor 2 V+vint - Left','Rotor 3 V+vint - Rear','Rotor 4 V+vint - Right','Rotor 1 VR - Lead','Rotor 2 VR - Left','Rotor 3 VR - Rear','Rotor 4 VR - Right')
% 

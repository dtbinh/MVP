function [perf,rotor] = predictRPMVECT(flow, fgeom, perf, file, angle_list, j, rotor, q_total)    
% This function uses flow conditions, vehicle geometry, vehicle forces and
% rotor data to determine the mutual interference velocity of each rotor (WIM)
% then using the velocity data to change the rotor inflow conditions to 
% determine a more accurate RPM required for each rotor to maintain a given thrust.

%% Assign individual rotor data - needs to be 4 rotors
     T               = perf.Treq;
     a               = perf.vehiclePITCH;
     V               = flow.V;
     rpm             = perf.rpm;
%     Px              = perf.Px;

% Organize results in matrix form - modify for variable rotors
    rotorTHRUST     = perf.rotorTHRUST;                 %[N] thrust required for force trim
    rotorAngINFLOW  = perf.rotorAngINFLOW;                 %[deg] first iteration same at pitch
    rotorVelINFLOW  = perf.rotorVelINFLOW;                 %[m/s] first interation same as freestream
    rotorRPM        = perf.rotorRPM;         %[rev/min] first iteration rpm is from uniform Treq, pitch, freestream lookup
    rotorPx         = perf.rotorPx;             %[N] lookup with rpm
    rotorPy         = perf.rotorPy;
    rotorMy         = perf.rotorMx;
    rotorRPM_new    = perf.rotorPy;
% Initialize for convergence
    counttemp=0;    % start counter to record number of error iterations until convergence is reached

    error1=10000;   % initialize error value to be above convergence value and 
    error2=10000;
    error3=10000;
    error4=10000;

   
    
    
%% WAKE INTERFERENCE MODEL
    while (abs(error2(end))+abs(error1(end))+abs(error3(end))+abs(error4(end))) > 0.000001
        counttemp = counttemp+1 

     [vi_int,vi_self,X,wi]         = WIM_VECT(flow,fgeom,rotorTHRUST,a,V,rotorRPM);        
        for roi=1:fgeom.norotors % rotor of interest
            %input variable arrays to allow for wake interactions of rotors
            %with different rotational speeds

            rotor(j,roi).vix                = vi_int(:,1,roi); %add i~=j to not include self induced part in
            rotor(j,roi).viy                = vi_int(:,2,roi);
            rotor(j,roi).viz                = vi_int(:,3,roi);   % reverse sign to keep consistent with sign convention z-down
            rotor(j,roi).vi_self            = vi_self(:,roi);
            rotor(j,roi).X                  = radtodeg(X(roi));
            rotor(j,roi).wi                 = wi(:,:,roi);
            % calculate self induced and interference power
%             rotor(j,roi).Pind_int           = 1.15*perf.Treq*rotor(j,roi).viz;
%             rotor(j,roi).Pind_self          = 1.15*perf.Treq*rotor(j,roi).vi_self;
            
        %% --------------UPDATE ROTOR9 RPM BASED ON VIZ (INDUCED VELOCITY BY OTHER ROTORS)-------------%
        %input rotor of interest variable into updateRPM function to output
        %single rotor data with induced velocity effects included in
        %results
        
            [rotorAngINFLOW(roi), rotorVelINFLOW(roi), rotorRPM_new(roi), rotorPx(roi), rotorPy(roi), rotorMy(roi), rotorCP(roi), rotorCM(roi), rotorJint(roi)] = updateRotorRPM_v3 (vi_int(:,3,roi), q_total, rotorTHRUST(roi), V, a, flow, file, angle_list);
                
        end
        
        
        
        % error results used in while loop for convergence of rpm.
        % While loop checks for rpm difference between the start
        % and end of loop set and exits loop once the sum of the 
        % rpm differences is less than 0.000001 (or any set value)
            error1(counttemp)                   = rotorRPM_new(1)-rotorRPM(1);
            error2(counttemp)                   = rotorRPM_new(2)-rotorRPM(2);
            error3(counttemp)                   = rotorRPM_new(3)-rotorRPM(3);
            error4(counttemp)                   = rotorRPM_new(4)-rotorRPM(4);

        % rpm reassign to final variable/variable used in next loop
            rotorRPM(1)                         = rotorRPM_new(1);
            rotorRPM(2)                         = rotorRPM_new(2);
            rotorRPM(3)                         = rotorRPM_new(3);
            rotorRPM(4)                         = rotorRPM_new(4);
        
    end
 
    %% assign new variables to performance structure
    % orginal inflow, rpm and Px will be trim conditions with no
    % interference
    
            perf.rotorAngINFLOW                 = rotorAngINFLOW;       
            perf.rotorVelINFLOW                 = rotorVelINFLOW;
            perf.rotorRPM                       = rotorRPM;             
            perf.rotorPx                        = rotorPx;     
            perf.rotorPy                        = rotorPy;
            perf.rotorMy                        = rotorMy;
            perf.rotorTHRUST                    = rotorTHRUST;
            perf.rotorCP                        = rotorCP;
            perf.rotorCM                        = rotorCM;
            perf.rotorJint                      = rotorJint;
    
    
    end
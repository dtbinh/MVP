function [R_complete] = fcnROTATE(phi,theta,psi)
% uses common angle convention to describe roll, pitch and yaw angles
% phi - roll angle about x axis
% theta - pitch angle about y axis
% psi - yaw angle about z axis
    I_3 = [1 0 0; 0 1 0; 0 0 1];    %Identity matrix

    R_roll = (1-cosd(phi))*[1 0 0]'*[1 0 0] + ...
            cosd(phi)*I_3 + sind(phi)*[0 0 0; 0 0 -1; 0 1 0];

    R_pitch = (1-cosd(theta))*[0 1 0]'*[0 1 0] + ...
            cosd(theta)*I_3 + sind(theta)*[0 0 1; 0 0 0; -1 0 0];

    R_yaw = (1-cosd(psi))*[0 0 1]'*[0 0 1] + ...
            cosd(psi)*I_3 + sind(psi)*[0 -1 0; 1 0 0; 0 0 0];

R_complete = R_yaw*R_pitch*R_roll;

end
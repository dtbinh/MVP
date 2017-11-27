
% %% Induced velocities for Julia
% % Calculated from VAPTOR
% clear, clc

load('JuliaFFSept28.mat')

%average the normal induced velocity by number of azimuth stations
avg = mean(induced_vel1(:,3,:),3);



B = reshape(avg,[25,25]);

ynew = -0.6:0.05:0.6;

for i = 1:5:25

figure(i+7)    
plot(ynew,B(:,i))


end
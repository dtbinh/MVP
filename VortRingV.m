function [wi] = VortRingV(nowakes,noseg,noblades,zoff_1,skewRAD,R,circulation,pointInterest,po)
% Vectorize version of the original VortRing


vecANG1 = (0:2*pi/noseg:(2*pi-2*pi/noseg))'; % Angles for each segment first node
vecANG2 = (2*pi/noseg:2*pi/noseg:2*pi)'; % Angles for each segment second node

% Calculate a vector of z locations. Note: there are (number of wake +1)
% vortex rings as the vortex ring in the rotor is no considered a wake
vecZOFF= (0:zoff_1:(zoff_1*nowakes))'; 

% Calculate x location of each vortex ring in local reference frame from
% skew angle
tempX = vecZOFF*tan(skewRAD);

% Calcualte ring centers. format (each ring,xzy,each rotor) such that the
% size is (nowakes + 1, 3, number of rotors)
tempPO = repmat(permute(po,[3 2 1]),size(vecZOFF,1),1,1);
ringCENTER = [tempPO(:,1,:)+tempX tempPO(:,2,:) tempPO(:,3,:)-vecZOFF];

% Create the segments (matSEG)
% This matrix is in order by segment than wake
tempX = reshape(permute(repmat(ringCENTER(:,1,:),1,noseg),[2 1 3]),(nowakes+1)*noseg,1,size(circulation,2)) + repmat(permute(R,[1 3 2]).*cos(vecANG1),nowakes+1,1);
tempY = repmat(ringCENTER(:,2,:),noseg,1) + repmat(permute(R,[1 3 2]).*sin(vecANG1),nowakes+1,1);
tempZ = reshape(permute(repmat(ringCENTER(:,3,:),1,noseg),[2 1 3]),(nowakes+1)*noseg,1,size(circulation,2));
matSEG1 = [tempX, tempY, tempZ];

tempX = reshape(permute(repmat(ringCENTER(:,1,:),1,noseg),[2 1 3]),(nowakes+1)*noseg,1,size(circulation,2)) + repmat(permute(R,[1 3 2]).*cos(vecANG2),nowakes+1,1);
tempY = repmat(ringCENTER(:,2,:),noseg,1) + repmat(permute(R,[1 3 2]).*sin(vecANG2),nowakes+1,1);
tempZ = reshape(permute(repmat(ringCENTER(:,3,:),1,noseg),[2 1 3]),(nowakes+1)*noseg,1,size(circulation,2));
matSEG2 = [tempX, tempY, tempZ];

% Calculate induced vecloties at POI
[wi] = VortSegmentV(pointInterest,matSEG1,matSEG2,circulation,noseg,nowakes,noblades);


% TESTING PLOT - ring centers 
% figure(21)
% hold on
% for i = 1:size(ringCENTER,3)
%     scatter3(ringCENTER(:,1,i),ringCENTER(:,2,i),ringCENTER(:,3,i))
% %     scatter3(matSEG(1:noseg,1,i),matSEG(1:noseg,2,i),matSEG(1:noseg,3,i))
%     scatter3(matSEG1(:,1,i),matSEG1(:,2,i),matSEG1(:,3,i))
%     scatter3(tempX(:,1,i),tempY(:,1,i),tempZ(:,1,i))
% end
% plot3(-0.112,0.3,-0.0315, 'xr')


end


function [wi] = VortSegmentV(pointInterest,matSEG1,matSEG2,circulation,noseg,nowakes, noblades)
% Vectorized version of the original VortSegment fcn

% Repeat matrix for every point of interest
tempSEG1 = repmat(matSEG1,size(pointInterest,1),1);
tempSEG2 = repmat(matSEG2,size(pointInterest,1),1);

% Repeat each point of interest for every wake and each segment
temp = repmat(permute(pointInterest,[3 2 1]),noseg*(nowakes+1),1);
tempPOI = temp(:,:,1);
for i = 1:(size(pointInterest,1)-1)
    tempPOI = cat(1,tempPOI,temp(:,:,i+1));
end
tempPOI = repmat(tempPOI,1,1,size(matSEG1,3));

% Create vector from first segment point to POI
r1 = tempPOI - tempSEG1;
r2 = tempPOI - tempSEG2;

% Vector from second point to first point of each vortex segment
r0 = r1-r2; % DOUBLE CHECK THIS - should this be tempSEG1 - tempSEGE2?

norm_r0 = sqrt(r0(:,1,:).^2+r0(:,2,:).^2+r0(:,3,:).^2);
norm_r1 = sqrt(r1(:,1,:).^2+r1(:,2,:).^2+r1(:,3,:).^2);
norm_r2 = sqrt(r2(:,1,:).^2+r2(:,2,:).^2+r2(:,3,:).^2);

% Vector normal to rotor plane
product = cross(r1,r2,2);
norm_product = sqrt(product(:,1,:).^2+product(:,2,:).^2+product(:,3,:).^2);

d = norm_product./norm_r0;
% % %
% A is angle between r1 and line segment
    cosA = dot(r0,r1,2)./(norm_r0.*norm_r1); 
% B is angle between r2 and line segment
    cosB = dot(r0,r2,2)./(norm_r0.*norm_r2);
    
% velocity induced in P by vortex segment
qtheta = -permute(circulation,[1 3 2])./(4*pi.*d).*(cosA-cosB);

tempwi = product.*(repmat(qtheta,1,3,1)) ./ (repmat(norm_product,1,3,1));

% for i = 1:size(pointInterest,1)
%     %multiplies first ring by number of blades to account for full
%     %circulation of a ring in each of the rotor planes
%     tempwi(((i-1)*noseg*(nowakes+1)+1):((i-1)*noseg*(nowakes+1)+1)+noseg-1,:,:) ...
%         = tempwi(((i-1)*noseg*(nowakes+1)+1):((i-1)*noseg*(nowakes+1)+1)+noseg-1,:,:).*noblades;
% end

d2 = d.*d;
idx = (d2>=10^(-10));

tempwi = tempwi.*[idx idx idx];

wi = zeros(size(pointInterest,1),3,size(matSEG1,3));

for i = 1:size(pointInterest,1)
    wi(i,:,:)= sum(tempwi(((i-1)*noseg*(nowakes+1)+1):i*noseg*(nowakes+1),:,:),1);
end

end
flowLOCAL               = 10;
angALPHA                = 0;
angBETA                 = 0;
geomBODYradius          = 0.08;
geomBODYcentre = 0.0925;
rb = geomBODYradius;
h = geomBODYcentre;
pitchVEHICLEdeg         = 12.3;
positionROTOR           = [...-rb, 0, -h; 
                            0, 0, -rb-h; ...bottom
                            ...rb, 0, -h; 
                            0, 0, rb-h; ...top
                            0, -rb, -h; ...right
                            0, rb, -h]; ...left % point of interest

% positionROTOR = [-0.4 0 -0.0315; 
%                 0 -0.4 -0.0315; 
%                 0.4 0 -0.0315; 
%                 0 0.4 -0.0315]; 
                        
                        
flowGLOBAL              = flowLOCAL*[cosd(angALPHA) sind(angBETA) sind(angALPHA)]; %DEGREES

%height from origin to centre of body


[matROTATEVEHICLE]      = fcnROTATE(0,pitchVEHICLEdeg,0); %DEGREES
rotpositionROTOR        = positionROTOR*matROTATEVEHICLE;
rotpositionBODY         = [0,0,-geomBODYcentre]*matROTATEVEHICLE;

%r vectors
rvecROTOR               = rotpositionROTOR - repmat(rotpositionBODY,[size(rotpositionROTOR,1),1]);

magROTOR                = sqrt(sum(abs(rvecROTOR).^2,2));
magflowGLOBAL           = norm(flowGLOBAL);

cosTHETA        = (dot(rvecROTOR,repmat(flowGLOBAL,[size(rvecROTOR,1),1]),2)'./(abs(magROTOR)'.*repmat(magflowGLOBAL,size(magROTOR,1),1)'))'; %Udotr/abs(Ur)
THETA           = acos(cosTHETA); %RADIANS
                                %RADIANS
vecQR           = flowLOCAL.*cos(THETA).*(1-geomBODYradius^3./magROTOR.^3); % [m/s] flowfield 4x3
vecQTHS         = -flowLOCAL.*sin(THETA).*(1+geomBODYradius.^3./(2.*magROTOR.^3)); % [m/s] flowfield 4x3


% setup tangential components of global coordinates 
k_vec       = -1*cross(repmat(flowGLOBAL,[size(rvecROTOR,1),1]),rvecROTOR,2);  
temp_vec    = cross(k_vec,rvecROTOR,2);
temp_norm   = sqrt(sum(abs(temp_vec).^2,2));
t_vec       = -1*temp_vec./temp_norm;
mag_t_vec   = sqrt(sum(abs(t_vec).^2,2));


q_r_global      = (rvecROTOR./magROTOR).*(vecQR); % qr component of flowfield in global cartesian coodinates 
q_ths_global    = (t_vec./mag_t_vec).*(vecQTHS); % qtheta component of flowfield in global cartesian coodinates

q_total         = q_r_global(:,:)+q_ths_global(:,:);
mag_q_total     = sqrt(sum(abs(q_total).^2,2));

% calculate interference velocity and add int. velocity components to
% rpmupd
q_int           = (q_total-repmat(flowGLOBAL,[size(rvecROTOR,1),1]))';

% save answer in 1x3x4 
q_int_arrange   = reshape(q_int, [1 3 4]);

mag_q_int       = sqrt(sum(abs(q_int).^2,2));



    figure(1)
    clf(1)
    hold on
    axis equal
    scatter3(rotpositionROTOR(:,1),rotpositionROTOR(:,2),rotpositionROTOR(:,3),'ro');
    [U,V,W] = meshgrid(q_total(:,1),q_total(:,2),q_total(:,3));
    plot3(rotpositionBODY (:,1),rotpositionBODY (:,2),rotpositionBODY (:,3),'bo');
     quiver3(rotpositionROTOR(:,1),rotpositionROTOR(:,2),rotpositionROTOR(:,3),q_total(:,1),q_total(:,2),q_total(:,3),'b')
%      quiver3(rotpositionROTOR(:,1),roRpositionROTOR(:,2),rotpositionROTOR(:,3),q_int(1,:),q_int(2,:),q_int(3,:),'k')
%     quiver3(rotpositionROTOR(:,1),rotpositionROTOR(:,2),rotpositionROTOR(:,3),repflowGLOBAL(:,1),repflowGLOBAL(:,2),repflowGLOBAL(:,3),'r')
hold off


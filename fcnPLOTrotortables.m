% Plot Rotor Tables for CT, CPx, CPy, CMx, CMy, CQ vs Jinf
%% Jinf
% Jinf n90
Jinf_n90_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 2000);
Jinf_n90_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 3000);
Jinf_n90_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 4000);
% Jinf_n90_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 5000);

Jinf_n90_2000(2:2:end,:)=[];
Jinf_n90_3000(2:2:end,:)=[];
Jinf_n90_4000(2:2:end,:)=[];
% Jinf_n90_5000(2:2:end,:)=[];

% Jinf n30
Jinf_n30_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 2000);
Jinf_n30_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 3000);
Jinf_n30_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 4000);
% Jinf_n30_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 5000);

Jinf_n30_2000(2:2:end,:)=[];
Jinf_n30_3000(2:2:end,:)=[];
Jinf_n30_4000(2:2:end,:)=[];
% Jinf_n30_5000(2:2:end,:)=[];

% Jinf n5
Jinf_n15_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 2000);
Jinf_n15_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 3000);
Jinf_n15_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 4000);
% Jinf_n15_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 5000);

Jinf_n15_2000(2:2:end,:)=[];
Jinf_n15_3000(2:2:end,:)=[];
Jinf_n15_4000(2:2:end,:)=[];
% Jinf_n15_5000(2:2:end,:)=[];


% Jinf n5
Jinf_n5_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 2000);
Jinf_n5_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 3000);
Jinf_n5_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 4000);
% Jinf_n5_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 5000);

Jinf_n5_2000(2:2:end,:)=[];
Jinf_n5_3000(2:2:end,:)=[];
Jinf_n5_4000(2:2:end,:)=[];
% Jinf_n5_5000(2:2:end,:)=[];


% Jinf 0
Jinf_0_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 2000);
Jinf_0_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 3000);
Jinf_0_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 4000);
% Jinf_0_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 5000);

Jinf_0_2000(2:2:end,:)=[];
Jinf_0_3000(2:2:end,:)=[];
Jinf_0_4000(2:2:end,:)=[];
% Jinf_0_5000(2:2:end,:)=[];


% Jinf 10
Jinf_10_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 2000);
Jinf_10_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 3000);
Jinf_10_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 4000);
% Jinf_10_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 5000);

Jinf_10_2000(2:2:end,:)=[];
Jinf_10_3000(2:2:end,:)=[];
Jinf_10_4000(2:2:end,:)=[];
% Jinf_10_5000(2:2:end,:)=[];


% Jinf 20
Jinf_20_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 2000);
Jinf_20_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 3000);
Jinf_20_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 4000);
% Jinf_20_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 5000);

Jinf_20_2000(2:2:end,:)=[];
Jinf_20_3000(2:2:end,:)=[];
Jinf_20_4000(2:2:end,:)=[];
% Jinf_20_5000(2:2:end,:)=[];


% Jinf 30
Jinf_30_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 2000);
Jinf_30_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 3000);
Jinf_30_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 4000);
% Jinf_30_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 5000);

Jinf_30_2000(2:2:end,:)=[];
Jinf_30_3000(2:2:end,:)=[];
Jinf_30_4000(2:2:end,:)=[];
% Jinf_30_5000(2:2:end,:)=[];

% Jinf 40
Jinf_40_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 2000);
Jinf_40_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 3000);
Jinf_40_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 4000);
% Jinf_40_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 5000);

Jinf_40_2000(2:2:end,:)=[];
Jinf_40_3000(2:2:end,:)=[];
Jinf_40_4000(2:2:end,:)=[];
% Jinf_40_5000(2:2:end,:)=[];

% 
% % Jinf 45
% Jinf_45_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 2000);
% Jinf_45_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 3000);
% Jinf_45_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 4000);
% % Jinf_45_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 5000);
% 
% Jinf_45_2000(2:2:end,:)=[];
% Jinf_45_3000(2:2:end,:)=[];
% Jinf_45_4000(2:2:end,:)=[];
% % Jinf_45_5000(2:2:end,:)=[];


% Jinf 50
Jinf_50_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 2000);
Jinf_50_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 3000);
Jinf_50_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 4000);
% Jinf_50_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 5000);

Jinf_50_2000(2:2:end,:)=[];
Jinf_50_3000(2:2:end,:)=[];
Jinf_50_4000(2:2:end,:)=[];
% Jinf_50_5000(2:2:end,:)=[];

% Jinf 90
Jinf_90_2000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 2000);
Jinf_90_3000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 3000);
Jinf_90_4000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 4000);
% Jinf_90_5000 = tabLOOKUP.Jinf(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 5000);

Jinf_90_2000(2:2:end,:)=[];
Jinf_90_3000(2:2:end,:)=[];
Jinf_90_4000(2:2:end,:)=[];
% Jinf_90_5000(2:2:end,:)=[];

%% CT
% CT n90
CT_n90_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 2000);
CT_n90_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 3000);
CT_n90_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 4000);
% CT_n90_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 5000);

CT_n90_2000(2:2:end,:)=[];
CT_n90_3000(2:2:end,:)=[];
CT_n90_4000(2:2:end,:)=[];
% CT_n90_5000(2:2:end,:)=[];


% CT n30
CT_n30_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 2000);
CT_n30_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 3000);
CT_n30_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 4000);
% CT_n30_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 5000);

CT_n30_2000(2:2:end,:)=[];
CT_n30_3000(2:2:end,:)=[];
CT_n30_4000(2:2:end,:)=[];
% CT_n30_5000(2:2:end,:)=[];


% CT n5
CT_n15_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 2000);
CT_n15_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 3000);
CT_n15_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 4000);
% CT_n15_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 5000);

CT_n15_2000(2:2:end,:)=[];
CT_n15_3000(2:2:end,:)=[];
CT_n15_4000(2:2:end,:)=[];
% CT_n15_5000(2:2:end,:)=[];


% CT n5
CT_n5_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 2000);
CT_n5_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 3000);
CT_n5_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 4000);
% CT_n5_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 5000);

CT_n5_2000(2:2:end,:)=[];
CT_n5_3000(2:2:end,:)=[];
CT_n5_4000(2:2:end,:)=[];
% CT_n5_5000(2:2:end,:)=[];


% CT 0
CT_0_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 2000);
CT_0_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 3000);
CT_0_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 4000);
% CT_0_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 5000);

CT_0_2000(2:2:end,:)=[];
CT_0_3000(2:2:end,:)=[];
CT_0_4000(2:2:end,:)=[];
% CT_0_5000(2:2:end,:)=[];

% CT 10
CT_10_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 2000);
CT_10_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 3000);
CT_10_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 4000);
% CT_10_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 5000);

CT_10_2000(2:2:end,:)=[];
CT_10_3000(2:2:end,:)=[];
CT_10_4000(2:2:end,:)=[];
% CT_10_5000(2:2:end,:)=[];

% CT 20
CT_20_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 2000);
CT_20_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 3000);
CT_20_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 4000);
% CT_20_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 5000);

CT_20_2000(2:2:end,:)=[];
CT_20_3000(2:2:end,:)=[];
CT_20_4000(2:2:end,:)=[];
% CT_20_5000(2:2:end,:)=[];


% CT 30
CT_30_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 2000);
CT_30_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 3000);
CT_30_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 4000);
% CT_30_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 5000);

CT_30_2000(2:2:end,:)=[];
CT_30_3000(2:2:end,:)=[];
CT_30_4000(2:2:end,:)=[];
% CT_30_5000(2:2:end,:)=[];


% CT 40
CT_40_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 2000);
CT_40_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 3000);
CT_40_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 4000);
% CT_40_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 5000);

CT_40_2000(2:2:end,:)=[];
CT_40_3000(2:2:end,:)=[];
CT_40_4000(2:2:end,:)=[];
% CT_40_5000(2:2:end,:)=[];


% CT 45
% CT_45_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 2000);
% CT_45_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 3000);
% CT_45_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 4000);
% % CT_45_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 5000);
% 
% CT_45_2000(2:2:end,:)=[];
% CT_45_3000(2:2:end,:)=[];
% CT_45_4000(2:2:end,:)=[];
% % CT_45_5000(2:2:end,:)=[];


% CT 50
CT_50_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 2000);
CT_50_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 3000);
CT_50_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 4000);
% CT_50_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 5000);

CT_50_2000(2:2:end,:)=[];
CT_50_3000(2:2:end,:)=[];
CT_50_4000(2:2:end,:)=[];
% CT_50_5000(2:2:end,:)=[];

% CT 90
CT_90_2000 = tabLOOKUP.CT(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 2000);
CT_90_3000 = tabLOOKUP.CT(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 3000);
CT_90_4000 = tabLOOKUP.CT(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 4000);
% CT_90_5000 = tabLOOKUP.CT(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 5000);

CT_90_2000(2:2:end,:)=[];
CT_90_3000(2:2:end,:)=[];
CT_90_4000(2:2:end,:)=[];
% CT_90_5000(2:2:end,:)=[];
%% CPx
R = 0.2286; % radius of 18" T-Motor prop
A = 2*pi()*R;
Omega2 = 2000*2*pi()/60;
Omega3 = 3000*2*pi()/60;
Omega4 = 4000*2*pi()/60;
Omega5 = 5000*2*pi()/60;
C2 = A*(Omega2*R)^2;
C3 = A*(Omega3*R)^2;
C4 = A*(Omega4*R)^2;
C5 = A*(Omega5*R)^2;

% CPx n90
CPx_n90_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 2000)./C2;
CPx_n90_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 3000)./C3;
CPx_n90_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 4000)./C4;
% CPx_n90_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 5000)./C5;

CPx_n90_2000(2:2:end,:)=[];
CPx_n90_3000(2:2:end,:)=[];
CPx_n90_4000(2:2:end,:)=[];
% CPx_n90_5000(2:2:end,:)=[];


% Px_rho n30
CPx_n30_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 2000)./C2;
CPx_n30_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 3000)./C3;
CPx_n30_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 4000)./C4;
% CPx_n30_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 5000)./C5;

CPx_n30_2000(2:2:end,:)=[];
CPx_n30_3000(2:2:end,:)=[];
CPx_n30_4000(2:2:end,:)=[];
% CPx_n30_5000(2:2:end,:)=[];


% Px_rho n5
CPx_n15_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 2000)./C2;
CPx_n15_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 3000)./C3;
CPx_n15_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 4000)./C4;
% CPx_n15_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 5000)./C5;

CPx_n15_2000(2:2:end,:)=[];
CPx_n15_3000(2:2:end,:)=[];
CPx_n15_4000(2:2:end,:)=[];
% CPx_n15_5000(2:2:end,:)=[];


% Px_rho n5
CPx_n5_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 2000)./C2;
CPx_n5_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 3000)./C3;
CPx_n5_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 4000)./C4;
% CPx_n5_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 5000)./C5;

CPx_n5_2000(2:2:end,:)=[];
CPx_n5_3000(2:2:end,:)=[];
CPx_n5_4000(2:2:end,:)=[];
% CPx_n5_5000(2:2:end,:)=[];


% CPx 0
CPx_0_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 2000)./C2;
CPx_0_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 3000)./C3;
CPx_0_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 4000)./C4;
% CPx_0_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 5000)./C5;

CPx_0_2000(2:2:end,:)=[];
CPx_0_3000(2:2:end,:)=[];
CPx_0_4000(2:2:end,:)=[];
% CPx_0_5000(2:2:end,:)=[];

% CPx 10
CPx_10_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 2000)./C2;
CPx_10_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 3000)./C3;
CPx_10_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 4000)./C4;
% CPx_10_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 5000)./C5;

CPx_10_2000(2:2:end,:)=[];
CPx_10_3000(2:2:end,:)=[];
CPx_10_4000(2:2:end,:)=[];
% CPx_10_5000(2:2:end,:)=[];

% CPx 20
CPx_20_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 2000)./C2;
CPx_20_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 3000)./C3;
CPx_20_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 4000)./C4;
% CPx_20_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 5000)./C5;

CPx_20_2000(2:2:end,:)=[];
CPx_20_3000(2:2:end,:)=[];
CPx_20_4000(2:2:end,:)=[];
% CPx_20_5000(2:2:end,:)=[];


% CPx 30
CPx_30_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 2000)./C2;
CPx_30_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 3000)./C3;
CPx_30_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 4000)./C4;
% CPx_30_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 5000)./C5;

CPx_30_2000(2:2:end,:)=[];
CPx_30_3000(2:2:end,:)=[];
CPx_30_4000(2:2:end,:)=[];
% CPx_30_5000(2:2:end,:)=[];


% CPx 40
CPx_40_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 2000)./C2;
CPx_40_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 3000)./C3;
CPx_40_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 4000)./C4;
% CPx_40_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 5000)./C5;

CPx_40_2000(2:2:end,:)=[];
CPx_40_3000(2:2:end,:)=[];
CPx_40_4000(2:2:end,:)=[];
% CPx_40_5000(2:2:end,:)=[];


% % CPx 45
% CPx_45_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 2000)./C2;
% CPx_45_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 3000)./C3;
% CPx_45_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 4000)./C4;
% CPx_45_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 5000)./C5;
% 
% CPx_45_2000(2:2:end,:)=[];
% CPx_45_3000(2:2:end,:)=[];
% CPx_45_4000(2:2:end,:)=[];
% CPx_45_5000(2:2:end,:)=[];


% CPx 50
CPx_50_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 2000)./C2;
CPx_50_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 3000)./C3;
CPx_50_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 4000)./C4;
% CPx_50_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 5000)./C5;

CPx_50_2000(2:2:end,:)=[];
CPx_50_3000(2:2:end,:)=[];
CPx_50_4000(2:2:end,:)=[];
% CPx_50_5000(2:2:end,:)=[];

% CPx 90
CPx_90_2000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 2000);
CPx_90_3000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 3000);
CPx_90_4000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 4000);
% CPx_90_5000 = tabLOOKUP.Px_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 5000);

CPx_90_2000(2:2:end,:)=[];
CPx_90_3000(2:2:end,:)=[];
CPx_90_4000(2:2:end,:)=[];
% CPx_90_5000(2:2:end,:)=[];
%% CPy
% CPy n90
CPy_n90_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 2000)./C2;
CPy_n90_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 3000)./C3;
CPy_n90_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 4000)./C4;
% CPy_n90_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 5000)./C5;

CPy_n90_2000(2:2:end,:)=[];
CPy_n90_3000(2:2:end,:)=[];
CPy_n90_4000(2:2:end,:)=[];
% CPy_n90_5000(2:2:end,:)=[];


% Py_rho n30
CPy_n30_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 2000)./C2;
CPy_n30_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 3000)./C3;
CPy_n30_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 4000)./C4;
% CPy_n30_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 5000)./C5;

CPy_n30_2000(2:2:end,:)=[];
CPy_n30_3000(2:2:end,:)=[];
CPy_n30_4000(2:2:end,:)=[];
% CPy_n30_5000(2:2:end,:)=[];


% Py_rho n5
CPy_n15_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 2000)./C2;
CPy_n15_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 3000)./C3;
CPy_n15_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 4000)./C4;
% CPy_n15_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 5000)./C5;

CPy_n15_2000(2:2:end,:)=[];
CPy_n15_3000(2:2:end,:)=[];
CPy_n15_4000(2:2:end,:)=[];
% CPy_n15_5000(2:2:end,:)=[];


% Py_rho n5
CPy_n5_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 2000)./C2;
CPy_n5_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 3000)./C3;
CPy_n5_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 4000)./C4;
% CPy_n5_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 5000)./C5;

CPy_n5_2000(2:2:end,:)=[];
CPy_n5_3000(2:2:end,:)=[];
CPy_n5_4000(2:2:end,:)=[];
% CPy_n5_5000(2:2:end,:)=[];


% CPy 0
CPy_0_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 2000)./C2;
CPy_0_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 3000)./C3;
CPy_0_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 4000)./C4;
% CPy_0_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 5000)./C5;

CPy_0_2000(2:2:end,:)=[];
CPy_0_3000(2:2:end,:)=[];
CPy_0_4000(2:2:end,:)=[];
% CPy_0_5000(2:2:end,:)=[];

% CPy 10
CPy_10_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 2000)./C2;
CPy_10_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 3000)./C3;
CPy_10_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 4000)./C4;
% CPy_10_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 5000)./C5;

CPy_10_2000(2:2:end,:)=[];
CPy_10_3000(2:2:end,:)=[];
CPy_10_4000(2:2:end,:)=[];
% CPy_10_5000(2:2:end,:)=[];

% CPy 20
CPy_20_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 2000)./C2;
CPy_20_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 3000)./C3;
CPy_20_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 4000)./C4;
% CPy_20_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 5000)./C5;

CPy_20_2000(2:2:end,:)=[];
CPy_20_3000(2:2:end,:)=[];
CPy_20_4000(2:2:end,:)=[];
% CPy_20_5000(2:2:end,:)=[];


% CPy 30
CPy_30_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 2000)./C2;
CPy_30_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 3000)./C3;
CPy_30_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 4000)./C4;
% CPy_30_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 5000)./C5;

CPy_30_2000(2:2:end,:)=[];
CPy_30_3000(2:2:end,:)=[];
CPy_30_4000(2:2:end,:)=[];
% CPy_30_5000(2:2:end,:)=[];


% CPy 40
CPy_40_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 2000)./C2;
CPy_40_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 3000)./C3;
CPy_40_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 4000)./C4;
% CPy_40_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 5000)./C5;

CPy_40_2000(2:2:end,:)=[];
CPy_40_3000(2:2:end,:)=[];
CPy_40_4000(2:2:end,:)=[];
% CPy_40_5000(2:2:end,:)=[];

% 
% % CPy 45
% CPy_45_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 2000)./C2;
% CPy_45_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 3000)./C3;
% CPy_45_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 4000)./C4;
% % CPy_45_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 5000)./C5;
% 
% CPy_45_2000(2:2:end,:)=[];
% CPy_45_3000(2:2:end,:)=[];
% CPy_45_4000(2:2:end,:)=[];
% % CPy_45_5000(2:2:end,:)=[];


% CPy 50
CPy_50_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 2000)./C2;
CPy_50_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 3000)./C3;
CPy_50_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 4000)./C4;
% CPy_50_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 5000)./C5;

CPy_50_2000(2:2:end,:)=[];
CPy_50_3000(2:2:end,:)=[];
CPy_50_4000(2:2:end,:)=[];
% CPy_50_5000(2:2:end,:)=[];

% CPy 90
CPy_90_2000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 2000);
CPy_90_3000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 3000);
CPy_90_4000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 4000);
% CPy_90_5000 = tabLOOKUP.Py_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 5000);

CPy_90_2000(2:2:end,:)=[];
CPy_90_3000(2:2:end,:)=[];
CPy_90_4000(2:2:end,:)=[];
% CPy_90_5000(2:2:end,:)=[];
%% CMx
% CMx n90
CMx_n90_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 2000)./C2;
CMx_n90_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 3000)./C3;
CMx_n90_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 4000)./C4;
% CMx_n90_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 5000)./C5;

CMx_n90_2000(2:2:end,:)=[];
CMx_n90_3000(2:2:end,:)=[];
CMx_n90_4000(2:2:end,:)=[];
% CMx_n90_5000(2:2:end,:)=[];


% Mx_rho n30
CMx_n30_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 2000)./C2;
CMx_n30_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 3000)./C3;
CMx_n30_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 4000)./C4;
% CMx_n30_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 5000)./C5;

CMx_n30_2000(2:2:end,:)=[];
CMx_n30_3000(2:2:end,:)=[];
CMx_n30_4000(2:2:end,:)=[];
% CMx_n30_5000(2:2:end,:)=[];


% Mx_rho n5
CMx_n15_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 2000)./C2;
CMx_n15_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 3000)./C3;
CMx_n15_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 4000)./C4;
% CMx_n15_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 5000)./C5;

CMx_n15_2000(2:2:end,:)=[];
CMx_n15_3000(2:2:end,:)=[];
CMx_n15_4000(2:2:end,:)=[];
% CMx_n15_5000(2:2:end,:)=[];


% Mx_rho n5
CMx_n5_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 2000)./C2;
CMx_n5_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 3000)./C3;
CMx_n5_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 4000)./C4;
% CMx_n5_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 5000)./C5;

CMx_n5_2000(2:2:end,:)=[];
CMx_n5_3000(2:2:end,:)=[];
CMx_n5_4000(2:2:end,:)=[];
% CMx_n5_5000(2:2:end,:)=[];


% CMx 0
CMx_0_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 2000)./C2;
CMx_0_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 3000)./C3;
CMx_0_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 4000)./C4;
% CMx_0_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 5000)./C5;

CMx_0_2000(2:2:end,:)=[];
CMx_0_3000(2:2:end,:)=[];
CMx_0_4000(2:2:end,:)=[];
% CMx_0_5000(2:2:end,:)=[];

% CMx 10
CMx_10_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 2000)./C2;
CMx_10_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 3000)./C3;
CMx_10_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 4000)./C4;
% CMx_10_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 5000)./C5;

CMx_10_2000(2:2:end,:)=[];
CMx_10_3000(2:2:end,:)=[];
CMx_10_4000(2:2:end,:)=[];
% CMx_10_5000(2:2:end,:)=[];

% CMx 20
CMx_20_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 2000)./C2;
CMx_20_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 3000)./C3;
CMx_20_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 4000)./C4;
% CMx_20_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 5000)./C5;

CMx_20_2000(2:2:end,:)=[];
CMx_20_3000(2:2:end,:)=[];
CMx_20_4000(2:2:end,:)=[];
% CMx_20_5000(2:2:end,:)=[];


% CMx 30
CMx_30_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 2000)./C2;
CMx_30_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 3000)./C3;
CMx_30_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 4000)./C4;
% CMx_30_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 5000)./C5;

CMx_30_2000(2:2:end,:)=[];
CMx_30_3000(2:2:end,:)=[];
CMx_30_4000(2:2:end,:)=[];
% CMx_30_5000(2:2:end,:)=[];


% CMx 40
CMx_40_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 2000)./C2;
CMx_40_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 3000)./C3;
CMx_40_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 4000)./C4;
% CMx_40_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 5000)./C5;

CMx_40_2000(2:2:end,:)=[];
CMx_40_3000(2:2:end,:)=[];
CMx_40_4000(2:2:end,:)=[];
% CMx_40_5000(2:2:end,:)=[];


% % CMx 45
% CMx_45_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 2000)./C2;
% CMx_45_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 3000)./C3;
% CMx_45_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 4000)./C4;
% % CMx_45_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 5000)./C5;
% 
% CMx_45_2000(2:2:end,:)=[];
% CMx_45_3000(2:2:end,:)=[];
% CMx_45_4000(2:2:end,:)=[];
% % CMx_45_5000(2:2:end,:)=[];


% CMx 50
CMx_50_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 2000)./C2;
CMx_50_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 3000)./C3;
CMx_50_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 4000)./C4;
% CMx_50_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 5000)./C5;

CMx_50_2000(2:2:end,:)=[];
CMx_50_3000(2:2:end,:)=[];
CMx_50_4000(2:2:end,:)=[];
% CMx_50_5000(2:2:end,:)=[];

% CMx 90
CMx_90_2000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 2000);
CMx_90_3000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 3000);
CMx_90_4000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 4000);
% CMx_90_5000 = tabLOOKUP.Mx_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 5000);

CMx_90_2000(2:2:end,:)=[];
CMx_90_3000(2:2:end,:)=[];
CMx_90_4000(2:2:end,:)=[];
% CMx_90_5000(2:2:end,:)=[];
%% CMy
% CMy n90
CMy_n90_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 2000)./C2;
CMy_n90_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 3000)./C3;
CMy_n90_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 4000)./C4;
% CMy_n90_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 5000)./C5;

CMy_n90_2000(2:2:end,:)=[];
CMy_n90_3000(2:2:end,:)=[];
CMy_n90_4000(2:2:end,:)=[];
% CMy_n90_5000(2:2:end,:)=[];


% My_rho n30
CMy_n30_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 2000)./C2;
CMy_n30_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 3000)./C3;
CMy_n30_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 4000)./C4;
% CMy_n30_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 5000)./C5;

CMy_n30_2000(2:2:end,:)=[];
CMy_n30_3000(2:2:end,:)=[];
CMy_n30_4000(2:2:end,:)=[];
% CMy_n30_5000(2:2:end,:)=[];


% My_rho n5
CMy_n15_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 2000)./C2;
CMy_n15_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 3000)./C3;
CMy_n15_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 4000)./C4;
% CMy_n15_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 5000)./C5;

CMy_n15_2000(2:2:end,:)=[];
CMy_n15_3000(2:2:end,:)=[];
CMy_n15_4000(2:2:end,:)=[];
% CMy_n15_5000(2:2:end,:)=[];


% My_rho n5
CMy_n5_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 2000)./C2;
CMy_n5_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 3000)./C3;
CMy_n5_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 4000)./C4;
% CMy_n5_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 5000)./C5;

CMy_n5_2000(2:2:end,:)=[];
CMy_n5_3000(2:2:end,:)=[];
CMy_n5_4000(2:2:end,:)=[];
% CMy_n5_5000(2:2:end,:)=[];


% CMy 0
CMy_0_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 2000)./C2;
CMy_0_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 3000)./C3;
CMy_0_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 4000)./C4;
% CMy_0_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 5000)./C5;

CMy_0_2000(2:2:end,:)=[];
CMy_0_3000(2:2:end,:)=[];
CMy_0_4000(2:2:end,:)=[];
% CMy_0_5000(2:2:end,:)=[];
% 
% CMy 10
CMy_10_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 2000)./C2;
CMy_10_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 3000)./C3;
CMy_10_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 4000)./C4;
% CMy_10_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 5000)./C5;

CMy_10_2000(2:2:end,:)=[];
CMy_10_3000(2:2:end,:)=[];
CMy_10_4000(2:2:end,:)=[];
% CMy_10_5000(2:2:end,:)=[];

% CMy 20
CMy_20_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 2000)./C2;
CMy_20_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 3000)./C3;
CMy_20_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 4000)./C4;
% CMy_20_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 5000)./C5;

CMy_20_2000(2:2:end,:)=[];
CMy_20_3000(2:2:end,:)=[];
CMy_20_4000(2:2:end,:)=[];
% CMy_20_5000(2:2:end,:)=[];


% CMy 30
CMy_30_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 2000)./C2;
CMy_30_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 3000)./C3;
CMy_30_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 4000)./C4;
% CMy_30_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 5000)./C5;

CMy_30_2000(2:2:end,:)=[];
CMy_30_3000(2:2:end,:)=[];
CMy_30_4000(2:2:end,:)=[];
% CMy_30_5000(2:2:end,:)=[];


% CMy 40
CMy_40_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 2000)./C2;
CMy_40_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 3000)./C3;
CMy_40_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 4000)./C4;
% CMy_40_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 5000)./C5;

CMy_40_2000(2:2:end,:)=[];
CMy_40_3000(2:2:end,:)=[];
CMy_40_4000(2:2:end,:)=[];
% CMy_40_5000(2:2:end,:)=[];

% 
% % CMy 45
% CMy_45_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 2000)./C2;
% CMy_45_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 3000)./C3;
% CMy_45_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 4000)./C4;
% % CMy_45_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 5000)./C5;
% 
% CMy_45_2000(2:2:end,:)=[];
% CMy_45_3000(2:2:end,:)=[];
% CMy_45_4000(2:2:end,:)=[];
% % CMy_45_5000(2:2:end,:)=[];


% CMy 50
CMy_50_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 2000)./C2;
CMy_50_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 3000)./C3;
CMy_50_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 4000)./C4;
% CMy_50_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 5000)./C5;

CMy_50_2000(2:2:end,:)=[];
CMy_50_3000(2:2:end,:)=[];
CMy_50_4000(2:2:end,:)=[];
% CMy_50_5000(2:2:end,:)=[];

% CMy 90
CMy_90_2000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 2000);
CMy_90_3000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 3000);
CMy_90_4000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 4000);
% CMy_90_5000 = tabLOOKUP.My_rho(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 5000);

CMy_90_2000(2:2:end,:)=[];
CMy_90_3000(2:2:end,:)=[];
CMy_90_4000(2:2:end,:)=[];
% CMy_90_5000(2:2:end,:)=[];
%% CQ
% CQ n90
CQ_n90_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 2000)./C2;
CQ_n90_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 3000)./C3;
CQ_n90_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 4000)./C4;
% CQ_n90_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == -90 & tabLOOKUP.RPM == 5000)./C5;

CQ_n90_2000(2:2:end,:)=[];
CQ_n90_3000(2:2:end,:)=[];
CQ_n90_4000(2:2:end,:)=[];
% CQ_n90_5000(2:2:end,:)=[];


% Q n30
CQ_n30_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 2000)./C2;
CQ_n30_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 3000)./C3;
CQ_n30_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 4000)./C4;
% CQ_n30_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == -30 & tabLOOKUP.RPM == 5000)./C5;

CQ_n30_2000(2:2:end,:)=[];
CQ_n30_3000(2:2:end,:)=[];
CQ_n30_4000(2:2:end,:)=[];
% CQ_n30_5000(2:2:end,:)=[];


% Q n5
CQ_n15_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 2000)./C2;
CQ_n15_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 3000)./C3;
CQ_n15_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 4000)./C4;
% CQ_n15_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == -15 & tabLOOKUP.RPM == 5000)./C5;

CQ_n15_2000(2:2:end,:)=[];
CQ_n15_3000(2:2:end,:)=[];
CQ_n15_4000(2:2:end,:)=[];
% CQ_n15_5000(2:2:end,:)=[];


% Q n5
CQ_n5_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 2000)./C2;
CQ_n5_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 3000)./C3;
CQ_n5_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 4000)./C4;
% CQ_n5_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == -5 & tabLOOKUP.RPM == 5000)./C5;

CQ_n5_2000(2:2:end,:)=[];
CQ_n5_3000(2:2:end,:)=[];
CQ_n5_4000(2:2:end,:)=[];
% CQ_n5_5000(2:2:end,:)=[];


% CQ 0
CQ_0_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 2000)./C2;
CQ_0_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 3000)./C3;
CQ_0_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 4000)./C4;
% CQ_0_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == 0 & tabLOOKUP.RPM == 5000)./C5;

CQ_0_2000(2:2:end,:)=[];
CQ_0_3000(2:2:end,:)=[];
CQ_0_4000(2:2:end,:)=[];
% CQ_0_5000(2:2:end,:)=[];

% CQ 10
CQ_10_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 2000)./C2;
CQ_10_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 3000)./C3;
CQ_10_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 4000)./C4;
% CQ_10_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == 10 & tabLOOKUP.RPM == 5000)./C5;

CQ_10_2000(2:2:end,:)=[];
CQ_10_3000(2:2:end,:)=[];
CQ_10_4000(2:2:end,:)=[];
% CQ_10_5000(2:2:end,:)=[];

% CQ 20
CQ_20_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 2000)./C2;
CQ_20_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 3000)./C3;
CQ_20_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 4000)./C4;
% CQ_20_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == 20 & tabLOOKUP.RPM == 5000)./C5;

CQ_20_2000(2:2:end,:)=[];
CQ_20_3000(2:2:end,:)=[];
CQ_20_4000(2:2:end,:)=[];
% CQ_20_5000(2:2:end,:)=[];


% CQ 30
CQ_30_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 2000)./C2;
CQ_30_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 3000)./C3;
CQ_30_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 4000)./C4;
% CQ_30_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == 30 & tabLOOKUP.RPM == 5000)./C5;

CQ_30_2000(2:2:end,:)=[];
CQ_30_3000(2:2:end,:)=[];
CQ_30_4000(2:2:end,:)=[];
% CQ_30_5000(2:2:end,:)=[];


% CQ 40
CQ_40_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 2000)./C2;
CQ_40_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 3000)./C3;
CQ_40_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 4000)./C4;
% CQ_40_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == 40 & tabLOOKUP.RPM == 5000)./C5;

CQ_40_2000(2:2:end,:)=[];
CQ_40_3000(2:2:end,:)=[];
CQ_40_4000(2:2:end,:)=[];
% CQ_40_5000(2:2:end,:)=[];


% CQ 45
CQ_45_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 2000)./C2;
CQ_45_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 3000)./C3;
CQ_45_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 4000)./C4;
% CQ_45_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == 45 & tabLOOKUP.RPM == 5000)./C5;

CQ_45_2000(2:2:end,:)=[];
CQ_45_3000(2:2:end,:)=[];
CQ_45_4000(2:2:end,:)=[];
% CQ_45_5000(2:2:end,:)=[];


% CQ 50
CQ_50_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 2000)./C2;
CQ_50_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 3000)./C3;
CQ_50_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 4000)./C4;
% CQ_50_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == 50 & tabLOOKUP.RPM == 5000)./C5;

CQ_50_2000(2:2:end,:)=[];
CQ_50_3000(2:2:end,:)=[];
CQ_50_4000(2:2:end,:)=[];
% CQ_50_5000(2:2:end,:)=[];

% CQ 90
CQ_90_2000 = tabLOOKUP.Q(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 2000);
CQ_90_3000 = tabLOOKUP.Q(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 3000);
CQ_90_4000 = tabLOOKUP.Q(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 4000);
% CQ_90_5000 = tabLOOKUP.Q(tabLOOKUP.alpha == 90 & tabLOOKUP.RPM == 5000);

CQ_90_2000(2:2:end,:)=[];
CQ_90_3000(2:2:end,:)=[];
CQ_90_4000(2:2:end,:)=[];
% CQ_90_5000(2:2:end,:)=[];

%% PLOT CT 2000
figure;
plot(Jinf_n90_2000,CT_n90_2000,'-ko',...
    Jinf_n30_2000,CT_n30_2000,'-ks',...
    Jinf_n15_2000,CT_n15_2000,'-k^',...
    Jinf_n5_2000,CT_n5_2000,'-kd',...
    Jinf_0_2000,CT_0_2000,'-k*',...
    Jinf_10_2000,CT_10_2000,'-kd',...
    Jinf_20_2000,CT_20_2000,'-k^',...
    Jinf_30_2000,CT_30_2000,'-ks',...
    Jinf_40_2000,CT_40_2000,'-k.',...
    Jinf_50_2000,CT_50_2000,'-k+')
title('CT 2000')
xlabel('J_{\infty}')
ylabel('CT')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 2000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CPx 2000
figure;
plot(Jinf_n90_2000,CPx_n90_2000,'-ko',...
    Jinf_n30_2000,CPx_n30_2000,'-ks',...
    Jinf_n15_2000,CPx_n15_2000,'-k^',...
    Jinf_n5_2000,CPx_n5_2000,'-kd',...
    Jinf_0_2000,CPx_0_2000,'-k*',...
    Jinf_10_2000,CPx_10_2000,'-kd',...
    Jinf_20_2000,CPx_20_2000,'-k^',...
    Jinf_30_2000,CPx_30_2000,'-ks',...
    Jinf_40_2000,CPx_40_2000,'-k.',...
    Jinf_50_2000,CPx_50_2000,'-k+')
title('CPx 2000')
xlabel('J_{\infty}')
ylabel('CP_{x}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 2000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CPy 2000
figure;
plot(Jinf_n90_2000,CPy_n90_2000,'-ko',...
    Jinf_n30_2000,CPy_n30_2000,'-ks',...
    Jinf_n15_2000,CPy_n15_2000,'-k^',...
    Jinf_n5_2000,CPy_n5_2000,'-kd',...
    Jinf_0_2000,CPy_0_2000,'-k*',...
    Jinf_10_2000,CPy_10_2000,'-kd',...
    Jinf_20_2000,CPy_20_2000,'-k^',...
    Jinf_30_2000,CPy_30_2000,'-ks',...
    Jinf_40_2000,CPy_40_2000,'-k.',...
    Jinf_50_2000,CPy_50_2000,'-k+')
title('CPy 2000')
xlabel('J_{\infty}')
ylabel('CP_{y}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 2000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CMx 2000
figure;
plot(Jinf_n90_2000,CMx_n90_2000,'-ko',...
    Jinf_n30_2000,CMx_n30_2000,'-ks',...
    Jinf_n15_2000,CMx_n15_2000,'-k^',...
    Jinf_n5_2000,CMx_n5_2000,'-kd',...
    Jinf_0_2000,CMx_0_2000,'-k*',...
    Jinf_10_2000,CMx_10_2000,'-kd',...
    Jinf_20_2000,CMx_20_2000,'-k^',...
    Jinf_30_2000,CMx_30_2000,'-ks',...
    Jinf_40_2000,CMx_40_2000,'-k.',...
    Jinf_50_2000,CMx_50_2000,'-k+')
title('CMx 2000')
xlabel('J_{\infty}')
ylabel('CM_{x}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 2000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CMy 2000
figure;
plot(Jinf_n90_2000,CMy_n90_2000,'-ko',...
    Jinf_n30_2000,CMy_n30_2000,'-ks',...
    Jinf_n15_2000,CMy_n15_2000,'-k^',...
    Jinf_n5_2000,CMy_n5_2000,'-kd',...
    Jinf_0_2000,CMy_0_2000,'-k*',...
    Jinf_10_2000,CMy_10_2000,'-kd',...
    Jinf_20_2000,CMy_20_2000,'-k^',...
    Jinf_30_2000,CMy_30_2000,'-ks',...
    Jinf_40_2000,CMy_40_2000,'-k.',...
    Jinf_50_2000,CMy_50_2000,'-k+')
title('CMy 2000')
xlabel('J_{\infty}')
ylabel('CM_{y}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 2000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CQ 2000
figure;
plot(Jinf_n90_2000,CQ_n90_2000,'-ko',...
    Jinf_n30_2000,CQ_n30_2000,'-ks',...
    Jinf_n15_2000,CQ_n15_2000,'-k^',...
    Jinf_n5_2000,CQ_n5_2000,'-kd',...
    Jinf_0_2000,CQ_0_2000,'-k*',...
    Jinf_10_2000,CQ_10_2000,'-kd',...
    Jinf_20_2000,CQ_20_2000,'-k^',...
    Jinf_30_2000,CQ_30_2000,'-ks',...
    Jinf_40_2000,CQ_40_2000,'-k.',...
    Jinf_50_2000,CQ_50_2000,'-k+')
title('CQ 2000')
xlabel('J_{\infty}')
ylabel('CQ')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 2000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')

%% PLOT CT 3000
figure;
plot(Jinf_n90_3000,CT_n90_3000,'-ko',...
    Jinf_n30_3000,CT_n30_3000,'-ks',...
    Jinf_n15_3000,CT_n15_3000,'-k^',...
    Jinf_n5_3000,CT_n5_3000,'-kd',...
    Jinf_0_3000,CT_0_3000,'-k*',...
    Jinf_10_3000,CT_10_3000,'-kd',...
    Jinf_20_3000,CT_20_3000,'-k^',...
    Jinf_30_3000,CT_30_3000,'-ks',...
    Jinf_40_3000,CT_40_3000,'-k.',...
    Jinf_50_3000,CT_50_3000,'-k+')
title('CT 3000')
xlabel('J_{\infty}')
ylabel('CT')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 3000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CPx 3000
figure;
plot(Jinf_n90_3000,CPx_n90_3000,'-ko',...
    Jinf_n30_3000,CPx_n30_3000,'-ks',...
    Jinf_n15_3000,CPx_n15_3000,'-k^',...
    Jinf_n5_3000,CPx_n5_3000,'-kd',...
    Jinf_0_3000,CPx_0_3000,'-k*',...
    Jinf_10_3000,CPx_10_3000,'-kd',...
    Jinf_20_3000,CPx_20_3000,'-k^',...
    Jinf_30_3000,CPx_30_3000,'-ks',...
    Jinf_40_3000,CPx_40_3000,'-k.',...
    Jinf_50_3000,CPx_50_3000,'-k+')
title('CPx 3000')
xlabel('J_{\infty}')
ylabel('CP_{x}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 3000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CPy 3000
figure;
plot(Jinf_n90_3000,CPy_n90_3000,'-ko',...
    Jinf_n30_3000,CPy_n30_3000,'-ks',...
    Jinf_n15_3000,CPy_n15_3000,'-k^',...
    Jinf_n5_3000,CPy_n5_3000,'-kd',...
    Jinf_0_3000,CPy_0_3000,'-k*',...
    Jinf_10_3000,CPy_10_3000,'-kd',...
    Jinf_20_3000,CPy_20_3000,'-k^',...
    Jinf_30_3000,CPy_30_3000,'-ks',...
    Jinf_40_3000,CPy_40_3000,'-k.',...
    Jinf_50_3000,CPy_50_3000,'-k+')
title('CPy 3000')
xlabel('J_{\infty}')
ylabel('CP_{y}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 3000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CMx 3000
figure;
plot(Jinf_n90_3000,CMx_n90_3000,'-ko',...
    Jinf_n30_3000,CMx_n30_3000,'-ks',...
    Jinf_n15_3000,CMx_n15_3000,'-k^',...
    Jinf_n5_3000,CMx_n5_3000,'-kd',...
    Jinf_0_3000,CMx_0_3000,'-k*',...
    Jinf_10_3000,CMx_10_3000,'-kd',...
    Jinf_20_3000,CMx_20_3000,'-k^',...
    Jinf_30_3000,CMx_30_3000,'-ks',...
    Jinf_40_3000,CMx_40_3000,'-k.',...
    Jinf_50_3000,CMx_50_3000,'-k+')
title('CMx 3000')
xlabel('J_{\infty}')
ylabel('CM_{x}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 3000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CMy 3000
figure(27);
plot(Jinf_n90_3000,CMy_n90_3000,'-ko',...
    Jinf_n30_3000,CMy_n30_3000,'-ks',...
    Jinf_n15_3000,CMy_n15_3000,'-k^',...
    Jinf_n5_3000,CMy_n5_3000,'-kd',...
    Jinf_0_3000,CMy_0_3000,'-k*',...
    Jinf_10_3000,CMy_10_3000,'-kd',...
    Jinf_20_3000,CMy_20_3000,'-k^',...
    Jinf_30_3000,CMy_30_3000,'-ks',...
    Jinf_40_3000,CMy_40_3000,'-k.',...
    Jinf_50_3000,CMy_50_3000,'-k+')
title('CMy 3000')
xlabel('J_{\infty}')
ylabel('CM_{y}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 3000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CQ 3000
figure(26);
plot(Jinf_n90_3000,CQ_n90_3000,'-ko',...
    Jinf_n30_3000,CQ_n30_3000,'-ks',...
    Jinf_n15_3000,CQ_n15_3000,'-k^',...
    Jinf_n5_3000,CQ_n5_3000,'-kd',...
    Jinf_0_3000,CQ_0_3000,'-k*',...
    Jinf_10_3000,CQ_10_3000,'-kd',...
    Jinf_20_3000,CQ_20_3000,'-k^',...
    Jinf_30_3000,CQ_30_3000,'-ks',...
    Jinf_40_3000,CQ_40_3000,'-k.',...
    Jinf_50_3000,CQ_50_3000,'-k+')
title('CQ 3000')
xlabel('J_{\infty}')
ylabel('CQ')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 3000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')

%% PLOT CT 4000
figure;
plot(Jinf_n90_4000,CT_n90_4000,'-ko',...
    Jinf_n30_4000,CT_n30_4000,'-ks',...
    Jinf_n15_4000,CT_n15_4000,'-k^',...
    Jinf_n5_4000,CT_n5_4000,'-kd',...
    Jinf_0_4000,CT_0_4000,'-k*',...
    Jinf_10_4000,CT_10_4000,'-kd',...
    Jinf_20_4000,CT_20_4000,'-k^',...
    Jinf_30_4000,CT_30_4000,'-ks',...
    Jinf_40_4000,CT_40_4000,'-k.',...
    Jinf_50_4000,CT_50_4000,'-k+')
title('CT 4000')
xlabel('J_{\infty}')
ylabel('CT')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 4000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CPx 4000
figure;
plot(Jinf_n90_4000,CPx_n90_4000,'-ko',...
    Jinf_n30_4000,CPx_n30_4000,'-ks',...
    Jinf_n15_4000,CPx_n15_4000,'-k^',...
    Jinf_n5_4000,CPx_n5_4000,'-kd',...
    Jinf_0_4000,CPx_0_4000,'-k*',...
    Jinf_10_4000,CPx_10_4000,'-kd',...
    Jinf_20_4000,CPx_20_4000,'-k^',...
    Jinf_30_4000,CPx_30_4000,'-ks',...
    Jinf_40_4000,CPx_40_4000,'-k.',...
    Jinf_50_4000,CPx_50_4000,'-k+')
title('CPx 4000')
xlabel('J_{\infty}')
ylabel('CP_{x}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 4000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CPy 4000
figure;
plot(Jinf_n90_4000,CPy_n90_4000,'-ko',...
    Jinf_n30_4000,CPy_n30_4000,'-ks',...
    Jinf_n15_4000,CPy_n15_4000,'-k^',...
    Jinf_n5_4000,CPy_n5_4000,'-kd',...
    Jinf_0_4000,CPy_0_4000,'-k*',...
    Jinf_10_4000,CPy_10_4000,'-kd',...
    Jinf_20_4000,CPy_20_4000,'-k^',...
    Jinf_30_4000,CPy_30_4000,'-ks',...
    Jinf_40_4000,CPy_40_4000,'-k.',...
    Jinf_50_4000,CPy_50_4000,'-k+')
title('CPy 4000')
xlabel('J_{\infty}')
ylabel('CP_{y}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 4000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CMx 4000
figure;
plot(Jinf_n90_4000,CMx_n90_4000,'-ko',...
    Jinf_n30_4000,CMx_n30_4000,'-ks',...
    Jinf_n15_4000,CMx_n15_4000,'-k^',...
    Jinf_n5_4000,CMx_n5_4000,'-kd',...
    Jinf_0_4000,CMx_0_4000,'-k*',...
    Jinf_10_4000,CMx_10_4000,'-kd',...
    Jinf_20_4000,CMx_20_4000,'-k^',...
    Jinf_30_4000,CMx_30_4000,'-ks',...
    Jinf_40_4000,CMx_40_4000,'-k.',...
    Jinf_50_4000,CMx_50_4000,'-k+')
title('CMx 4000')
xlabel('J_{\infty}')
ylabel('CM_{x}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 4000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CMy 4000
figure;
plot(Jinf_n90_4000,CMy_n90_4000,'-ko',...
    Jinf_n30_4000,CMy_n30_4000,'-ks',...
    Jinf_n15_4000,CMy_n15_4000,'-k^',...
    Jinf_n5_4000,CMy_n5_4000,'-kd',...
    Jinf_0_4000,CMy_0_4000,'-k*',...
    Jinf_10_4000,CMy_10_4000,'-kd',...
    Jinf_20_4000,CMy_20_4000,'-k^',...
    Jinf_30_4000,CMy_30_4000,'-ks',...
    Jinf_40_4000,CMy_40_4000,'-k.',...
    Jinf_50_4000,CMy_50_4000,'-k+')
title('CMy 4000')
xlabel('J_{\infty}')
ylabel('CM_{y}')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 4000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
%% PLOT CQ 4000
figure;
plot(Jinf_n90_4000,CQ_n90_4000,'-ko',...
    Jinf_n30_4000,CQ_n30_4000,'-ks',...
    Jinf_n15_4000,CQ_n15_4000,'-k^',...
    Jinf_n5_4000,CQ_n5_4000,'-kd',...
    Jinf_0_4000,CQ_0_4000,'-k*',...
    Jinf_10_4000,CQ_10_4000,'-kd',...
    Jinf_20_4000,CQ_20_4000,'-k^',...
    Jinf_30_4000,CQ_30_4000,'-ks',...
    Jinf_40_4000,CQ_40_4000,'-k.',...
    Jinf_50_4000,CQ_50_4000,'-k+')
title('CQ 4000')
xlabel('J_{\infty}')
ylabel('CQ')
annotation('textbox',...
        'String',{'\sigma = 0.0883','n = 4000rpm'})
legend('-90^{\circ}','-30^{\circ}','-15^{\circ}','-5^{\circ}','0^{\circ}','10^{\circ}','20^{\circ}','30^{\circ}','40^{\circ}','50^{\circ}','Location','southwest')
clc
clear
close all

addpath DataExtraction/
addpath Postprocessing/

%% VALUES

% Working directory (Don't link the Postprocessing directory, it's already
%   linked in getSimData())
wd = '~/Desktop/PoliMi/FlyMi/PreliminaryPolar2';

% Reference values
rho = 1.225; % Air density
U   = 28.5;  % Freestream velocity

S_wing = 0.408;  % Wing surface
c_wing = 0.2471; % Mean aerodynamic chord
qS     = 0.5*rho*U^2*S_wing;

% Data extraction values
alpha = -5:12; % Value(s) of aoa to consider
index = 30:44; % Row number(s) to sample from data
time  = getTime(wd,index);

% Plot controls --> Set to 1 the plots that you visualize
plotControls = struct( ...
    'CD_wing',  1,...
    'CL_wing',  1,...
    'CD_plane', 0,...
    'CL_plane', 0,...
    'polar_wing',  0,...
    'polar_plane', 1,...
    'efficiency_wing',  0,...
    'efficiency_plane', 0);

%% DATA

% NOTICE: THE LAST COLUMN REFERS TO AN AVERAGE OF THE PREVIOUS COLUMNS

% Wing data
Fx.wing = getSimData(wd, 'wing', 'Fx', alpha, index);
Fz.wing = getSimData(wd, 'wing', 'Fz', alpha, index);

[CD.wing,CL.wing,eff.wing] = getAeroCoefficients(Fx.wing,Fz.wing,qS,alpha,index);

CD.wing  = appendAverage(CD.wing,alpha);
CL.wing  = appendAverage(CL.wing,alpha);
eff.wing = appendAverage(eff.wing,alpha);

% Plane data
Fx.plane = getSimData(wd, 'plane', 'Fx', alpha, index);
Fz.plane = getSimData(wd, 'plane', 'Fz', alpha, index);

[CD.plane,CL.plane,eff.plane] = getAeroCoefficients(Fx.plane,Fz.plane,qS,alpha,index);

CD.plane  = appendAverage(CD.plane,alpha);
CL.plane  = appendAverage(CL.plane,alpha);
eff.plane = appendAverage(eff.plane,alpha);

%% POSTPROCESSING

printOutput(index,time,alpha,CD,CL);

% WING
getPlots(plotControls,index,time,alpha,CD.wing,CL.wing,eff.wing,'wing')

% PLANE
getPlots(plotControls,index,time,alpha,CD.plane,CL.plane,eff.plane,'plane')

fprintf('\n<strong><<< END <<<</strong>\n')
fprintf('===========================================================================\n\n');

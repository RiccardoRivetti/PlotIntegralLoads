clc
clear
close all

addpath DataExtraction/
addpath Postprocessing/

%% VALUES

% Working directory
wd = '/Users/riccardorivetti/Desktop/PoliMi/FlyMi/PreliminaryPolar2';

% Reference values
rho = 1.225;
U   = 28.5;

S_wing = 0.408;
c_wing = 0.2471;
qS     = 0.5*rho*U^2*S_wing;

% Data extraction values
alpha = 0:1;

nSim  = getSimNumber(wd);
index = 1:nSim; % Row number(s) to sample from data
time  = getTime(wd,index);

% Plot controls
plotControls = struct( ...
    'wing',  1,...
    'plane', 1);

%% DATA

% NOTICE: THE LAST COLUMN REFERS TO AN AVERAGE OF THE PREVIOUS COLUMNS

% Wing data
Fx.wing = getSimData(wd, 'wing', 'Fx', alpha, index);
Fz.wing = getSimData(wd, 'wing', 'Fz', alpha, index);

[CD.wing,CL.wing,eff.wing] = getAeroCoefficients(Fx.wing,Fz.wing,qS,alpha,index);

% Plane data
Fx.plane = getSimData(wd, 'plane', 'Fx', alpha, index);
Fz.plane = getSimData(wd, 'plane', 'Fz', alpha, index);

[CD.plane,CL.plane,eff.plane] = getAeroCoefficients(Fx.plane,Fz.plane,qS,alpha,index);

%% PLOTS
% In the 'mode' option select to plot either timesteps or simulation time

if plotControls.wing
    plotConvergence(time,CD.wing,CL.wing,alpha,'wing','timestep')
end

if plotControls.plane
    plotConvergence(time,CD.plane,CL.plane,alpha,'plane','timestep')
end
clc
clear
close all

addpath DataExtraction/

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
alpha = 0;

nSim  = getSimNumber(wd);
index = 1:nSim; % Row number(s) to sample from data
time  = getTime(wd,index);

nAlpha = length(alpha);
nIdx   = length(index);

% Plot controls
plotControls = struct( ...
    'wing',  1,...
    'plane', 1);

%% DATA

% NOTICE: THE LAST COLUMN REFERS TO AN AVERAGE OF THE PREVIOUS COLUMNS

alpha_rad = deg2rad(alpha);

% Wing data
Fx.wing = getSimData(wd, 'wing', 'Fx', alpha, index);
Fz.wing = getSimData(wd, 'wing', 'Fz', alpha, index);

CD.wing = zeros(nAlpha,nIdx);
CL.wing = zeros(nAlpha,nIdx);

for i = 1:nIdx
    for j = 1:nAlpha
        CD.wing(j, i) = (Fx.wing(j, i)*cos(alpha_rad(j)) + Fz.wing(j, i)*sin(alpha_rad(j)))/qS;
        CL.wing(j, i) = (-Fx.wing(j, i)*sin(alpha_rad(j)) + Fz.wing(j, i)*cos(alpha_rad(j)))/qS;
    end
end

% Plane data
Fx.plane = getSimData(wd, 'plane', 'Fx', alpha, index);
Fz.plane = getSimData(wd, 'plane', 'Fz', alpha, index);

CD.plane = zeros(nAlpha,nIdx);
CL.plane = zeros(nAlpha,nIdx);

for i = 1:nIdx
    for j = 1:nAlpha
        CD.plane(j, i) = (Fx.plane(j, i)*cos(alpha_rad(j)) + Fz.plane(j, i)*sin(alpha_rad(j)))/qS;
        CL.plane(j, i) = (-Fx.plane(j, i)*sin(alpha_rad(j)) + Fz.plane(j, i)*cos(alpha_rad(j)))/qS;
    end
end

%% PLOTS
% In the 'mode' option select to plot either timesteps or simulation time

if plotControls.wing
    plotConvergence(time,CD.wing,CL.wing,alpha,'wing','timestep')
end

if plotControls.plane
    plotConvergence(time,CD.plane,CL.plane,alpha,'plane','timestep')
end
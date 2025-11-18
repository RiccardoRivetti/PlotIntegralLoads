clc
clear
close all

addpath DataExtraction/
addpath Postprocessing/

%% VALUES

% Working directory (Don't link the Postprocessing directory, it's already
%   linked in getSimData())
wd = '/Users/riccardorivetti/Desktop/PoliMi/FlyMi/PreliminaryPolar2';

% Reference values
rho = 1.225; % Density
U   = 28.5;  % Freestream velocity

S_wing = 0.408;  % Wing surface
c_wing = 0.2471; % Mean aerodynamic chord
qS     = 0.5*rho*U^2*S_wing;

% Data extraction values
alpha = -5:12; % Value(s) of aoa to consider
index = 30:44; % Row number(s) to sample from data
time  = getTime(wd,index);

nAlpha = length(alpha);
nIdx   = length(index);

% Plot controls
plotControls = struct( ...
    'CD_wing',  0,...
    'CL_wing',  0,...
    'CD_plane', 0,...
    'CL_plane', 0,...
    'polar_wing',  0,...
    'polar_plane', 0,...
    'efficiency_wing',  0,...
    'efficiency_plane', 0);

%% DATA

% NOTICE: THE LAST COLUMN REFERS TO AN AVERAGE OF THE PREVIOUS COLUMNS

alpha_rad = deg2rad(alpha);

% Wing data
Fx.wing = getSimData(wd, 'wing', 'Fx', alpha, index);
Fz.wing = getSimData(wd, 'wing', 'Fz', alpha, index);

CD.wing = zeros(nAlpha,nIdx+1);
CL.wing = zeros(nAlpha,nIdx+1);

for i = 1:(nIdx+1)
    for j = 1:nAlpha
        CD.wing(j, i) = (Fx.wing(j, i)*cos(alpha_rad(j)) + Fz.wing(j, i)*sin(alpha_rad(j)))/qS;
        CL.wing(j, i) = (-Fx.wing(j, i)*sin(alpha_rad(j)) + Fz.wing(j, i)*cos(alpha_rad(j)))/qS;
    end
end

eff.wing = CL.wing ./ CD.wing;

% Plane data
Fx.plane = getSimData(wd, 'plane', 'Fx', alpha, index);
Fz.plane = getSimData(wd, 'plane', 'Fz', alpha, index);

CD.plane = zeros(nAlpha,nIdx+1);
CL.plane = zeros(nAlpha,nIdx+1);

for i = 1:(nIdx+1)
    for j = 1:nAlpha
        CD.plane(j, i) = (Fx.plane(j, i)*cos(alpha_rad(j)) + Fz.plane(j, i)*sin(alpha_rad(j)))/qS;
        CL.plane(j, i) = (-Fx.plane(j, i)*sin(alpha_rad(j)) + Fz.plane(j, i)*cos(alpha_rad(j)))/qS;
    end
end

eff.plane = CL.plane ./ CD.plane;

CL.wing_average  = CL.wing(:,end)';
CD.wing_average  = CD.wing(:,end)';
eff.wing_average = eff.wing(:,end)';

CL.plane_average  = CL.plane(:,end)';
CD.plane_average  = CD.plane(:,end)';
eff.plane_average = eff.plane(:,end)';

%% POSTPROCESSING

printOutput(index,time,alpha,CD,CL);

% WING
if plotControls.CD_wing
    plotC_alpha(alpha,CD.wing,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{D}$',Interpreter='latex',FontSize=16)
    title('$C_{D}$-$\alpha$ diagram of the wing',Interpreter='latex',FontSize=20)
end

if plotControls.CL_wing
    plotC_alpha(alpha,CL.wing,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title('$C_{L}$-$\alpha$ diagram of the wing',Interpreter='latex',FontSize=20)
end

if plotControls.efficiency_wing
    plotC_alpha(alpha,eff.wing,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}/C_{D}$',Interpreter='latex',FontSize=16)
    title('Efficiency diagram of the wing',Interpreter='latex',FontSize=20)
end

if plotControls.polar_wing
    plotPolar(CL.wing,CD.wing,index,time)
    xlabel('$C_{D}$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title('Polar diagram of the wing',Interpreter='latex',FontSize=20)
end

% PLANE
if plotControls.CD_plane
    plotC_alpha(alpha,CD.plane,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{D}$',Interpreter='latex',FontSize=16)
    title('$C_{D}$-$\alpha$ diagram of the plane',Interpreter='latex',FontSize=20)
end

if plotControls.CL_plane
    plotC_alpha(alpha,CL.plane,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title('$C_{L}$-$\alpha$ diagram of the plane',Interpreter='latex',FontSize=20)
end


if plotControls.efficiency_plane
    plotC_alpha(alpha,eff.plane,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}/C_{D}$',Interpreter='latex',FontSize=16)
    title('Efficiency diagram of the plane',Interpreter='latex',FontSize=20)
end

if plotControls.polar_plane
    plotPolar(CL.plane,CD.plane,index,time)
    xlabel('$C_{D}$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title('Polar diagram of the plane',Interpreter='latex',FontSize=20)
end

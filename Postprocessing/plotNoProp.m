clc
clear
close all

%% REFERENCE VALUES
rho = 1.225;
U = 29.29;

S_wing = 0.511;
% S_plane = 0.120;

c_wing = 0.2471;
% c_plane = 0.19;

qS = 0.5*rho*U^2*S_wing;
% qS_plane = 0.5*rho*U^2*S_plane;

alpha = -5:12;

CD = zeros(length(alpha),1);
CL = zeros(length(alpha),1);

for i = 1:length(alpha)
    fileName_np = ['Data/Wing/postpro_output_load_wing_np_aoa', num2str(alpha(i)),'.dat'];
    loads_np = readmatrix(fileName_np);

    CD(i) = -loads_np(end,2)/qS;
    CL(i) = loads_np(end,4)/qS;
end

%% PLOTS

figure(Position=[400,400,1200,1000])
plot(alpha,CL, LineWidth=2, Color='r', LineStyle='-')
grid on
box on
xlabel('$\alpha$',Interpreter='latex',FontSize=16)
ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
title('$C_{L}$-$\alpha$ diagram of the plane',Interpreter='latex',FontSize=20)

figure(Position=[400,400,1200,1000])
plot(alpha,CD, LineWidth=2, Color='r', LineStyle='-')
grid on
box on
xlabel('$\alpha$',Interpreter='latex',FontSize=16)
ylabel('$C_{D}$',Interpreter='latex',FontSize=16)
title('$C_{D}$-$\alpha$ diagram of the plane',Interpreter='latex',FontSize=20)

figure(Position=[400,400,1200,1000])
plot(CD,CL, LineWidth=2, Color='r', LineStyle='-')
grid on
box on
xlabel('$C_{D}$',Interpreter='latex',FontSize=16)
ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
title('Polar diagram of the plane',Interpreter='latex',FontSize=20)

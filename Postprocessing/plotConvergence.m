function plotConvergence(time,CD,CL,alpha,component,mode,wd,saveFile)

nAlpha = length(alpha);

if mode == "timestep"
    t = 1:length(time);
else
    t = time;
end

load('viridis.mat','raw')
textLegend = {};
colorIndex = 1:floor(256/nAlpha):256;

figure(Position=[400,400,2000,1000])

% Drag convergence
subplot(1,2,1)
grid on
hold on
box on

for i = 1:nAlpha
    plot(t,CD(i,:), LineWidth=2, Color=raw(colorIndex(i),:))
end

if mode == "timestep"
    xlabel('Timesteps',Interpreter='latex',FontSize=16)
else
    xlabel('$t$',Interpreter='latex',FontSize=16)
end
ylabel('$C_{D}$',Interpreter='latex',FontSize=16)

title(['Convergence of the ',component,' $C_{D}$'],Interpreter='latex',FontSize=20)

% Lift convergence
subplot(1,2,2)
grid on
hold on
box on

for i = 1:nAlpha
    plot(t, CL(i,:), 'LineWidth', 2, 'Color', raw(colorIndex(i),:))
    textLegend(i) = {['\alpha = ',num2str(alpha(i),'%.1f'),' deg']};
end

if mode == "timestep"
    xlabel('Timesteps',Interpreter='latex',FontSize=16)
else
    xlabel('$t$',Interpreter='latex',FontSize=16)
end
ylabel('$C_{L}$',Interpreter='latex',FontSize=16)

legend(textLegend, 'Location', 'northeastoutside');

title(['Convergence of the ',component,' $C_{L}$'],Interpreter='latex',FontSize=20)

if saveFile
    saveas(gcf, sprintf('%s/Graphs/%s_convergence.png', wd, component));
    fprintf('Saved convergence plot of the %s\n',component);
end

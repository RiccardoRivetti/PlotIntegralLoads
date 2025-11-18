function plotC_alpha(alpha,C,index,time)

load('viridis.mat','raw')

figure(Position=[400,400,1200,1000])
grid on
hold on
box on

colorIndex = 1:floor(256/length(index)):256;

textLegend = {};

for i = 1:length(index)
    plot(alpha,C(:,i), LineWidth=1, Color=raw(colorIndex(i),:))
    textLegend(i) = {['t = ',num2str(time(i),'%.5f'),' s']};
end

plot(alpha,C(:,end), LineWidth=3.5, Color='r', LineStyle='-')
textLegend(end+1) = {'AVERAGE'};

xlim([min(alpha), max(alpha)]);

legend(textLegend,"Location","northeastoutside")



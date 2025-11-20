function getPlots(plotControls,index,time,alpha,CD,CL,eff,component,wd,saveFile)

if component == "wing"
    ctrl = struct(...
        'CD',plotControls.CD_wing, ...
        'CL',plotControls.CL_wing, ...
        'eff',plotControls.efficiency_wing, ...
        'polar',plotControls.polar_wing);
elseif component == "plane"
    ctrl = struct(...
        'CD',plotControls.CD_plane, ...
        'CL',plotControls.CL_plane, ...
        'eff',plotControls.efficiency_plane, ...
        'polar',plotControls.polar_plane);
end

if ctrl.CD
    plotC_alpha(alpha,CD,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{D}$',Interpreter='latex',FontSize=16)
    title(['$C_{D}$-$\alpha$ diagram of the ',component],Interpreter='latex',FontSize=20)
    fprintf('Plotted CD-alpha diagram of the %s\n',component);
    if saveFile
        saveas(gcf, sprintf('%s/Graphs/%s_CD_alpha.png', wd, component));
        fprintf('Saved CD-alpha diagram of the %s\n',component);
    end
end

if ctrl.CL
    plotC_alpha(alpha,CL,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title(['$C_{L}$-$\alpha$ diagram of the ',component],Interpreter='latex',FontSize=20)
    fprintf('Plotted CL-alpha diagram of the %s\n',component);
    if saveFile
        saveas(gcf, sprintf('%s/Graphs/%s_CL_alpha.png', wd, component));
        fprintf('Saved CL-alpha diagram of the %s\n',component);
    end
end

if ctrl.eff
    plotC_alpha(alpha,eff,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}/C_{D}$',Interpreter='latex',FontSize=16)
    title(['Efficiency diagram of the ',component],Interpreter='latex',FontSize=20)
    fprintf('Plotted efficiency diagram of the %s\n',component);
    if saveFile
        saveas(gcf, sprintf('%s/Graphs/%s_eff_alpha.png', wd, component));
        fprintf('Saved efficiency diagram of the %s\n',component);
    end
end

if ctrl.polar
    plotPolar(CL,CD,index,time)
    xlabel('$C_{D}$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title(['Polar diagram of the ',component],Interpreter='latex',FontSize=20)
    fprintf('Plotted polar diagram of the %s\n',component);
    if saveFile
        saveas(gcf, sprintf('%s/Graphs/%s_polar.png', wd, component));
        fprintf('Saved polar diagram of the %s\n',component);
    end
end

end
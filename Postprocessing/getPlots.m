function getPlots(plotControls)

if plotControls.CL_wing
    plotC_alpha(alpha,CL.wing,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title('$C_{L}$-$\alpha$ diagram of the wing',Interpreter='latex',FontSize=20)
end

if plotControls.CD_wing
    plotC_alpha(alpha,CD.wing,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{D}$',Interpreter='latex',FontSize=16)
    title('$C_{D}$-$\alpha$ diagram of the wing',Interpreter='latex',FontSize=20)
end

if plotControls.CL_plane
    plotC_alpha(alpha,CL.plane,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title('$C_{L}$-$\alpha$ diagram of the plane',Interpreter='latex',FontSize=20)
end

if plotControls.CD_plane
    plotC_alpha(alpha,CD.plane,index,time);
    xlabel('$\alpha$',Interpreter='latex',FontSize=16)
    ylabel('$C_{D}$',Interpreter='latex',FontSize=16)
    title('$C_{D}$-$\alpha$ diagram of the plane',Interpreter='latex',FontSize=20)
end

if plotControls.polar_wing
    plotPolar(CL.wing,CD.wing,index,time)
    xlabel('$C_{D}$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title('Polar diagram of the wing',Interpreter='latex',FontSize=20)
end

if plotControls.polar_plane
    plotPolar(CL.plane,CD.plane,index,time)
    xlabel('$C_{D}$',Interpreter='latex',FontSize=16)
    ylabel('$C_{L}$',Interpreter='latex',FontSize=16)
    title('Polar diagram of the plane',Interpreter='latex',FontSize=20)
end

if plotControls.con
    plotConvergence(index,CL.wing,alpha,time)
    xlabel('$t$ [s]',Interpreter='latex',FontSize=16)
    ylabel('$C_{L,w}$',Interpreter='latex',FontSize=16)
end

end
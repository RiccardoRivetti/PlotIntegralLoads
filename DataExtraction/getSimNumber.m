function nSim = getSimNumber(wd)

fileName = [wd,'/Postprocessing/postpro_output_load_wing_aoa0.dat'];
loads = readmatrix(fileName);

nSim = size(loads,1);

end
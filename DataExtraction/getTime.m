function time = getTime(wd,index)

fileName = [wd,'/Postprocessing/postpro_output_load_wing_aoa0.dat'];
data = readmatrix(fileName);

time = data(index,1);

end
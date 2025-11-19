function [out] = getSimData(wd, component, force, alpha, index)
% This function writes into a matrix the data where the rows correspond to
% the angle of attack and the columns represent the timestep sampled.

out = zeros(length(alpha),length(index));

for i = 1:length(alpha)
    fileName = [wd,'/Postprocessing/postpro_output_load_', component,'_aoa', num2str(alpha(i)),'.dat'];
    loads = readmatrix(fileName);

    switch force
        case 'Fx'
            for j = 1:length(index)
                out(i,j) = loads(index(j),2);
            end
        case 'Fy'
            for j = 1:length(index)
                out(i,j) = loads(index(j),3);
            end
        case 'Fz'
            for j = 1:length(index)
                out(i,j) = loads(index(j),4);
            end
        case 'Mx'
            for j = 1:length(index)
                out(i,j) = loads(index(j),5);
            end
        case 'My'
            for j = 1:length(index)
                out(i,j) = loads(index(j),6);
            end
        case 'Mz'
            for j = 1:length(index)
                out(i,j) = loads(index(j),7);
            end
    end
end

function printOutput(index,time,alpha,CD,CL)

fprintf('========================================================================================================================================================================================================\n');

fprintf('<strong>>>> SIMULATION DATA EXTRACTED SUCCESFULLY >>></strong>\n\n')

fprintf('SIMULATION TIMESTEPS\n')
fprintf('From: %.5f (Timestep #%d)\n',time(1),index(1));
fprintf('To:   %.5f (Timestep #%d)\n\n',time(end),index(end));


fprintf('<strong>Alpha:</strong>\n\n')
disp(alpha);
fprintf('\n')

fprintf('<strong>Average CD</strong>:\n\n')
fprintf('Wing: ')
disp(CD.wing_average);
fprintf('Plane: ')
disp(CD.plane_average);
fprintf('\n')

fprintf('<strong>Average CL</strong>:\n\n')
fprintf('Wing: ')
disp(CL.wing_average);
fprintf('Plane: ')
disp(CL.plane_average);

fprintf('<strong><<< END <<<</strong>\n')
fprintf('========================================================================================================================================================================================================\n\n');

end
# PlotIntegralLoads
MATLAB scripts to plot integral loads computed via DUST

This repository is comprised of two scripts:
  - main.m --> Used to plot CD-alpha, CL-alpha, efficiency and polar diagram of both the wing and the whole plane
  - checkConvergence.m --> Used to plot the change of CD and CL against simulation time/timesteps.
                           (Intended for checking if the simulation is converging)

IMPORTANT
In order to run the scripts without changing the codes, please store the integral loads files in a directory named '/Postprocessing' inside your working directory.
Morover, the files must be named as follows:

  'postpro_output_load_COMPONENT_aoa#.dat'

For example, the intergral loads on the wing at aoa = 5 deg should be:

  'postpro_output_load_wing_aoa5.dat'

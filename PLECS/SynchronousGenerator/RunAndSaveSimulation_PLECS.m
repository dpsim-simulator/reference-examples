% Runs PLECS simulation and save voltage and current data in .csv files.

%% Load workspace for simulation
clear
load('SynchGeneratorParam_Kundur_3_1.mat')
load('ExciterParam_Eremia.mat')
load('GovernorParam_Kundur.mat')

%% run simulink example and save variables
 a = sim('synchronousGeneratorPLECS.slx','SimulationMode','normal');
 va = a.get('VoltageA');
 vb = a.get('VoltageB');
 vc = a.get('VoltageC');
 ia = a.get('CurrentA');
 ib = a.get('CurrentB');
 ic = a.get('CurrentC');
 time = a.get('tout');
%  psi_q = a.get('Flux_q');
%  psi_d = a.get('Flux_d');
  omega = a.get('omega');
 % theta = a.get('theta');
  Te = a.get('Te');
%  
%% save voltage and current csv file
Results_matrix = [time va vb vc ia ib ic];
%Fluxes_matrix = [time psi_q psi_d];

csvwrite('Voltages_and_currents.csv',Results_matrix);
% csvwrite('Fluxes.csv',Fluxes_matrix);
% csvwrite('theta.csv',theta);
dlmwrite('omega.csv',omega,'precision','%.10f');
dlmwrite('Te.csv',Te,'precision','%.10f')
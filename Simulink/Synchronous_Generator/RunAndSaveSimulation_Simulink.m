% Runs PLECS simulation and save voltage and current data in .csv files.

%% Load workspace for simulation
clear
run('param_SynchGenerator_Kundur_3_1.m')
run('ExciterParam_Eremia.m')
run('GovernorParam_Kundur.m')

%% run simulink example

%run simulation
sim_res = sim('SynchGenerator_DQ_Multimachine.slx','SimulationMode','normal');

%% save variables

% Save voltages and currents
v = sim_res.get('voltages');
i = sim_res.get('currents');

% Create time vector
time = linspace(0,0.3,length(i));
time = time';

% save omega, turbine output, vd, vq and exciter output
% theta = a.get('theta');
TurbineOutput = a.get('Pm');
vd = sim_res.get('vd');
vq = sim_res.get('vq');
vf = sim_res.get('vf');
vt = sim_res.get('vt');
omega = sim_res.get('omega_pu');
% Te = sim_res.get('Te');

%% save voltage and current csv file
Results_matrix = [time v i];

csvwrite('voltages_and_currents.csv', Results_matrix);

dlmwrite('omega.csv', omega, 'precision', '%.10f');
dlmwrite('TurbineOutput.csv', TurbineOutput, 'precision', '%.10f');
dlmwrite('vd_pu.csv', vd, 'precision', '%.10f');
dlmwrite('vq_pu.csv', vq, 'precision', '%.10f');
csvwrite('ExciterOutput_Simulink.csv', vf);
csvwrite('vt.csv', vt);
% csvwrite('theta.csv',theta);
% csvwrite('Te.csv',Te);

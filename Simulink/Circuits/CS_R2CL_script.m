%% run simulink example and save variables
s = sim('CS_R2CL', 'SimulationMode','normal');

%% write csv file with results from simulink
t = array2table([s.tout, s.v1, s.v2, s.i12, s.i34], 'VariableNames', {'time', 'v1', 'v2', 'i12', 'i34'});
writetable(t, 'SL_CS_R2CL.csv');

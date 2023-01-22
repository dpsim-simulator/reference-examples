%% run simulink example and save variables
s = sim('VS_R2L3', 'SimulationMode','normal');

%% write csv file with results from simulink
t = array2table([s.tout, s.v1, s.v2, s.v3, s.v4 s.i12 s.i34], 'VariableNames', {'time', 'v1', 'v2', 'v3', 'v4', 'i12', 'i34'});
writetable(t, 'SL_VS_R2L3.csv');

%% run simulink example and save variables
s = sim('VS_RL1', 'SimulationMode', 'normal');

%% write csv file with results from simulink
t = array2table([s.tout, s.v1 s.v2 s.i12], 'VariableNames', {'time', 'v1', 'v2', 'i12'});
writetable(t, 'SL_VS_RL1.csv');

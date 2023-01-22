%% run simulink example and save variables
s = sim('ResVS_RL2','SimulationMode','normal');

%% write csv file with results from simulink
t = array2table([s.tout s.e1 s.e2], 'VariableNames', {'time','e1','e2'});
writetable(t, 'SL_ResVS_RL2.csv');

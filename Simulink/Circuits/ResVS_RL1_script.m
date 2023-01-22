%% run simulink example and save variables
s = sim('ResVS_RL1','SimulationMode','normal');

%% write csv file with results from simulink
t = array2table([s.tout s.e1 s.e2 s.e3], 'VariableNames', {'time','e1','e2', 'e3'});
writetable(t, 'SL_ResVS_RL1.csv');

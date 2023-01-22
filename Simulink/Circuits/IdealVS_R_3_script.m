%% run simulink example and save variables
s = sim('IdealVS_R2','SimulationMode','normal');

%% write csv file with results from simulink
t = array2table([s.tout s.e1 s.e2 s.e3 s.e4 s.i1 s.i2], 'VariableNames', {'time','e1','e2', 'e3', 'e4', 'i1', 'i2'});
writetable(t, 'SL_IdealVS_R2.csv');

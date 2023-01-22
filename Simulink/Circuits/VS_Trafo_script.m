%% run simulink example and save variables
s = sim('IdealVS_Trafo','SimulationMode','normal');

%% write csv file with results from simulink
t = array2table([s.tout s.e1 s.e2 s.e3 s.i0], 'VariableNames', {'time','e1','e2', 'e3', 'i0'});
writetable(t, 'SL_IdealVS_Trafo.csv');

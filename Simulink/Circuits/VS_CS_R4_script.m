%% run simulink example and save variables
s = sim('VS_CS_R4', 'SimulationMode','normal');

%% write csv file with results from simulink
t = array2table([s.tout, s.v1, s.v2, s.v3, s.i12 s.i23], 'VariableNames', {'time', 'v1', 'v2', 'v3', 'i12', 'i23'});
writetable(t, 'SL_VS_CS_R4.csv');
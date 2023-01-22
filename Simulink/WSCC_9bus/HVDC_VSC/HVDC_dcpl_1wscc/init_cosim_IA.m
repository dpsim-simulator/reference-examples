
%Reference Magnitude for sinewave test signal
%Vec_output_values = [1 1 2 2 4 4 8 8 4 4 2 2 1].';
%Vec_time_values = [0 1 2 3 4 5 6 7 8 9 10 11 12].';

%Sim-sim interface
%subsystem sample time and OpComm communication time
Ts_intf =2*Ts_Power;
%sampler
h=5; %(x Ts_Power) 
sampler_ms=h*Ts_intf*1000

%Artificial Delay (defined as number of time-steps)
intfDelay  = 400.0; %650; %1; %(x Ts_Power); for analytical stability analyses: must be integer multiple of h
intfDelay_ms =  intfDelay*Ts_intf*1000

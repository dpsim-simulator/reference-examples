%power_hvdc_vsc

%This m-script automatizes startup and dynamic performance tests for 
%power_hvdc_vsc example; it contains all references (both time and control ref)

%% Initial settings
Pref_init = 0.0;    %reference power at the station 1 set to 0 p.u.

%% System Startup 
%1. ITM initialization
t_SwitchITMVdc = 0.1;   % time elapsed from the simulation beginn to voltage coupling
t_SwitchITMIdc = 0.2;   % time elapsed from the simulation beginn to current coupling

%2. 
%station 2, at time instant "t_deblock_Udref2", deblocking of DC voltage control (blockinig_status: 1->0)
t_deblock_Udref2 = 0.3; %orgn value: t_deblock_Udref2 = 0.1;

%3.
%station 1, at time instant "t_deblock_Pref1", deblocking of active power control (blockinig_status: 1->0)
%Power is ramped up by 1.43pu/sec (parameter in Discrete VSC-based HVDC Controller)
t_deblock_Pref1 = 0.5; %orgn value: t_deblock_Pref1 = 0.3;

%% Dynamic performance

%6. (by me)
%station 1, at t_dPref1_2, dPref1_2, ramp;
t_dPref1_2 = 25.0; 
dPref1_2 = 0.125;   % 1[p.u.] = 200MVA  
dPref1_2_rlimit = 0.6;


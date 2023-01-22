% Machine parameters from Kundur Examples 3.1, 3.2,  8.1 (pages 91,102, 345)
% "Power System Stability and Control"  McGraw-Hill  book, 1994
% --------------------------------------------------------------------
% Nominal parameters
Pn=  555e6;   % three-pahse nominal power (VA)
Vn=  24e3;    % nominal LL volatge (Vrms)
fn=  60;      % nominal frequency (Hz)
ifn= 1300;    % nominal field current (A)
% Note: ifn is deduced from stator-field mutual inductance Lsfd
%       Lsfd = Vn/sqrt(3)*sqrt(2)/ifn/wn 
% ->     ifn = sqrt(2/3)*Vn/Lsfd/(2*pi*60)  = 1300 A


% Stator RL parameters (SI)
Rs= 0.0031;     % resistance (ohms)
Ll= 0.4129e-3;  % leakage inductance (H) 
Lmd=4.5696e-3;  % d-axis magnetizing inductance (H)  
Lmq=4.432e-3;   % q-axis magnetizing inductance (H)

% Field RL parameters (SI)
Rf= 0.0715;    %  resistance (ohms)
Lffd= 0.57692; %  self inductance (H)
% Note: Field leakage inductance Llfd wiil be later deduced from:
% Llfd_pu= Lffd_pu-Lmd_pu      

% Damper RL parameters from Kundur Example 3.2 
Rkd_pu   = 0.0284; 
Llkd_pu  = 0.1713; 
Rkq1_pu  = 0.00619;  
Llkq1_pu = 0.7252; 
Rkq2_pu  = 0.02368;  
Llkq2_pu = 0.125; 
            
% Stator base values
wbase=2*pi*fn;
Vsbase=Vn/sqrt(3)*sqrt(2);
Isbase=Pn/Vn/sqrt(3)*sqrt(2);
Zsbase=Vn^2/Pn;
Lsbase=Zsbase/wbase;

%Stator parameters in PU
Rs_pu=Rs/Zsbase;
Ll_pu=Ll/Lsbase;
Lmd_pu=Lmd/Lsbase;
Lmq_pu=Lmq/Lsbase;

% Field base values
Ifbase=ifn*Lmd_pu;
Vfbase=Pn/Ifbase;
Zfbase=Vfbase/Ifbase;
Lfbase=Zfbase/wbase;

% Transformation ratio Ns/Nf
Ns_Nf=2/3*Ifbase/Isbase;

% Field parameters in PU
Rf_pu=Rf/Zfbase;
Lffd_pu=Lffd/Lfbase;      % self inductance (pu)
Llfd_pu=Lffd_pu - Lmd_pu; % leakage inductance (pu)
Llfd= Llfd_pu*Lfbase;     % leakage inductance (H)

% Field parameters referred to the stator
Rf_prime=Rf*3/2*Ns_Nf^2;
Llfd_prime=Llfd*3/2*Ns_Nf^2;

% Nominal field voltage
Vfn=Rf*ifn;
% Nominal field voltage and current referred to stator
Vfn_prime=Rf_pu/Lmd_pu*Vsbase;
Ifn_prime=Isbase/Lmd_pu;

% Inertia
H= 3.7; % sec
wm= 2*pi*60; %rad/s
J= 2*H*Pn/wm^2; % kg.m^2
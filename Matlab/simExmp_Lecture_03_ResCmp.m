%MSP - WS2015/16 
%Lecture 3
%Simulation Example - Resistive Companion method

clear all;
close all;

%Numerical integration methods: 
%1. Euler Backward 
%2. Euler Forward
%3. Trapezoidal rule

%Circuit parameters:
fprintf('Circuit parameters:\n');
R1 = 1
R2 = 2
L1 = 20e-3
L2 = 100e-3
L3 = 50e-3
Emax = 10

G1 = 1/R1;
G2 = 1/R2;

%Total simulation time
fprintf('Total simulation time:\n');
T_total=0.3

%Simulaiton time step 
%Note: Euler forward is numerically unstable for Ts>7.51e-6
fprintf('Simulaiton time step:\n');
Ts = 0.001

npoint = round(T_total/Ts);


% %%%%%%%%%%%%% Euler Backward integration method %%%%%%%%%%%%%%%
% GL1_back = Ts/(L1);
% GL2_back = Ts/(L2);
% GL3_back = Ts/(L3);
% 
% %Conductance matrix
% Gn = [G1+GL1_back       -GL1_back                      0;
%       -GL1_back     GL1_back+GL2_back+GL3_back       -GL3_back;
%         0                -GL3_back                  GL3_back+G2];
%    
%  %Node voltage vector
%  vn_back = zeros(3, npoint);
%  %Current vector in the 3 inductances
%  in_back = zeros(3, npoint);
%  
%  %Intial conditions
%  % Voltage source at E(t=0)=0;
%  % i_L(t=0)=0  -> e1 = E(t=0) =0; e2 = 0; e3 = 0;
%  in_back(:,1) = zeros(3,1);
%  vn_back(:,1) = zeros(3,1); 
% 
%  
%  %Enter Loop
%  tic %Start a timer
%  for i=2:npoint
%      % Update source vector
%      AL1_back = in_back(1,i-1);
%      AL2_back = in_back(2,i-1);
%      AL3_back = in_back(3,i-1);
%      E = Emax*sin(2*pi*60*i*Ts);
%      Jn =[E/R1-AL1_back; AL1_back-AL2_back-AL3_back; AL3_back];
%      % Matrix inversion and solution of the equation G*e=J;
%      vn_back(:,i) = Gn\Jn;
%      % post step
%      in_back(1,i)= AL1_back+GL1_back*(vn_back(1,i)-vn_back(2,i));
%      in_back(2,i)= AL2_back+GL2_back*(vn_back(2,i));
%      in_back(3,i)= AL3_back+GL3_back*(vn_back(2,i)-vn_back(3,i));
%  end
%  toc %stop the timer 
%  
 
 
%  %%%%%%%%%%%%% Euler forward integration method %%%%%%%%%%%%%%%
% %Large resistor added in parallel with inductors (3 current sources coincide at a node)
% Gadd=1e-4;
% %Conductance matrix
% Gn = [G1+Gadd       -Gadd           0;
%       -Gadd         3*Gadd        -Gadd;
%          0           -Gadd       Gadd+G2];
%    
%  %Node voltage vector
%  vn_forw = zeros(3, npoint);
%  %Current vector in the 3 inductances
%  in_forw = zeros(3, npoint);
%  
%  %Intial conditions
%  % Voltage source at E(t=0)=0;
%  % i_L(t=0)=0  -> e1 = E(t=0) =0; e2 = 0; e3 = 0;
%  in_forw(:,1) = zeros(3,1);
%  vn_forw(:,1) = zeros(3,1); 
%  
%  %Enter Loop
%  tic %Start a timer
%  for i=2:npoint
%      % Update source vector
%      AL1_forw = in_forw(1,i-1)+(vn_forw(1,i-1)-vn_forw(2,i-1))*Ts/L1;
%      AL2_forw = in_forw(2,i-1)+(vn_forw(2,i-1))*Ts/L2;
%      AL3_forw = in_forw(3,i-1)+(vn_forw(2,i-1)-vn_forw(3,i-1))*Ts/L3;
%      E = Emax*sin(2*pi*60*i*Ts);
%      Jn =[E/R1-AL1_forw; AL1_forw-AL2_forw-AL3_forw; AL3_forw];
%      % Matrix inversion and solution of the equation G*e=J; 
%      vn_forw(:,i) = Gn\Jn;
%      % post step
%      in_forw(1,i)= AL1_forw;
%      in_forw(2,i)= AL2_forw;
%      in_forw(3,i)= AL3_forw;
%  end
%  toc %stop the timer
%  
 
 %%%%%%%%%%%%% Trapezoidal integration method %%%%%%%%%%%%%%%
GL1_trap = Ts/(2*L1);
GL2_trap = Ts/(2*L2);
GL3_trap = Ts/(2*L3);

%Conductance matrix
Gn = [G1+GL1_trap           -GL1_trap                         0;
      -GL1_trap     GL1_trap+GL2_trap+GL3_trap           -GL3_trap;
        0                    -GL3_trap                   GL3_trap+G2];
   
 %Node voltage vector
 vn_trap = zeros(3, npoint);
 %Current vector in the 3 inductances
 in_trap = zeros(3, npoint);
 
 %Intial conditions
 % Voltage source at E(t=0)=0;
 % i_L(t=0)=0  -> e1 = E(t=0) =0; e2 = 0; e3 = 0;
 in_trap(:,1) = zeros(3,1);
 vn_trap(:,1) = zeros(3,1); 
 
 %Enter Loop
 tic
 for i=2:npoint
     % Update source vector
     AL1 = in_trap(1,i-1)+(vn_trap(1,i-1)-vn_trap(2,i-1))*Ts/(2*L1);
     AL2 = in_trap(2,i-1)+(vn_trap(2,i-1))*Ts/(2*L2);
     AL3 = in_trap(3,i-1)+(vn_trap(2,i-1)-vn_trap(3,i-1))*Ts/(2*L3);
     E = Emax*sin(2*pi*60*i*Ts);
     Jn =[E/R1-AL1; AL1-AL2-AL3; AL3];
     % Matrix inversion and solution of the equation G*e=J;
     vn_trap(:,i) = Gn\Jn;
     % post step
     in_trap(1,i)= AL1+GL1_trap*(vn_trap(1,i)-vn_trap(2,i));
     in_trap(2,i)= AL2+GL2_trap*(vn_trap(2,i));
     in_trap(3,i)= AL3+GL3_trap*(vn_trap(2,i)-vn_trap(3,i));
 end
 toc
 
 
%  %plot resulst - currents in L
%  
%  %Trapzoidal rule
%  figure;
%  plot((1:npoint).*Ts,in_trap(1,:),(1:npoint).*Ts,in_trap(3,:));
%  title('Resistive Companion method: Trapezoidal vs. Forward');
%  xlabel('Time [s]');
%  ylabel('Current [A]');
%  %Euler Forward
%  hold on;
%  plot((1:npoint).*Ts,in_forw(1,:),':',(1:npoint).*Ts,in_forw(3,:),':')
%  legend('Trapezoidal I_{L1}(t)', 'Trapezoidal I_{L3}(t)','E. Forward I_{L1}(t)', 'E. Forward I_{L3}(t)')
%  
%  %Trapzoidal rule
%  figure;
%  plot((1:npoint).*Ts,in_trap(1,:),(1:npoint).*Ts,in_trap(3,:));
%  title('Resistive Companion method: Trapezoidal vs. Backward')
%  xlabel('Time [s]')
%  ylabel('Current [A]')
%  %Euler Backward
%  hold on;
%  plot((1:npoint).*Ts,in_back(1,:),':',(1:npoint).*Ts,in_back(3,:),':')
%  legend('Trapezoidal I_{L1}(t)', 'Trapezoidal I_{L2}(t)','E. Backward I_{L1}(t)', 'E. Backward I_{L2}(t)')
%  

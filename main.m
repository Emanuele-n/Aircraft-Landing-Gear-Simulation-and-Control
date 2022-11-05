
%% Initializing variable

clear variables
clc


%% Airbus A320 Parameters

L=12.6; % airplane lenght [m]
Lf=L*0.90; % distance between front-c.o.m [m]
Lr=L-Lf; % distance between rear-c.o.m. [m]
M=73000; % total mass [kg]
mr=(M*Lf)/L; % front mass [kg]
mf=M-mr; % rear mass [kg]
alpha=0.127; % street coefficient [rad/m]
v0x=70; % initial horizontal velocity [m/s]
g=9.81; % gravity [m/s^2]
Jy=(mf*Lf^2)/3; % inertia [kg*m^2]
Rt=0.5; % wheel Radious[m]

%% Simulation Time

sim_time=0.05/v0x;

%% Landing Gear (Front)

kf=1e6; % spring coefficient [N/m]
mtf=120*2; % landing gear mass [kg]
cf_max=2*sqrt(kf*mf); % max damping coefficient [Ns/m]
cf_min=cf_max/40; % min damping coefficient [Ns/m]
ktf=2.1e6; % tire coefficient [N/m]


%% Landing Gear (Rear)

kr=1e6; % spring coefficient [N/m]
mtr=120*8; % landing gear mass [kg]
cr=2*sqrt(kr*mr); % damping coefficient [Ns/m]
ktr=2.1e6; % tire coefficient [N/m]


%% Elevator Control Parameters

Kp_eq=5; % proportional Gain
Ki_eq=3; % integral Gain
Kd_eq=3; % derivative Gain
elevator_max=0.5; % Saturation
thetad2=(pi/180)*4; % theta desired 2
thetad1=(pi/180)*0; % theta desired 1

%% Lift Control Parameters

Kp_lift=1000; % proportional Gain
Ki_lift=10; % integral Gain
Kd_lift=100; % derivative Gain
Cl=2; % lift coefficient
d_air=1.18; % densità dell'area [Kg/m^3]
Flap_max=300; % apertura flap max [m^2]
Flap_min=100; % apertura flap min [m^2]
zd_dot=-1; % desired vertical velocity [m/s]


%% Pacejka subsystem Parameters

Jf =(mtf*(Rt^2))/2; % front wheel inertia [kg*m^2]
Jr =(mtr*(Rt^2))/2; % rear wheel inertia [kg*m^2]
Cd=0.35; % drag coefficient
Mbrake=10e1; % brake torque [Nm]
mu0=0.015;
mu1=7e-6;
Ax=10; % [m^2]

%% Initial Conditions

z0=50; % Initial Altitude
theta0=(pi/180)*2; % Initial Attitude

max_compression=2.3;
max_rebound=2.9;
L0=(max_compression+max_rebound)/2;

zwf0=z0+Lf*sin(theta0)-((mtf*g/kf)+L0); % Initial Front Rear Altitude
zwr0=z0-Lr*sin(theta0)-((mtr*g/kr)+L0); % Inital Rear Wheel Altitude



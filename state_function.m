function x_next = state_function(x_prev, u)

    % u: rf,rr,cf,lift,elevator
    % x: z,theta,zwf,zwr,z_dot,theta_dot,zwf_dot,zwr_dot
    
    rf=u(1);
    rr=u(2);
    cf=u(3);
    lift=u(4);
    elevator=u(5);

    z = x_prev(1);
    theta = x_prev(2);
    zwf = x_prev(3);
    zwr = x_prev(4);
    
    z_dot = x_prev(5);
    theta_dot = x_prev(6);
    zwf_dot = x_prev(7);
    zwr_dot = x_prev(8);
    
    v0x=70; % initial horizontal velocity [m/s]
    sim_time=0.05/v0x; % simulation time

    
    L=12.6; % airplane lenght [m]
    Lf=L*0.90; % distance between front-c.o.m [m]
    Lr=L-Lf; % distance between rear-c.o.m. [m]
    M=73000; % total mass [kg]
    g=9.81; % gravity [m/s^2]
    mr=(M*Lf)/L; % front mass [kg]
    mf=M-mr; % rear mass [kg]
    Jy=(mf*Lf^2)/3; % inertia [kg*m^2]
   
    
    % Landing Gear (Front)

    kf=1e6; % spring coefficient [N/m]
    mtf=120*2; % landing gear mass [kg]
    ktf=2.1e6; % tire coefficient [N/m]


    % Landing Gear (Rear)

    kr=1e6; % spring coefficient [N/m]
    mtr=120*8; % landing gear mass [kg]
    cr=2*sqrt(kr*mr); % damping coefficient [Ns/m]
    ktr=2.1e6; % tire coefficient [N/m]

    zf = z + Lf * sin(theta);
    zr = z - Lr * sin(theta);

    zf_dot = z_dot + Lf*theta_dot * cos(theta);
    zr_dot = z_dot - Lr*theta_dot * cos(theta);


    x_dot = [   z_dot;
                theta_dot;
                zwf_dot;
                zwr_dot;
                (-fel(zf-zwf,kf) - fda(zf_dot - zwf_dot,cf) - fel(zr-zwr,kr) - fda(zr_dot - zwr_dot,cr) + lift) / M  - g;
                ( Lf*(-fel(zf-zwf,kf) - fda(zf_dot - zwf_dot,cf)) + Lr*(fel(zr-zwr,kr) + fda(zr_dot - zwr_dot,cr)) ) / Jy  + elevator;  
                ( fel(zf-zwf,kf) + fda(zf_dot - zwf_dot,cf) -felt(zwf-rf,ktf) ) / mtf - g;
                ( fel(zr-zwr,kr) + fda(zr_dot - zwr_dot,cr) -felt(zwr-rr,ktr) ) / mtr - g;
            ];
                

    x_next =(sim_time) * x_dot + x_prev;     

end
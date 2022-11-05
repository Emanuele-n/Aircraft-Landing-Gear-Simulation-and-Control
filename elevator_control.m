function u = elevator_control(zf,zwf,zr,zwr,zf_dot,zwf_dot,zr_dot,zwr_dot,theta,theta_dot,kf,kr,cf,cr,Jy,Kp,Kd,Ki,thetad,thetad_dot,integral_term)

% Cancel nonlinear dynamics
f = (1/Jy)*(-fel(zf-zwf,kf) - fda(zf_dot - zwf_dot,cf) + fel(zr-zwr,kr) + fda(zr_dot - zwr_dot,cr));

% PID controller
v = Kp*(theta - thetad) + Kd*(theta_dot - thetad_dot)+ Ki*(integral_term);

% F.L. Controller
u = - f - v; 
    
end


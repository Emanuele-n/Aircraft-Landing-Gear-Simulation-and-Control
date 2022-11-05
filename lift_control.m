function  L=lift_control(zf,zwf,zr,zwr,zf_dot,zwf_dot,zr_dot,zwr_dot,z_dot,zd_dot,zd_dotdot,M,kf,kr,cf,cr,g,Kp,Kd,Ki,integral_term,z_dotdot)

   % L=(fel(zf-zwf,kf)+fel(zr-zwr,kr)+fda(zf_dot-zwf_dot,cf)+fda(zr_dot-zwr_dot,cr))-(g+Kp*(z_dot-zd_dot))*M;
    
% Cancel nonlinear dynamics
f = - fel(zf-zwf,kf) - fda(zf_dot - zwf_dot,cf) - fel(zr-zwr,kr) - fda(zr_dot - zwr_dot,cr) - g*M;

% PID controller
v = Kp*(z_dot - zd_dot) + Kd*(z_dotdot-zd_dotdot)+ Ki*(integral_term);

% F.L. Controller
L = - f - v; 
    
    
    

end


function u = variational_control_algorithm(zf,zwf,rf,zf_dot,zwf_dot)

    g0 = -1e6;
    g1 = 0.001;
    g2 = 1e4;
    g3 = 0.001;
    g4 = 1;

    [~,D]=fda(zf_dot - zwf_dot,0);
    [~,N1]=fel(zf-zwf,0);
    [~,N2]=felt(zwf-rf,0);
    
    u = (1/D) * ( g0*N1 + g1*N2 + g2*zf_dot + g3*zwf_dot + g4*rf );
end
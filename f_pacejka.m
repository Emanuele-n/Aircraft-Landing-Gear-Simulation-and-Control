function F_long = f_pacejka(Fz, k)
    a0 = 1.65;
    a1 = -21.3;
    a2 = 1144;
    a3 = 49.6;
    a4 = 226;
    a5 = 0.069;
    a6 = -0.006;
    a7 = 0.056;
    a8 = 0.486;
    D1 = a1*(Fz^2) + a2*Fz+1;
    C1 = a0;
    B1 = ( a3*(Fz^2) + a4*Fz) / (C1*D1*exp(a5*Fz) );
    E1 = a6*(Fz^2) + a7*Fz + a8;
    F_long = D1*sin(C1*atan2(B1*(1-E1)*k+E1*atan2(B1*k,1),1));
end
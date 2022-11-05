function k = k_pacejka(x_dot, omega)
    Rt = 0.5;
    k = - ( (x_dot - omega * Rt) / abs(x_dot) ) *100;
end
function [out,var_out] = felt(input,k)

    Rt=0.5; % wheel Radious[m]
    
    if input>Rt % Detachment Condition
        k=0;
    end
    if input<=Rt-0.04 % Max Tire compression
        k=10*k;
    end

    out=k*(input-Rt);
    var_out=input-Rt;   
end


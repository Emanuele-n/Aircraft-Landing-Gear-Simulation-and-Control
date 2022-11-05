function [out,var_out] = fda(input,d)

    if input>=0 % damping for rebound
        d=d*0.08;
    end
    
    out=d*input;
    var_out=input;

end


function [out,var_out] = fel(input,k)

    max_compression=2.3;
    max_rebound=2.9;
    L0=(max_compression+max_rebound)/2;
   
    if input>=max_rebound % max rebound
        k=10*k;
    end
    if input<=max_compression % max compression
        k=10*k;
    end

   out=k*(input-L0);
   var_out=input-L0;
  
end


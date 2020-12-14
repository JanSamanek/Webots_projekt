function dira = test(distance_L_side, distance_R_side)
    
    if distance_L_side > 999
       i = 1;
    end  
    if distance_R_side > 999
        i = 2;
    end    
    if distance_L_side > 995 && distance_R_side > 995
        i = 3;
    end 
    if distance_L_side < 995 && distance_R_side < 995
        i = 0;
        
    end
    dira = i;
end


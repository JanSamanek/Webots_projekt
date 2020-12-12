function smer = rizeni (distance, distance_F_L, distance_F_R, dira, barva)
if distance > 80 
      if  distance_F_L > 995 && distance_F_R > 995 
          smer = 'forward';
       else          
           if distance_F_L < 990      
              smer = 'right';
         elseif distance_F_R < 990  
              smer = 'left';
           end
     end      
else
    if dira == 1
       smer = 'left';
    end
    if dira == 2
       smer = 'right';
    end
    
    if dira == 3
        
      
        if barva == 1
         smer = 'right';
         
         elseif barva == 2
         smer = 'left';
         
         elseif barva == 3
         smer = 'right';
        
         elseif barva == 4
          smer = 'left'; 
        end
    end
    
end
end


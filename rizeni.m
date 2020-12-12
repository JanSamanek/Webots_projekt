function smer = rizeni (distance, distance_F_L, distance_F_R)
if distance > 80 
      if  distance_F_L > 995 && distance_F_R > 995 
          smer = 'forward';
       else          
           if distance_F_L < 995       
              smer = 'right';
         elseif distance_F_R < 995  
              smer = 'left';
           end
     end      
else
         smer = 'left';   
end
end


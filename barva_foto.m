function barva = barva_foto
    
    x = imread('foto.jpg');

y = mean(mean(x));

if y(:,:,1) > y(:,:,2) && y(:,:,1) > y(:,:,3)
    
    barva = 1
    
end

if y(:,:,2) > y(:,:,1) && y(:,:,2) > y(:,:,3)
    
    barva = 2 
    
end

if y(:,:,3) > y(:,:,2) && y(:,:,3) > y(:,:,1)
    
    barva = 3 
    
end
   
if y(:,:,3) == y(:,:,2) && y(:,:,3) == y(:,:,1)
    
    barva = 4 
    
end 
    
end
  barva = 0;
  TIME_STEP = 64;
  time_to_turn_90 = 2.7521;
  time_to_turn_180 = 5.5041;
  motor_velocity = 2;  

  %settings  
  pen = wb_robot_get_device('pen');
  d_sensor = wb_robot_get_device('d_sensor');
  d_sensor_F_L = wb_robot_get_device('d_sensor_F_L');
  d_sensor_F_R = wb_robot_get_device('d_sensor_F_R');
  camera = wb_robot_get_device('camera');
  
  write = true; 
  wb_pen_write(pen,write);
  
  wb_distance_sensor_enable(d_sensor, TIME_STEP);
  wb_distance_sensor_enable(d_sensor_F_L, TIME_STEP);
  wb_distance_sensor_enable(d_sensor_F_R, TIME_STEP);
  wb_camera_enable(camera, TIME_STEP);
  
   left_front_motor = wb_robot_get_device('left_front_motor');
  right_front_motor = wb_robot_get_device('right_front_motor');
  left_back_motor = wb_robot_get_device('left_back_motor');
  right_back_motor = wb_robot_get_device('right_back_motor');
  
while wb_robot_step(TIME_STEP) ~= -1

%sensor values
    distance = wb_distance_sensor_get_value(d_sensor);
    distance_F_L = wb_distance_sensor_get_value(d_sensor_F_L);
    distance_F_R = wb_distance_sensor_get_value(d_sensor_F_R);

%motor settings 
  wb_motor_set_position(left_front_motor, inf);
  wb_motor_set_position(right_front_motor, inf);
  wb_motor_set_position(left_back_motor, inf);
  wb_motor_set_position(right_back_motor, inf);

if distance > 90 

     if  distance_F_L > 995 && distance_F_R > 995 
          orientace = 'foward';
     else          
           if distance_F_L < 995      
              orientace = 'right';
           elseif distance_F_R < 995  
              orientace = 'left';
           end
     end  
   
elseif distance < 90

 success = wb_camera_save_image(camera, 'foto.jpg', 1);
% barva foto  
x = imread('foto.jpg');
y = mean(mean(x));

if y(:,:,1) > y(:,:,2) && y(:,:,1) > y(:,:,3)
    barva = 1;
end

if y(:,:,2) > y(:,:,1) && y(:,:,2) > y(:,:,3)   
    barva = 2;
end

if y(:,:,3) > y(:,:,2) && y(:,:,3) > y(:,:,1)
    barva = 3; 
end
   
if y(:,:,3) == y(:,:,2) && y(:,:,3) == y(:,:,1) 
    barva = 4;  
end 

if barva == 1
wb_pen_set_ink_color(pen,[1 0 0], 1); 
s = 0;
while wb_robot_step(TIME_STEP) ~= -1 && s < time_to_turn_90
s = s + 0.064;

switch orientace
case 'foward'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'stop'
  wb_motor_set_velocity(left_front_motor, 0);
  wb_motor_set_velocity(right_front_motor, 0);
  wb_motor_set_velocity(left_back_motor, 0);
  wb_motor_set_velocity(right_back_motor, 0);

case 'right'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);

case 'left'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'back'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);
end

orientace = 'left';
end

if s > time_to_turn_90
clear s
end

elseif barva == 2
wb_pen_set_ink_color(pen,[0 1 0], 1); 
s = 0;
while wb_robot_step(TIME_STEP) ~= -1 && s < time_to_turn_180
s = s + 0.064;

switch orientace
case 'foward'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'stop'
  wb_motor_set_velocity(left_front_motor, 0);
  wb_motor_set_velocity(right_front_motor, 0);
  wb_motor_set_velocity(left_back_motor, 0);
  wb_motor_set_velocity(right_back_motor, 0);

case 'right'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);

case 'left'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'back'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);
end

orientace = 'right';
end

if s > time_to_turn_180
clear s
end

elseif barva == 3
wb_pen_set_ink_color(pen,[0 0 1], 1); 
s = 0;
while wb_robot_step(TIME_STEP) ~= -1 && s < inf
s = s + 0.064;

switch orientace
case 'foward'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'stop'
  wb_motor_set_velocity(left_front_motor, 0);
  wb_motor_set_velocity(right_front_motor, 0);
  wb_motor_set_velocity(left_back_motor, 0);
  wb_motor_set_velocity(right_back_motor, 0);

case 'right'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);

case 'left'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'back'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);
end

wb_console_print(sprintf ('nelze uniknout!\n'), WB_STDOUT);
disp('nelze uniknout!')
orientace = 'stop';
end

if s > inf
clear s
end

else
wb_pen_set_ink_color(pen,[1 1 1], 1); 
s = 0;
while wb_robot_step(TIME_STEP) ~= -1 && s < time_to_turn_90
s = s + 0.064;

switch orientace
case 'foward'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'stop'
  wb_motor_set_velocity(left_front_motor, 0);
  wb_motor_set_velocity(right_front_motor, 0);
  wb_motor_set_velocity(left_back_motor, 0);
  wb_motor_set_velocity(right_back_motor, 0);

case 'right'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);

case 'left'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'back'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);
end

orientace = 'right';
end

if s > time_to_turn_90
clear s
end
end
end

switch orientace
case 'foward'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'stop'
  wb_motor_set_velocity(left_front_motor, 0);
  wb_motor_set_velocity(right_front_motor, 0);
  wb_motor_set_velocity(left_back_motor, 0);
  wb_motor_set_velocity(right_back_motor, 0);

case 'right'
  wb_motor_set_velocity(left_front_motor, motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);

case 'left'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, motor_velocity);

case 'back'
  wb_motor_set_velocity(left_front_motor, -motor_velocity);
  wb_motor_set_velocity(right_front_motor, -motor_velocity);
  wb_motor_set_velocity(left_back_motor, -motor_velocity);
  wb_motor_set_velocity(right_back_motor, -motor_velocity);
end

end
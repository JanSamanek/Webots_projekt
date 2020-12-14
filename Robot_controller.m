
  TIME_STEP = 64;
%sensor settings  
  %l_sensor = wb_robot_get_device('light sensor');
  d_sensor = wb_robot_get_device('d_sensor');
  d_sensor_F_L = wb_robot_get_device('d_sensor_F_L');
  d_sensor_F_R = wb_robot_get_device('d_sensor_F_R');
  L_side_s = wb_robot_get_device('L_side_s');
  R_side_s = wb_robot_get_device('R_side_s');
  %camera = wb_robot_get_device('camera');
  camera = wb_robot_get_device('camera');
  head = wb_robot_get_device('twister');
 % pen = wb_robot_get_device('pen');

 % wb_light_sensor_enable(l_sensor, TIME_STEP);
  wb_distance_sensor_enable(d_sensor, TIME_STEP);
  wb_distance_sensor_enable(d_sensor_F_L, TIME_STEP);
  wb_distance_sensor_enable(d_sensor_F_R, TIME_STEP);
  wb_distance_sensor_enable(L_side_s, TIME_STEP);
  wb_distance_sensor_enable(R_side_s, TIME_STEP);
  %wb_camera_enable(camera, TIME_STEP);
  wb_camera_enable(camera, TIME_STEP);
  
  foto = 0;
  dira = 0;
 % k = 1;
   pohled = 'front';
  barva = 0

while wb_robot_step(TIME_STEP) ~= -1
   %write = true;
   %write = wb_pen_write(pen,write);
%sensor values
  %  data_l_sensor = wb_light_sensor_get_value(l_sensor);
    distance = wb_distance_sensor_get_value(d_sensor);
    distance_F_L = wb_distance_sensor_get_value(d_sensor_F_L);
    distance_F_R = wb_distance_sensor_get_value(d_sensor_F_R);
    distance_L_side = wb_distance_sensor_get_value(L_side_s);
    distance_R_side = wb_distance_sensor_get_value(R_side_s);

%motor settings
  left_front_motor = wb_robot_get_device('left_front_motor');
  right_front_motor = wb_robot_get_device('right_front_motor');
  left_back_motor = wb_robot_get_device('left_back_motor');
  right_back_motor = wb_robot_get_device('right_back_motor');
    
    
  wb_motor_set_position(left_front_motor, inf);
  wb_motor_set_position(right_front_motor, inf);
  wb_motor_set_position(left_back_motor, inf);
  wb_motor_set_position(right_back_motor, inf);
 



if dira == 0

dira = test(distance_L_side, distance_R_side)

smer = rizeni (distance, distance_F_L, distance_F_R, dira, barva)

orientace = smer;

else

if dira == 1 

 orientace = 'vlevo';
 dira = 0;

 elseif dira == 2
 orientace = 'vpravo';
 dira = 0;
 end
 
 if dira == 3
 dira = 0;
 end
  
end


 if foto == 0
        if distance < 120 && distance > 90
            success = wb_camera_save_image(camera, 'foto.jpg', 1);
            foto = 1;
            barva = barva_foto
        end
 end  

if foto == 1 && distance > 125
            foto = 0;
            pohled = 'front';
end

if foto == 1 && barva == 3
      pohled = 'rotation';
      
end

% orientation controler
switch orientace
case 'forward'
  wb_motor_set_velocity(left_front_motor, 5);
  wb_motor_set_velocity(right_front_motor, 5);
  wb_motor_set_velocity(left_back_motor, 5);
  wb_motor_set_velocity(right_back_motor, 5);

case 'stop'
  wb_motor_set_velocity(left_front_motor, 0);
  wb_motor_set_velocity(right_front_motor, 0);
  wb_motor_set_velocity(left_back_motor, 0);
  wb_motor_set_velocity(right_back_motor, 0);

case 'right'
  wb_motor_set_velocity(left_front_motor, 5);
  wb_motor_set_velocity(right_front_motor, -5);
  wb_motor_set_velocity(left_back_motor, 5);
  wb_motor_set_velocity(right_back_motor, -5);

case 'left'
  wb_motor_set_velocity(left_front_motor, -5);
  wb_motor_set_velocity(right_front_motor, 5);
  wb_motor_set_velocity(left_back_motor, -5);
  wb_motor_set_velocity(right_back_motor, 5);

case 'back'
  wb_motor_set_velocity(left_front_motor, -5);
  wb_motor_set_velocity(right_front_motor, -5);
  wb_motor_set_velocity(left_back_motor, -5);
  wb_motor_set_velocity(right_back_motor, -5);

case 'vpravo'
  wb_motor_set_velocity(left_front_motor, 10);
  wb_motor_set_velocity(right_front_motor, -2);
  wb_motor_set_velocity(left_back_motor, 10);
  wb_motor_set_velocity(right_back_motor, -2);
  
case 'vlevo'
  wb_motor_set_velocity(left_front_motor, -2);
  wb_motor_set_velocity(right_front_motor, 10);
  wb_motor_set_velocity(left_back_motor, -2);
  wb_motor_set_velocity(right_back_motor, 10);
end

switch pohled

case 'front'
   wb_motor_set_position(head, 0);
   wb_motor_set_velocity(head, 5);
 
case 'left'
   wb_motor_set_position(head, -3.14);
   wb_motor_set_velocity(head, 5);

case 'right'
   wb_motor_set_position(head, 3.14);
   wb_motor_set_velocity(head, 5);
 
case 'rotation'
   wb_motor_set_position(head, inf);
   wb_motor_set_velocity(head, 5);
   
end




end



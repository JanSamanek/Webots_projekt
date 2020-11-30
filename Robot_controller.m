
  TIME_STEP = 64;
%sensor settings  
  l_sensor = wb_robot_get_device('light sensor')
  d_sensor = wb_robot_get_device('d_sensor');
  d_sensor_F_L = wb_robot_get_device('d_sensor_F_L');
  d_sensor_F_R = wb_robot_get_device('d_sensor_F_R');

  wb_light_sensor_enable(l_sensor, TIME_STEP)
  wb_distance_sensor_enable(d_sensor, TIME_STEP);
  wb_distance_sensor_enable(d_sensor_F_L, TIME_STEP);
  wb_distance_sensor_enable(d_sensor_F_R, TIME_STEP);

while wb_robot_step(TIME_STEP) ~= -1

%sensor values
    data_l_sensor = wb_light_sensor_get_value(l_sensor)
    distance = wb_distance_sensor_get_value(d_sensor);
    distance_F_L = wb_distance_sensor_get_value(d_sensor_F_L);
    distance_F_R = wb_distance_sensor_get_value(d_sensor_F_R);
    
  %  wb_console_print(sprintf('%u\n',range), WB_STDOUT);
   % disp(distance)
    wb_console_print(sprintf('%u\n',distance), WB_STDOUT);
   % disp(distance_F_R)
    wb_console_print(sprintf('%u\n',distance_F_R), WB_STDOUT);
    %disp(distance_F_L)
    wb_console_print(sprintf('%u\n',distance_F_L), WB_STDOUT);
    
%motor settings
  left_front_motor = wb_robot_get_device('left_front_motor');
  right_front_motor = wb_robot_get_device('right_front_motor');
  left_back_motor = wb_robot_get_device('left_back_motor');
  right_back_motor = wb_robot_get_device('right_back_motor');
    
    
  wb_motor_set_position(left_front_motor, inf);
  wb_motor_set_position(right_front_motor, inf);
  wb_motor_set_position(left_back_motor, inf);
  wb_motor_set_position(right_back_motor, inf);

%main code  
  orientace = 'foward';


 if distance > 80 
      if  distance_F_L > 995 && distance_F_R > 995 
          orientace = 'foward';
       else          
           if distance_F_L < 995       
              orientace = 'right';
           elseif distance_F_R < 995  
              orientace = 'left';
           end
      end      
  else
   orientace = 'right';   
  end

% orientation controler
switch orientace
case 'foward'
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
end

end



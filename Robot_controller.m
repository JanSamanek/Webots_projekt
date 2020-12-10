
  TIME_STEP = 64;
%sensor settings  
  l_sensor = wb_robot_get_device('light sensor');
  d_sensor = wb_robot_get_device('d_sensor');
  d_sensor_F_L = wb_robot_get_device('d_sensor_F_L');
  d_sensor_F_R = wb_robot_get_device('d_sensor_F_R');
  L_side_s = wb_robot_get_device('L_side_s');
  R_side_s = wb_robot_get_device('R_side_s');
  %camera = wb_robot_get_device('camera');
  camera = wb_robot_get_device('camera');
  head = wb_robot_get_device('twister');
 % pen = wb_robot_get_device('pen');

  wb_light_sensor_enable(l_sensor, TIME_STEP);
  wb_distance_sensor_enable(d_sensor, TIME_STEP);
  wb_distance_sensor_enable(d_sensor_F_L, TIME_STEP);
  wb_distance_sensor_enable(d_sensor_F_R, TIME_STEP);
  wb_distance_sensor_enable(L_side_s, TIME_STEP);
  wb_distance_sensor_enable(R_side_s, TIME_STEP);
  %wb_camera_enable(camera, TIME_STEP);
  wb_camera_enable(camera, TIME_STEP);
  
  foto = 0;

while wb_robot_step(TIME_STEP) ~= -1
   %write = true;
   %write = wb_pen_write(pen,write);
%sensor values
    data_l_sensor = wb_light_sensor_get_value(l_sensor);
    distance = wb_distance_sensor_get_value(d_sensor);
    distance_F_L = wb_distance_sensor_get_value(d_sensor_F_L);
    distance_F_R = wb_distance_sensor_get_value(d_sensor_F_R);
    distance_L_side = wb_distance_sensor_get_value(L_side_s);
    distance_R_side = wb_distance_sensor_get_value(R_side_s);
    
  %  wb_console_print(sprintf('%u\n',range), WB_STDOUT);
   % disp(distance)
    wb_console_print(sprintf('%u\n',distance), WB_STDOUT);
   % disp(distance_F_R)
    wb_console_print(sprintf('%u\n',distance_F_R), WB_STDOUT);
    %disp(distance_F_L)
    wb_console_print(sprintf('%u\n',distance_F_L), WB_STDOUT);
    wb_console_print(sprintf('%u\n',data_l_sensor), WB_STDOUT);
    
%motor settings
  left_front_motor = wb_robot_get_device('left_front_motor');
  right_front_motor = wb_robot_get_device('right_front_motor');
  left_back_motor = wb_robot_get_device('left_back_motor');
  right_back_motor = wb_robot_get_device('right_back_motor');
    
    
  wb_motor_set_position(left_front_motor, inf);
  wb_motor_set_position(right_front_motor, inf);
  wb_motor_set_position(left_back_motor, inf);
  wb_motor_set_position(right_back_motor, inf);
 
 pohled = 'front';


if foto == 0  

success = wb_camera_save_image(CAM, 'foto.jpg', 1);
foto = 1;
end

shoda = compare_picture
if shoda == 0
  orientace = 'left';
  else

 orientace = 'forward';
end
%wb_console_print(sprintf('%u\n',smer), WB_STDOUT);


%pohled = 'front' ;

%if L_side_s < 995

%orientace = 'forward';   

%else
 % orientace = 'stop';
%  pohled = 'left';
  
%else
 % smer = rizeni (distance, distance_F_L, distance_F_R, distance_L_side)

  %orientace = smer;
  
 % pohled = 'forward';
 %end
 
  % wb_distance_sensor_enable(L_side_s, TIME_STEP);
 
 



%dira = test_leva(distance_L_side)

%if dira == 1
%pohled = 'rotation';
 %if distance > 55 && distance_F_L > 995 
% && distance < 75
        
  %      orientace = 'vlevo';
       % orientace = smer;
  %     else 
    %   orientace = 'stop';
  %     smer = rizeni_02 (distance, distance_F_L, distance_F_R)

%  orientace = smer;
 % pohled = 'front';
       
  %  end

%else
%smer = rizeni (distance, distance_F_L, distance_F_R)

 % orientace = smer;
 % pohled = 'front';
%end
  
    

  


% 
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
  wb_motor_set_velocity(left_front_motor, 5);
  wb_motor_set_velocity(right_front_motor, 1);
  wb_motor_set_velocity(left_back_motor, 5);
  wb_motor_set_velocity(right_back_motor, 1);
  
case 'vlevo'
  wb_motor_set_velocity(left_front_motor, 1);
  wb_motor_set_velocity(right_front_motor, 5);
  wb_motor_set_velocity(left_back_motor, 1);
  wb_motor_set_velocity(right_back_motor, 5);
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



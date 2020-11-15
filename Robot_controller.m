% MATLAB controller for Webots
% File:          my_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
% % get the motors and set target position to infinity (speed control)

%left_front_motor = wb_robot_get_device('left_front_motor');
%right_front_motor = wb_robot_get_device('right_front_motor');
%left_back_motor = wb_robot_get_device('left_back_motor');
%right_back_motor = wb_robot_get_device('right_back_motor');

d_sensor = wb_robot_get_device('d_sensor');

d_sensor_F_L = wb_robot_get_device('d_sensor_F_L')
d_sensor_F_R = wb_robot_get_device('d_sensor_F_R')


%wb_motor_set_position(left_front_motor, inf);
%wb_motor_set_velocity(left_front_motor, 5);

%wb_motor_set_position(right_front_motor, inf);
%wb_motor_set_velocity(right_front_motor, 5);

%wb_motor_set_position(left_back_motor, inf);
%wb_motor_set_velocity(left_back_motor, 5);

%wb_motor_set_position(right_back_motor, inf);
%wb_motor_set_velocity(right_back_motor, 5);

wb_distance_sensor_enable(d_sensor, TIME_STEP);
wb_distance_sensor_enable(d_sensor_F_L, TIME_STEP);
wb_distance_sensor_enable(d_sensor_F_R, TIME_STEP);
% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination

while wb_robot_step(TIME_STEP) ~= -1

    distance = wb_distance_sensor_get_value(d_sensor);
    distance_F_L = wb_distance_sensor_get_value(d_sensor_F_L);
    distance_F_R = wb_distance_sensor_get_value(d_sensor_F_R);

    disp(distance)
    wb_console_print(sprintf('%u\n',distance), WB_STDOUT);
    disp(distance_F_R)
    wb_console_print(sprintf('%u\n',distance_F_R), WB_STDOUT);


     if distance > 80
     
      
       
      
      
      if  distance_F_L > 995
        
           vpred
        else
       
              right
        end     
               
      else
          
             right
             
       end
       
      %  if  distance_F_R > 950
      
      %  vpred
        
      % else
         
          %     left
   
     %  end
      
        
  % read the sensors, e.g.:
  
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.

function vpred
left_front_motor = wb_robot_get_device('left_front_motor');
right_front_motor = wb_robot_get_device('right_front_motor');
left_back_motor = wb_robot_get_device('left_back_motor');
right_back_motor = wb_robot_get_device('right_back_motor');

  wb_motor_set_position(left_front_motor, inf);
  wb_motor_set_velocity(left_front_motor, 5);

  wb_motor_set_position(right_front_motor, inf);
  wb_motor_set_velocity(right_front_motor, 5);

  wb_motor_set_position(left_back_motor, inf);
  wb_motor_set_velocity(left_back_motor, 5);

  wb_motor_set_position(right_back_motor, inf);
  wb_motor_set_velocity(right_back_motor, 5);
end

function stop
left_front_motor = wb_robot_get_device('left_front_motor');
right_front_motor = wb_robot_get_device('right_front_motor');
left_back_motor = wb_robot_get_device('left_back_motor');
right_back_motor = wb_robot_get_device('right_back_motor');

  wb_motor_set_position(left_front_motor, inf);
  wb_motor_set_velocity(left_front_motor, 0);

  wb_motor_set_position(right_front_motor, inf);
  wb_motor_set_velocity(right_front_motor, 0);

  wb_motor_set_position(left_back_motor, inf);
  wb_motor_set_velocity(left_back_motor, 0);

  wb_motor_set_position(right_back_motor, inf);
  wb_motor_set_velocity(right_back_motor, 0);
end


function right
left_front_motor = wb_robot_get_device('left_front_motor');
right_front_motor = wb_robot_get_device('right_front_motor');
left_back_motor = wb_robot_get_device('left_back_motor');
right_back_motor = wb_robot_get_device('right_back_motor');

  wb_motor_set_position(left_front_motor, inf);
  wb_motor_set_velocity(left_front_motor, 5);

  wb_motor_set_position(right_front_motor, inf);
  wb_motor_set_velocity(right_front_motor, -5);

  wb_motor_set_position(left_back_motor, inf);
  wb_motor_set_velocity(left_back_motor, 5);

  wb_motor_set_position(right_back_motor, inf);
  wb_motor_set_velocity(right_back_motor, -5);
end


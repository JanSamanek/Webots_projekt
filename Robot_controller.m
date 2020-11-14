% MATLAB controller for Webots
% File:          Robot_controller.m
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

left_front_motor = wb_robot_get_device('left_front_motor');
right_front_motor = wb_robot_get_device('right_front_motor');
left_back_motor = wb_robot_get_device('left_back_motor');
right_back_motor = wb_robot_get_device('right_back_motor');


wb_motor_set_position(left_front_motor, inf);
wb_motor_set_velocity(left_front_motor, 1);

wb_motor_set_position(right_front_motor, inf);
wb_motor_set_velocity(right_front_motor, 1);

wb_motor_set_position(left_back_motor, inf);
wb_motor_set_velocity(left_back_motor, 1);

wb_motor_set_position(right_back_motor, inf);
wb_motor_set_velocity(right_back_motor, 1);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination

while wb_robot_step(TIME_STEP) ~= -1


  % read the sensors, e.g.:
  
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.

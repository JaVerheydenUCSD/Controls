clear all, close all, clc

m1 = 1;     % mass of first pendulum
m2 = 1;     % mass of second pendulum
M = 5;      % mass of cart
L1 = 2;     % length of first pendulum
L2 = 1;     % length of second pendulum
g = -10;    % gravitational constant
d = 1;      % damping factor

% y = [x; xdot; theta1; theta1dot; theta2; theta2dot];
A = [0 1 0 0 0 0;
    0 -d/M -m1*g/M 0 0 0;
    0 0 0 1 0 0;
    0 0 -(m1+m2)*g/(M+ m1*(L1^2) + m2*(L1^2+L2^2+2*L1*L2*cos(y(5)))) 0 0 0;
    0 0 0 0 0 1;
    0 0 -m2*L1*L2*sin(y(5))*y(6)/(M*L1 + m1*(L1^2) + m2*(L1^2+L2
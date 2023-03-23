function dy = dpencart(y, m1, m2, M, L1, L2, g, d, u)

% Unpack state variables
x = y(1);
xdot = y(2);
theta1 = y(3);
theta1dot = y(4);
theta2 = y(5);
theta2dot = y(6);

% Precompute trigonometric terms
s1 = sin(theta1);
c1 = cos(theta1);
s2 = sin(theta2);
c2 = cos(theta2);
s12 = sin(theta1 + theta2);
c12 = cos(theta1 + theta2);

% Compute the denominator of the equations of motion
denom1 = m1*L1^2 + m2*(L1^2 + L2^2 + 2*L1*L2*c2) + M;
denom2 = L1*L2*m2*c2 + L1^2*(m1 + m2) + M*L1;

% Compute the equations of motion
dy(1,1) = xdot;
dy(2,1) = (1/denom1)*(-m1^2*L1*g*c1*s1 - m2^2*L2*g*(s1*s12 + c1*c12*s2) - m2*L1*L2*m1*c2*theta1dot^2*s2 ...
    - (m1+m2)*d*xdot - m2*L1*L2*theta2dot^2*s2*c12 + u);
dy(3,1) = theta1dot;
dy(4,1) = (1/denom1)*((m1+m2)g*L1*s1 + m2*L2*L1*theta2dot^2*s2*c12 + (m1+m2)*d*xdot*c1 ...
- m2*L1*L2*theta1dot^2*s2 - m2*g*L2*s1*s12);
dy(5,1) = theta2dot;
dy(6,1) = (1/denom2)*(-m2*L1*L2*theta1dot^2*s2*c12 - m2*g*L2*s12 - m2*d*xdot*c2 ...
+ m2*g*L1*s1*c12 + m2*L1*L2*theta2dot^2*s2 - m2*d*theta1dot*s2*c2);

% Add control input
dy(1,1) = dy(1,1) + u;
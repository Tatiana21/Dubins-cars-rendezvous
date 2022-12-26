function [ J ] = costfn( t, R, v, Cx, Cy, x0, y0)
%Cost function for Dubins car
%   
theta = v*t/R;
L_T = sqrt((R*cos(theta) - Cx)^2 + (R*sin(theta) - Cy)^2 - R^2);
d = sqrt((R*cos(theta) - Cx)^2 + (R*sin(theta) - Cy)^2);
alpha = acos(R/d);
ax = R/d*((R*cos(theta) - Cx)*cos(alpha) + (R*sin(theta) - Cy)*sin(alpha)) + Cx;
ay = R/d*(-(R*cos(theta) - Cx)*sin(alpha) + (R*sin(theta) - Cy)*cos(alpha)) + Cy;
phi = R*acos(1/R^2*((ax - Cx)*(x0 - Cx) + (ay - Cy)*(y0 - Cy)));

J = R*phi + L_T;
end


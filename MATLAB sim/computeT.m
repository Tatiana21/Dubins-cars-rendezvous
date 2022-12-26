theta2 = pi;
theta3 = 0;
x1 = 0;
y1 = 0;
x2 = 30;
y2 = -20;
x3 = 40;
y3 = 50;
v = 1;
u = 0.2;

x1_t = @(t1,T) x1 + (v/u)*(sin(u*t1) + u*cos(u*t1)*(T - t1));
y1_t = @(t1,T) y1 + (v/u)*(1-cos(u*t1)) + v*sin(u*t1)*(T - t1);
x2_t = @(t2,T) x2 + (v/u)*(sin(u*t2 + theta2) + u*cos(u*t2 + theta2)*(T - t2) - sin(theta2));
y2_t = @(t2,T) y2 + (v/u)*(cos(theta2) - cos(u*t2 + theta2) + u*sin(u*t2 + theta2)*(T - t2));
x3_t = @(t3,T) x3 + (v/u)*(sin(u*t3 + theta3) + u*cos(u*t3 + theta3)*(T - t3) - sin(theta3));
y3_t = @(t3,T) y3 + (v/u)*(cos(theta3) - cos(u*t3 + theta3) + u*sin(u*t3 + theta3)*(T - t3));
% fun = @(t1,t2,t3,p1,p2,T) (x1_t(t1,T) - p1)^2 + (x2_t(t2,T) - p1)^2 + (x3_t(t3,T) - p1)^2 ...
%     + (y1_t(t1,T) - p2)^2 + (y2_t(t2,T) - p2)^2 + (y3_t(t3,T) - p2)^2;
% fun = @(x) (x1_t(x(1),x(6)) - x(4))^2 + (x2_t(x(2),x(6)) - x(4))^2 + (x3_t(x(3),x(6)) - x(4))^2 ...
%         + (y1_t(x(1),x(6)) - x(5))^2 + (y2_t(x(2),x(6)) - x(5))^2 + (y3_t(x(4),x(6)) - x(5))^2;
fun = @(x) [x1_t(x(1),x(6)) - x(4); x2_t(x(2),x(6)) - x(4);x3_t(x(3),x(6)) - x(4);y1_t(x(1),x(6)) - x(5);y2_t(x(2),x(6)) - x(5); y3_t(x(4),x(6)) - x(5)];
LB = [0,0,0,-inf,-inf,0];
UB = [2*pi/u,2*pi/u,2*pi/u,inf,inf,inf];
x0 = [0,0,0,(x1+x2+x3)/3,(y1+y2+y3)/3,0];
% options = optimoptions('fmincon','Display','iter','Algorithm','active-set');
% x_sol = fmincon(fun,x0,[],[],[],[],LB,UB,[],options);
options = optimoptions('lsqnonlin','Display','iter');
x_sol = lsqnonlin(fun,x0,LB,UB,options);
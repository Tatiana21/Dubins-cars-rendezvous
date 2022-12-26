T = 60;
v = 1;
u = 0.2;
theta0 = pi/4;
n_pts = 200;
x_origin = 10;
y_origin = 10;
figure;hold on
u_array = [u -u];
for u in u_array:
x_array = [];
y_array = [];
for t1 = 0:n_pts/2
    t1 = abs(t1*2*pi/u/n_pts);
    l_t = v*(T-t1);
    x1 = abs((v/u))*(sin(u*t1 + theta0) - sin(theta0));
    y1 = abs((v/u))*(cos(theta0) - cos(u*t1 + theta0));

    x2 = x1 - l_t*sin(u*t1 + theta0) + x_origin;
    y2 = y1 + l_t*cos(u*t1 + theta0) + y_origin;
    
    x_array = [x_array x2];
    y_array = [y_array y2];
    
end
plot(x_array,y_array,'*');hold on
x_array2 = [];
y_array2 = [];
for t1 = 0:n_pts/2
    t1 = abs(t1*2*pi/u/n_pts);
    l_t = v*(T-t1);
    x1 = (v/u)*sin(-u*t1 + theta0) - (v/u)*sin(theta0);
    y1 = (v/u)*(cos(theta0) - cos(-u*t1 + theta0));

    x2 = x1 - l_t*sin(-u*t1 + theta0) + x_origin;
    y2 = y1 + l_t*cos(-u*t1 + theta0) + y_origin;
    x_array2 = [x_array2 x2];
    y_array2 = [y_array2 y2];
end
plot(x_array2,y_array2,'*');hold on
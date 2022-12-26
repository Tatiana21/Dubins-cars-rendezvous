% Simulation of Dubin's car to reach origin from any point following the
% control law
x_t = 10;
y_t = 10;
theta_t = 30*pi/180;
delta_t = 0.01;
t = 0;
um = 0.2;
v = 1;
u_t = 0;
figure;hold on
while sqrt(x_t^2 + y_t^2)> v*delta_t
    u_t = calc_u(theta_t, x_t, y_t, delta_t, um);
    
    theta_t = u_t*delta_t + theta_t;
    
    x_t_plus_delta_t = x_t + v*cos(theta_t)*delta_t;
    y_t_plus_delta_t = y_t + v*sin(theta_t)*delta_t;
    
    t = t + delta_t;
    plot(x_t,y_t,'.');hold on
    x_t = x_t_plus_delta_t;
    y_t = y_t_plus_delta_t;
    
    if t>40
        break;
    end
end
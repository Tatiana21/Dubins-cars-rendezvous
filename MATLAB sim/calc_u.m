function [ u_t] = calc_u( theta_t, x_t, y_t, delta_t, um)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if abs(abs(theta_t - atan(y_t/x_t)) - pi)< um*delta_t % think of third and fourth quadrant
    u_t = 0;
else if theta_t - atan(y_t/x_t)< 0
        u_t = -1*um;
    else
        u_t = um;
    end
end

end


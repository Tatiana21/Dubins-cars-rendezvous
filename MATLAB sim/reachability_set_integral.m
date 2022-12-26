% reachability set by CL and CC trajectories by integrating the equations
T = 32;
v = 1;
u = 0.2;
theta0 = pi/2;
n_pts = 200;
delta_t = T/200;
x_t = @(t1,t2,T) (v/u)*(sin(u*t1 + theta0) - sin(theta0) + u*cos(u*t1 + theta0)*(t2 - t1)... 
            - sin(-u*(T - t2) + u*t1 + theta0) + sin(u*t1 + theta0));
y_t = @(t1,t2,T) (v/u)*(cos(theta0)-cos(u*t1 + theta0)) + v*sin(u*t1 + theta0)*(t2 - t1)...
            + (v/u)*(-cos(u*t1 + theta0)+cos(-u*(T - t2) + u*t1 + theta0));

x_array = zeros(T/delta_t +1,ceil(min(T,2*pi/u)/(2*pi/u/n_pts)+1));
y_array = zeros(T/delta_t +1,ceil(min(T,2*pi/u)/(2*pi/u/n_pts)+1));
x_array2 = zeros(T/delta_t +1,ceil(min(T,2*pi/u)/(2*pi/u/n_pts)+1));
y_array2 = zeros(T/delta_t +1,ceil(min(T,2*pi/u)/(2*pi/u/n_pts)+1));
x1 = [];
y1 = [];
t1Index = 1;
figure;hold on

for t1 = 0:2*pi/u/n_pts:min(T,2*pi/u)
    n = 0;
    m = 1;
    while n*delta_t < t1
        x_t1 = x_t(n*delta_t,n*delta_t, n*delta_t);
        y_t1 = y_t(n*delta_t,n*delta_t,n*delta_t);
        x_array(m, t1Index) = x_t1;
        y_array(m, t1Index) = y_t1;
        n = n+1;
        m = m+1;
     end
    n = 0;
     while t1 + n*delta_t < T
        x_t1 = x_t(t1,t1,t1 + n*delta_t);
        y_t1 = y_t(t1,t1,t1 + n*delta_t);
        x_array(m, t1Index) = x_t1;
        y_array(m, t1Index) = y_t1;
        
        x_t1 = x_t(t1,t1 + n*delta_t,t1 + n*delta_t);
        y_t1 = y_t(t1,t1 + n*delta_t,t1 + n*delta_t);
        x_array2(m, t1Index) = x_t1;
        y_array2(m, t1Index) = y_t1;
        
        n = n+1;
        m = m+1;
     end
    x1 = [x1 (v/u)*(sin(u*t1 + theta0) - sin(theta0))];
    y1 = [y1 (v/u)*(cos(theta0)-cos(u*t1 + theta0))];
    t1Index = t1Index + 1;

end
m = tan(theta0);
x_array11 = x_array*(1-m^2)/(1+m^2)+y_array*2*m/(1+m^2);%RL
y_array11 = y_array*(m^2-1)/(1+m^2)+x_array*2*m/(1+m^2);
x_array21 = x_array2*(1-m^2)/(1+m^2)+y_array2*2*m/(1+m^2);%RS
y_array21 = y_array2*(m^2-1)/(1+m^2)+x_array2*2*m/(1+m^2);

set(gcf, 'Position', get(0, 'Screensize'));
set(gca,'XLim',[-5.5/u 5.5/u],'YLim',[-5.5/u 5.5/u]);
pbaspect([1 1 1]);
grid on;
for i = 1:size(x_array,1)
%     plot(x_array(i,1:min(3*i,size(x_array,2))),y_array(i,1:min(3*i,size(x_array,2))),'b*');
%     hold on;
%     plot(x_array11(i,1:min(3*i,size(x_array,2))),y_array11(i,1:min(3*i,size(x_array,2))),'b*');
%     hold on;
    plot(x_array2(i,1:min(3*i,size(x_array,2))),y_array2(i,1:min(3*i,size(x_array,2))),'r*');
    hold on;
    plot(x_array21(i,1:min(3*i,size(x_array,2))),y_array21(i,1:min(3*i,size(x_array,2))),'r*');
%     drawnow
end
title(['T =' num2str(T)])
% reachability set by CL and CC trajectories by integrating the equations
T = 6.7; %total time
v = 1;  %speed
u = 0.2;%Radius constraint
a = 0.5;
b = 0.5;
% d = 9;
x2 = - 5;

y2 = -2;
R = v/u;
theta1 = a*pi;
theta2 = b*pi;
n_pts = 100;
delta_t = T/200;
x_t = @(t1,t2,T) (v/u)*(sin(u*t1 + theta1) - sin(theta1) + u*cos(u*t1 + theta1)*(t2 - t1)... 
            - sin(-u*(T - t2) + u*t1 + theta1) + sin(u*t1 + theta1));
y_t = @(t1,t2,T) (v/u)*(cos(theta1)-cos(u*t1 + theta1)) + v*sin(u*t1 + theta1)*(t2 - t1)...
            + (v/u)*(-cos(u*t1 + theta1)+cos(-u*(T - t2) + u*t1 + theta1));

x_array = zeros(T/delta_t +1,ceil(min(T,2*pi/u)/(2*pi/u/n_pts)+1));
y_array = zeros(T/delta_t +1,ceil(min(T,2*pi/u)/(2*pi/u/n_pts)+1));
x_array2 = zeros(T/delta_t +1,ceil(min(T,2*pi/u)/(2*pi/u/n_pts)+1));
y_array2 = zeros(T/delta_t +1,ceil(min(T,2*pi/u)/(2*pi/u/n_pts)+1));

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
        x_array(m, t1Index) = x_t1;%LR
        y_array(m, t1Index) = y_t1;
        
        x_t1 = x_t(t1,t1 + n*delta_t,t1 + n*delta_t);
        y_t1 = y_t(t1,t1 + n*delta_t,t1 + n*delta_t);
        x_array2(m, t1Index) = x_t1;%LS
        y_array2(m, t1Index) = y_t1;
        
        n = n+1;
        m = m+1;
     end
    t1Index = t1Index + 1;
end
m = tan(theta1);
x_array11 = x_array*(1-m^2)/(1+m^2)+y_array*2*m/(1+m^2);%RL
y_array11 = y_array*(m^2-1)/(1+m^2)+x_array*2*m/(1+m^2);
x_array21 = x_array2*(1-m^2)/(1+m^2)+y_array2*2*m/(1+m^2);%RS
y_array21 = y_array2*(m^2-1)/(1+m^2)+x_array2*2*m/(1+m^2);
x_array3 = (x_array*cos(theta2 - theta1) + x2) - y_array*sin(theta2 - theta1);
y_array3 = x_array*sin(theta2 - theta1) + (y_array*cos(theta2 - theta1) + y2);
x_array4 = (x_array2*cos(theta2 - theta1) + x2) - y_array2*sin(theta2 - theta1);
y_array4 = x_array2*sin(theta2 - theta1) + (y_array2*cos(theta2 - theta1) + y2);
x_array31 = (x_array11*cos(theta2 - theta1) + x2) - y_array11*sin(theta2 - theta1);
y_array31 = x_array11*sin(theta2 - theta1) + (y_array11*cos(theta2 - theta1) + y2);
x_array41 = (x_array21*cos(theta2 - theta1) + x2) - y_array21*sin(theta2 - theta1);
y_array41 = x_array21*sin(theta2 - theta1) + (y_array21*cos(theta2 - theta1) + y2);


set(gcf, 'Position', get(0, 'Screensize'));
set(gca,'XLim',[-2.2/u 2/u],'YLim',[-0.2/u 4/u]);
pbaspect([1 1 1]);
grid on;
% hold on

%r1 = v*u*T*T;
c11x = R*cos(theta1 + pi/2);
c11y = R*sin(theta1 + pi/2);%c1y = v*T - r1;
c12x = -R*cos(theta1 + pi/2);
c12y = -R*sin(theta1 + pi/2);
c21x = R*cos(theta2 + pi/2) + x2;
c21y = R*sin(theta2 + pi/2) + y2;
c22x = -R*cos(theta2 + pi/2) + x2;
c22y = -R*sin(theta2 + pi/2) + y2;

th = 0:pi/50:2*pi;
xunit11 = R * cos(th) + c11x;
yunit11 = R * sin(th) + c11y;
xunit12 = R * cos(th) + c12x;
yunit12 = R * sin(th) + c12y;
xunit21 = R * cos(th) + c21x;
yunit21 = R * sin(th) + c21y;
xunit22 = R * cos(th) + c22x;
yunit22 = R * sin(th) + c22y;
h11 = plot(xunit11, yunit11);
h12 = plot(xunit12, yunit12);
h21 = plot(xunit21, yunit21);
h22 = plot(xunit22, yunit22);
% hold off
for i = 1:size(x_array,1)
%     plot(x_array(i,1:min(3*i,size(x_array,2))),y_array(i,1:min(3*i,size(x_array,2))),'b*');
%     hold on;
%     plot(x_array11(i,1:min(3*i,size(x_array,2))),y_array11(i,1:min(3*i,size(x_array,2))),'b*');
%     hold on;
    plot(x_array2(i,1:min(3*i,size(x_array,2))),y_array2(i,1:min(3*i,size(x_array,2))),'r*');
    hold on;
    plot(x_array21(i,1:min(3*i,size(x_array,2))),y_array21(i,1:min(3*i,size(x_array,2))),'g*');
    hold on;
%     plot(x_array3(i,1:min(3*i,size(x_array,2))),y_array3(i,1:min(3*i,size(x_array,2))),'b*');
%     hold on;
%     plot(x_array31(i,1:min(3*i,size(x_array,2))),y_array31(i,1:min(3*i,size(x_array,2))),'b*');
%     hold on;
    plot(x_array4(i,1:min(3*i,size(x_array,2))),y_array4(i,1:min(3*i,size(x_array,2))),'r*');
    hold on;
    plot(x_array41(i,1:min(3*i,size(x_array,2))),y_array41(i,1:min(3*i,size(x_array,2))),'g*');
    drawnow
end
title(['Plot with \alpha =' num2str(a) '\pi, \beta =' num2str(b) '\pi and d =' num2str(x2) 'R'])

u = 1/5;
v = 1;
a = pi/u;
x1_t = @(t1,T) (v/u)*(sin(u*t1) + u*cos(u*t1)*(T - t1));
y1_t = @(t1,T)(v/u)*(1-cos(u*t1)) + v*sin(u*t1)*(T - t1);
% t1 = [0.1*a; 0.2*a; 0.25*a; 0.3*a; 0.35*a; 0.4*a; 0.5*a; 0.75*a; a; 1.5*a];
% T = [1.5*a; 1.75*a; 1.8*a; 2*a; 2.3*a; 2.5*a; 2.7*a; 3*a; 3.2*a; 3.5*a];
t1 = [0.1*a; 0.25*a; 0.3*a; 0.4*a; 0.75*a; a; 1.25*a; 1.5*a; 1.75*a; 1.9*a];
T = [0.25*a; 0.5*a; a; 1.5*a; 2*a; 2.5*a; 2.7*a; 3*a; 3.5*a; 3.7*a];
z = zeros(10,10);
for i = 1:size(t1,1)
    for j = 1:size(T,1)
        z_x(i)
        z_y(i,j) = y1_t(t1(i),T(j));
    end
end
% surf(t1,T,z);
x = repmat(t1,10,1);
y = repelem(T,10);
scatter3(x,y,z(:))
test_t1 = [0.15*a; 0.23*a; 0.33*a; 0.45*a; 0.55*a];
test_T = [1.45*a; 1.7*a; 1.9*a; 2.9*a; 3.1*a];
test_z = zeros(5,5);
% test_z_fit = zeros(5,5);
%  p00 =       69.25;
%  p10 =       3.604;
%  p01 =      -2.155;
%  p20 =    -0.01752;
%  p11 =    -0.07527;
%  p02 =     0.01297;
% f = @(x,y) p00 + p10*x + p01*y + p20*x^2 + p11*x*y + p02*y^2;
for i = 1:size(test_t1,1)
    for j = 1:size(test_T,1)
%         test_z_fit(i,j) = f(test_t1(i),test_T(j));
        test_z(i,j) = y1_t(test_t1(i),test_T(j));
    end
end

% rmse = sum((test_z - test_z_fit).^2);
x0 = 10;
y0 = 10;
v = 1;
um = 0.2;
theta0 = 60*pi/180;
x1 = 0;
y1 = 0;

r = 1/um;
if (theta0 - atan(y0/x0))<0
    um = -1*um;
end

cx = x0 - sin(theta0)/um;
cy = y0 + (1/um)*cos(theta0);

X1 = x1 - cx;
Y1 = y1 - cy;
A = X1^2 + Y1^2;
B = -2*(r^2)*X1;
C = r^4 - (r^2)*(Y1^2);
a1 = cx + (-B + sqrt(B^2 - 4*A*C))/(2*A);
b1 = cy + (r^2 - (a1-cx)*X1)/Y1;
a2 = cx + (-B - sqrt(B^2 - 4*A*C))/(2*A);
b2 = cy + (r^2 - (a2-cx)*X1)/Y1;

if dot(cross([a1-cx b1-cy 0],[x1-a1 y1-b1 0]), [0 0 um])>0
    a = a1;
    b = b1;
else
    a = a2;
    b = b2;
end
alpha = atan(b/a);
length = r*(pi - theta0 + alpha)/180 + sqrt(a^2 + b^2);



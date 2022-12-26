function l_cc  = CC_length( x, y, r)
%Function t calculate length of CC trajectory for a point in the right
%circle
if (y>=0)&&(x>=r)
    theta = atan(y/(x-r));
elseif (y<0)&&(x>=r)
    theta = 2*pi + atan(y/(x-r));
elseif x<r
    theta = pi + atan(y/(x-r));
end
x = sqrt((x-r)^2 + y^2);
d = x*sin(theta);
c = r + x*cos(theta);
w = sqrt((c + r)^2 + d^2);
phi = atan(-d/(c + r));
a_dash = (w^2 + 3*r^2)/2/w;
b_dash = sqrt(4*r^2 - a_dash^2);
a = a_dash*cos(-phi) - b_dash*sin(-phi) - r;
b = b_dash*cos(-phi) + a_dash*sin(-phi);

l_cc = r*(2*pi - acos(5/4 - (w/2/r)^2) + acos((a + r)/2/r));
end


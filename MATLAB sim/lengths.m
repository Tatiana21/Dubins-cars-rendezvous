% Compare CC and Cl within circle of minimum radius
clear all;
r = 5;
i = 1;
l_cc = zeros(31,81);
l_cl = zeros(31,81);
mat = zeros(31,81);
for x = 0:r/30:r
    j = 1;
    for theta = 0:pi/40:2*pi
        d = x*sin(theta);
        c = r + x*cos(theta);
        w = sqrt((c + r)^2 + d^2);
        phi = atan(-d/(c + r));
        a_dash = (w^2 + 3*r^2)/2/w;
        b_dash = sqrt(4*r^2 - a_dash^2);
        a = a_dash*cos(-phi) - b_dash*sin(-phi) - r;
        b = b_dash*cos(-phi) + a_dash*sin(-phi);

        l_cc(i,j) = r*(2*pi - acos(5/4 - (w/2/r)^2) + acos((a + r)/2/r));

        h = sqrt(w^2 - r^2);
        l_cl(i,j) = h + r*(2*pi + sign(d)*acos((c + r)/w) - acos(r/w));
        
        j = j+1;
    end
    i = i+1;
end

for i = 1:21
    for j = 1:41
        if l_cc(i,j)>= l_cl(i,j)
        mat(i,j)=1;
        else
        mat(i,j)=0;
        end
    end
end
T = 16;%[2 4 8];
u = 0.2;
v = 1;
R3 = [];
R = @(t,T) v*u*(T-t)^2*(cos(u*t)^4 + sin(u*t)^4)^1.5...
        /abs(u*(T-t)*sin(u*t)*cos(u*t)*(sin(u*t) + cos(u*t)) + cos(u*t)^3 - sin(u*t)^3);
for t = 0:T/80:T
    R3 = [R3 R(t,T)];
end
t = 0:T/80:T;
figure; plot(t,R3);
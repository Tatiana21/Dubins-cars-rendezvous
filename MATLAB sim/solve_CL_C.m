R = 5;
v = 1;
Cx = 0;
Cy = -2;
%T = pi*6/8*R/v;
x0 = Cx - R;
y0 = Cy;

J = @(t)costfn( t, R, v, Cx, Cy, x0, y0);

t0 = 0;
LB = 0;
UB = 2*pi/v;
C = @(t)(t - costfn( t, R, v, Cx, Cy, x0, y0));
Ceq = [];
NONLCON = [C,Ceq];
options = optimoptions('fmincon','Display','iter','Algorithm','active-set');
x_sol = fmincon(J,t0,[],[],[],[],LB,UB,@NONLCON,options);
function [C,Ceq] = nonlnfn(R, v, Cx, Cy, x0, y0)
C = @(t)(t - costfn( t, R, v, Cx, Cy, x0, y0));
Ceq = [];
%% Eulers Method
f = @(x,y) y+2*x-1;
yInitial = 1;
step = 0.001;
upperBound = 1;
EulersMethod(yInitial, step, upperBound, f)

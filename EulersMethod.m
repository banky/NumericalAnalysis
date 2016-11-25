function [ yInitial ] = EulersMethod( yInitial,step,upperBound,func )
% Uses Euler's forward method to solve a differential equation
% func is a function handle
    for i=0:step:(upperBound-step)
        yInitial = yInitial + step*func(i,yInitial);
    end
end


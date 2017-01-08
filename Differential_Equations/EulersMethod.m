function [ yInitial ] = EulersMethod( yInitial,step,lowerBound, upperBound,func )
% Uses Euler's forward method to solve a differential equation
% func is a function handle
    for t=lowerBound:step:(upperBound-step)
        yInitial = yInitial + step*func(t,yInitial);
    end
end


function [ yInitial ] = HeunsMethod( yInitial,step,lowerBound,upperBound,func  )
% Solve a differential equation using Heuns Method
    for t=lowerBound:step:(upperBound-step)
        p = yInitial + step*func(t,yInitial);
        yInitial = yInitial + 0.5*step*(func(t,yInitial)+func(t+step,p));
    end
end


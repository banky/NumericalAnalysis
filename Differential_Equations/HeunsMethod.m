function [ y ] = HeunsMethod( yInitial,step,lowerBound,upperBound,func  )
% Solve a differential equation using Heuns Method
    y = zeros(size(lowerBound:step:(upperBound-step),2),1);
    yIndex = 1;
    for t=lowerBound:step:(upperBound-step)
        p = yInitial + step*func(t,yInitial);
        yInitial = yInitial + 0.5*step*(func(t,yInitial)+func(t+step,p));
        y(yIndex,1) = yInitial;
        yIndex = yIndex + 1;
    end
end


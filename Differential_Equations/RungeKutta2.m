function [ y ] = RungeKutta2( yInitial,step,lowerBound,upperBound,func )
% Solves a differential equation using 2nd order Runge Kutta
    y = zeros(size(lowerBound:step:(upperBound-step),2),1);
    yIndex = 1;
    for t=lowerBound:step:(upperBound-step)
        k1 = step*func(t,yInitial);
        % TODO: Fix this error check. This is dumb
        if(t == (upperBound-2*step))
            k2 = step*func(t+step,yInitial+k1);
        else
            k2 = step*func(t,yInitial+k1);
        end
        
        yInitial = yInitial + 0.5*(k1 + k2);
        y(yIndex,1) = yInitial;
        yIndex = yIndex + 1;
    end
end
function [ y ] = RungeKutta4( yInitial,step,lowerBound,upperBound,func )
% Solves a differential equation using 2nd order Runge Kutta
    y = zeros(size(lowerBound:step:(upperBound-step),2),1);
    yIndex = 1;
    for t=lowerBound:step:(upperBound-step)
        k1 = step*func(t,yInitial);
        % TODO: Fix this error check. This is dumb
        if(t == (upperBound-2*step))
            k2 = step*func(t+step/2,yInitial+k1/2);
            k3 = step*func(t+step/2,yInitial+k2/2);
            k4 = step*func(t+step,yInitial+k3);
        else
            k2 = step*func(t,yInitial+k1/2);
            k3 = step*func(t,yInitial+k2/2);
            k4 = step*func(t,yInitial+k3);
        end
        
        yInitial = yInitial + (k1 + 2*k2 + 2*k3 + k4)/6;
        y(yIndex,1) = yInitial;
        yIndex = yIndex + 1;
    end
end


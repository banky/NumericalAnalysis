%% Eulers Method
f = @(x,y) y+2*x-1;
yInitial = 1;
step = 0.05;
upperBound = 1;
lowerBound = 0;
EulersMethod(yInitial, step,lowerBound, upperBound, f);

%% Heuns Method
f = @(x,y) -5*y+exp(-2*x);
yInitial = 1;
step = 0.2;
upperBound = 2;
lowerBound = 0;
HeunsMethod(yInitial,step,lowerBound,upperBound,f);

%% 2nd Order Runge Kutta
f = @(x,y) -5*y+exp(-2*x);
yInitial = 0;
step = 0.00001;
upperBound = 5;
lowerBound = 0;

x = transpose(lowerBound:step:(upperBound-step));
yAnalytical = (exp(-2*x)+2*exp(-5*x))/3;

a = RungeKutta2(yInitial, step, lowerBound, upperBound, f);
b = RungeKutta4(yInitial, step, lowerBound, upperBound, f);
%b = HeunsMethod(yInitial, step, lowerBound, upperBound, f);

%sum((yAnalytical - a).^2)
%sum((yAnalytical - b).^2)

figure
hold on
plot(x,yAnalytical,'color','r');
%plot(x,a,'-','color','b');
plot(x,b,'color','g');
hold off


%% Assignment 8 No 3
f = @(t,v)9.8-(0.203*v^2)/80;
vInitial = 0;
step = 0.00001;
upperBound = 20;
lowerBound = 0;
v = RungeKutta2(vInitial,step,lowerBound,upperBound,f);
t = (lowerBound:step:(upperBound-step));
vAnalytical = (62.1455.*exp(0.315389.*t)-62.1455)./(exp(0.315389.*t)+1);

figure
plot(t,v);
hold on
plot(t,vAnalytical)
hold off

stepInverse = 1/step;
g = @(t,y)v(int32(((t+step)*stepInverse)),1);
yInitial = 0;
upperBound = 20;
lowerBound = 0;

y = RungeKutta4(yInitial,step,lowerBound,upperBound,g);
yAnalytical = -62.1455.*t+394.089.*log(exp(0.315389.*t)+1)-273.161;

for i=1:size(y,1)
    if y(i,1) >= 500
        solRight = y(i,1);
        solLeft = y(i-1,1);
        solRightIndex = i;
        solLeftIndex = i-1;
        break
    end
end

tSol = (t(1,solLeftIndex)+t(1,solRightIndex))/2;

figure
plot(t,y)
hold on
plot(t,yAnalytical);
hold off


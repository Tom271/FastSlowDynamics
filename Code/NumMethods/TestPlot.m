close all; clear all;
epsilon=0.000001;
initialData=[1,1];
h=0.01;

[expz,expt]=expEuler((@(t,x) testFn(t,x,epsilon)), initialData, 0, h, 10);


%Plot Fig10.1 Kuehn 
subplot(2,2,1)
hold on
plot(expt,exp(-expt/epsilon),'b')
plot(expt,expz(1,:),'r')
xlim([0,0.2])
ylim([-10E17, 2E17]) 
title('Explicit Euler Applied to Test Fast-Slow equation')
xlabel('Time')
ylabel('x')

 %Exercise 10.1.3 - apply modEuler and RK4 and ODE15s to FS test problem

[modz,modt]=modEuler((@(t,x) testFn(t,x,epsilon)), initialData, 0, h, 10);
[RKz,RKt]=RK4((@(t,x) testFn(t,x,epsilon)), initialData , 0, h, 10);
opts=odeset('Stats','on');
tic
[stifft,stiffz]=ode15s(@(t,x) testFn(t,x,epsilon), [0 10], initialData,opts);
toc

subplot(2,2,2)
hold on
plot(modt,exp(-modt/epsilon),'b')
plot(modt,modz(1,:),'r')
xlim([0,0.2])
ylim([-2E17, 2E17])  
title('Modified Euler Applied to Test Fast-Slow equation')
xlabel('Time')
ylabel('x')

subplot(2,2,3)
hold on 
plot(RKt,exp(-RKt/epsilon),'b')
plot(RKt,RKz(1,:),'r')
xlim([0,0.2])
ylim([-2E17, 2E17]) 
title('RK4 Applied to Test Fast-Slow equation')
xlabel('Time')
ylabel('x')

subplot(2,2,4)
hold on
plot(stifft,exp(-stifft/epsilon),'b')
plot(stifft,stiffz(:,1),'r')
title('ode15s Applied to Test Fast-Slow equation')
xlabel('Time')
ylabel('x')
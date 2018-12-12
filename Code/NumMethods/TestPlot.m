%%WARNING -- this sript will error out when producing the plot as it points
%%to a specifc place in my direcory. Change the file path and it shoudl be
%%fine. 
close all; clear all;
epsilon=0.000001;
initialData=[1,1];
h=0.01;

[expz,expt]=expEuler((@(t,x) testFn(t,x,epsilon)), initialData, 0, h, 10);


%Plot Fig10.1 Kuehn 
figure(1);
set(gcf,'color','white')   
subplot(2,2,1)
hold on
plot(expt,exp(-expt/epsilon),'b','LineWidth',1.5)
plot(expt,expz(1,:),'r--','LineWidth',1.5)
xlim([0,0.2])
ylim([-10E17, 2E17]) 
title('Explicit Euler')
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
plot(modt,exp(-modt/epsilon),'b','LineWidth',1.5)
plot(modt,modz(1,:),'r--','LineWidth',1.5)
xlim([0,0.2])
ylim([-2E17, 2E17])  
title('Modified Euler ')
xlabel('Time')
ylabel('x')

subplot(2,2,3)
hold on 
plot(RKt,exp(-RKt/epsilon),'b','LineWidth',1.5)
plot(RKt,RKz(1,:),'r--','LineWidth',1.5)
xlim([0,0.2])
ylim([-2E17, 2E17]) 
title('RK4')
xlabel('Time')
ylabel('x')

subplot(2,2,4)
hold on
plot(stifft,exp(-stifft/epsilon),'b','LineWidth',1.5)
plot(stifft,stiffz(:,1),'r--','LineWidth',1.5)
xlim([0,0.000002])
title('ode15s')
xlabel('Time')
ylabel('x')

set(gcf,'Units','inches');
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(gcf,'C:\Users\s1415551\Documents\GitHub\FastSlowDynamics\Code\NumMethods\testPlot.pdf','-dpdf','-r0')


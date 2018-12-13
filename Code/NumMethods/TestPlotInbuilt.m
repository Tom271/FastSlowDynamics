%%WARNING -- this sript will error out when producing the plot as it points
%%to a specifc place in my direcory. Change the file path and it shoudl be
%%fine. 
close all; clear all;
epsilon=0.00001;
initialData=[1,1];
h=0.01;

[expz,expt]=expEuler((@(t,x) testFn(t,x,epsilon)), initialData, 0, h, 10);

 %Exercise 10.1.3 - apply modEuler and RK4 and ODE15s to FS test problem

opts=odeset('Stats','on');
tic
sprintf('ode45')
[ode45t,ode45z]=ode45(@(t,x) testFn(t,x,epsilon), [0 10], initialData,opts);
toc

tic
sprintf('ode23t')
[ode23bt,ode23bz]=ode23t(@(t,x) testFn(t,x,epsilon), [0 10], initialData,opts);
toc

tic
sprintf('ode23s')
[ode23t,ode23z]=ode23s(@(t,x) testFn(t,x,epsilon), [0 10], initialData,opts);
toc


tic
sprintf('ode15s')
[ode15t,ode15z]=ode15s(@(t,x) testFn(t,x,epsilon), [0 10], initialData,opts);
toc


figure(1);
set(gcf,'color','white')   

subplot(2,2,1)
hold on
plot(ode45t,exp(-ode45t/epsilon),'b','LineWidth',1.5)
plot(ode45t,ode45z(:,1),'r--','LineWidth',1.5)
xlim([0,0.0002])
title('ode45 ')
xlabel('Time')
ylabel('x')

subplot(2,2,2)
hold on
plot(ode23bt,exp(-ode23bt/epsilon),'b','LineWidth',1.5)
plot(ode23bt,ode23bz(:,1),'r--','LineWidth',1.5)
xlim([0,0.0002])
title('ode23t')
xlabel('Time')
ylabel('x')



subplot(2,2,3)
hold on 
plot(ode23t,exp(-ode23t/epsilon),'b','LineWidth',1.5)
plot(ode23t,ode23z(:,1),'r--','LineWidth',1.5)
xlim([0,0.0002])
title('ode23s')
xlabel('Time')
ylabel('x')

subplot(2,2,4)
hold on
plot(ode15t,exp(-ode15t/epsilon),'b','LineWidth',1.5)
plot(ode15t,ode15z(:,1),'r--','LineWidth',1.5)
xlim([0,0.0002])
title('ode15s')
xlabel('Time')
ylabel('x')

set(gcf,'Units','inches');
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(gcf,'C:\Users\s1415551\Documents\GitHub\FastSlowDynamics\Code\NumMethods\testPlot.pdf','-dpdf','-r0')

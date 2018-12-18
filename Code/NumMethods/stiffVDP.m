%%WARNING -- this sript will error out when producing the plot as it points
%%to a specifc place in my direcory. Change the file path and it shoudl be
%%fine. 
close all; clear all;
epsilon=0.000001;
%epsilon=logspace(-2,0,7);
initialData=[1,1];
tSpan=50000000;
lambda=1;
 %Exercise 10.1.3 - apply modEuler and RK4 and ODE15s to FS test problem

opts=odeset('Stats','on');
for j=1:length(epsilon)
    tic
    sprintf('ode45')
    [ode45t,ode45z]=ode45(@(t,x) vdp(t,x,epsilon(j),lambda), [0 tSpan], initialData,opts);
    toc

    tic
    sprintf('ode23t')
    [ode23bt,ode23bz]=ode23t(@(t,x) vdp(t,x,epsilon(j),lambda), [0 tSpan], initialData,opts);
    toc

    tic
    sprintf('ode23s')
    [ode23t,ode23z]=ode23s(@(t,x) vdp(t,x,epsilon(j),lambda), [0 tSpan], initialData,opts);
    toc


    tic
    sprintf('ode15s')
    [ode15t,ode15z]=ode15s(@(t,x) vdp(t,x,epsilon(j),lambda), [0 tSpan], initialData,opts);
    toc
end

figure(1);
set(gcf,'color','white')   

subplot(2,2,1)
hold on
%plot(ode45t,exp(-ode45t/epsilon),'b','LineWidth',1.5)
plot(ode45t,ode45z(:,1),'r','LineWidth',1.5)
xlim([0, tSpan])
title('ode45 ')
xlabel('Time')
ylabel('x')

subplot(2,2,2)
hold on
%plot(ode23bt,exp(-ode23bt/epsilon),'b','LineWidth',1.5)
plot(ode23bt,ode23bz(:,1),'r','LineWidth',1.5)
xlim([0, tSpan])
title('ode23t')
xlabel('Time')
ylabel('x')



subplot(2,2,3)
hold on 
%plot(ode23t,exp(-ode23t/epsilon),'b','LineWidth',1.5)
plot(ode23t,ode23z(:,1),'r','LineWidth',1.5)
xlim([0, tSpan])
title('ode23s')
xlabel('Time')
ylabel('x')

subplot(2,2,4)
hold on
%plot(ode15t,exp(-ode15t/epsilon),'b','LineWidth',1.5)
plot(ode15z(:,1),ode15z(:,1),'r','LineWidth',1.5)
xlim([0, tSpan])
title('ode15s')
xlabel('Time')
ylabel('x')

set(gcf,'Units','inches');
pos = get(gcf,'Position');
set(gcf,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(gcf,'C:\Users\s1415551\Documents\GitHub\FastSlowDynamics\Code\NumMethods\stiffVDP.pdf','-dpdf','-r0')

function fn =vdp(t,x,epsilon,lambda)
    fn=[-x(2)-x(1).^3/3+x(1).^2;epsilon*(-lambda+x(1))];
end 


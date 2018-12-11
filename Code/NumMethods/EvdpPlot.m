function [t,x]= EvdpPlot(epsilon,nu,a,b,c,tSpan,initialValue)
    % VDPPLOT Plot solutions to the van der Pol equation
    %Plot solutions to the vdP equation with mu=m over the interval [0 
    % tSpan] from the point initialValue in the x-y plane.
    close all
    assert(epsilon>=0, 'm must be greater than zero')
    
    [t,x]=ode15s(@(t,x) EVdP(t,x,epsilon,nu,a,b,c),tSpan,initialValue);
    
    figure(1)
    plot(t,x(:,1))
    
    figure(2)
    %subplot(2,1,2)
    hold on
    plot3(x(:,1),x(:,2),x(:,3))
    xlabel('x')
    ylabel('y')
    zlabel('z')
    
    [X,Z]=meshgrid(-1:0.01:0.4,-0.08:0.001:0.04);
	s=surf(X,X.^3-X.^2,Z);
    s.EdgeColor='none';
    s.FaceColor='c';
    s.FaceAlpha=0.25;
    plot(X,X.^3-X.^2,'k','LineWidth',10)

end
    
    
    
function EVdPfn =EVdP(t,x,epsilon,nu,a,b,c)
    EVdPfn=[x(2)-x(1)^2-x(1)^3; epsilon*(x(3)-x(1)) ; epsilon*(-nu-a*x(1)-b*x(2)-c*x(3))];
end 


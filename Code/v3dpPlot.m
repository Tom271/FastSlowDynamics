function v3dpPlot= v3dpPlot(epsilon,lambda,tSpan,initialValue)
% VDPPLOT Plot solutions to the van der Pol equation
%Plot solutions to the vdP equation with mu=m over the interval [0 
% tSpan] from the point initialValue in the x-y plane.
    assert(epsilon>=0, 'm must be greater than zero')
    tolerance=1/10;
    if(epsilon<tolerance)
        [t,x]=ode15s(@(t,x) v3dp(t,x,epsilon,lambda),[0 tSpan],initialValue);
    end
    
    if(epsilon>=tolerance)
        [t,x]=ode45(@(t,x) v3dp(t,x,epsilon,lambda),[0 tSpan],initialValue);
    end
    
    fold1=[0 0 ];
    fold2=[2,4/3,0];
    equil=[1,2/3,0];
    
    nullx=linspace(-1,3);
    nully=-nullx.^3/3.+nullx.^2;
    null2y=nullx;
    [quivx,quivy]=meshgrid(-1:0.1:3);
    dquivx=-quivy-quivx.^3/3+quivx.^2;
    dquivy=epsilon*(-lambda+dquivx);
    dquivz=0;

    hold on
    title(sprintf('Epsilon= %.3f, Initial point =(%d,%d)',epsilon,initialValue))
    axis( [-1,3, -1,3] )
    quiver(quivx,quivy,dquivx,dquivy,'Color','b')

    
end
function v3dp =v3dp(t,x,epsilon,lambda)
    v3dp=[-x(2)-x(1).^3/3+x(1).^2;epsilon*(-lambda+x(1));0];
end 



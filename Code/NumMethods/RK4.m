function [z,t]=RK4(func,z_0,T_0,h,tSpan)
%RK4 solves a given ODE using the fourth order Runge-Kutta method
%given a time step and end points.
    
    assert(isa(func, 'function_handle')==1,'Input is not a function handle!');
    assert(tSpan>=0 & h>0);
    
    t=T_0:h:(T_0+tSpan);
    z=zeros(size(t));
    z(1)=z_0;
    for i=1:(length(z)-1)
        k(1)=func(z(i));
        k(2)=func(z(i)+0.5*h*k(1));
        k(3)=func(z(i)+0.5*h*k(2));
        k(4)=func(z(i)+h*k(3));
        z(i+1)=z(i)+(1/6)*h*(k(1)+2*k(2)+2*k(3)+k(4));
        
    end
    
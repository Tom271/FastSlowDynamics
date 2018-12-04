function [z,t]=expEuler(func,z_0,T_0,h,tSpan)
%EXPEULER solves a given ODE using the explicit Euler method
%given a time step and end points.
    
    assert(isa(func, 'function_handle')==1,'Input is not a function handle!');
    assert(tSpan>=0 & h>0);
    
    t=T_0:h:(T_0+tSpan);
    z=zeros(size(t));
    z(1)=z_0;
    
    for i=1:(length(z)-1)
        z(i+1)=z(i)+h*func(z(i));
    end
    
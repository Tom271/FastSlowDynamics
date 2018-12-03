function sol=expEuler(f,a,b,timestep)
%EXPEULER solves a given ODE using the explicit Euler method
%given a time step and end points.
    assert(timestep>0 & b>a)
    sol=zeros(ceil((b-a)/timestep),1);
    x=linspace(a,b,(b-a)/timestep);
    sol(1)=f(a);
    for i=1:(length(x)-1)
        sol(i+1)=sol(i)+timestep*f(x(i));
    end

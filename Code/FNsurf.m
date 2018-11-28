function FNsurf= FNsurf(epsilon, nu,tSpan,initialValue)
% VDPPLOT Plot solutions to the van der Pol equation
%Plot solutions to the vdP equation with mu=m over the interval [0 
% tSpan] from the point initialValue in the x-y plane.
    

    [t,x]=ode15s(@(t,x) fnode(t,x,nu,epsilon),[0 tSpan],initialValue);
    FNsurf=x;
    surf(x)

end
function fnode =fnode(t,x,nu,epsilon)
    fnode=[epsilon*x(2)-sqrt(epsilon)*x(1).^2, sqrt(epsilon)*x(3)-sqrt(epsilon)*x(1), -nu]';
end 

function 3DvdpPlot= 3DvdpPlot(epsilon,lambda,tSpan,initialValue,xyPlot,tPlot)
    % VDPPLOT Plot solutions to the van der Pol equation
    %Plot solutions to the vdP equation with mu=m over the interval [0 
    % tSpan] from the point initialValue in the x-y plane.
    close all
    assert(epsilon>=0, 'm must be greater than zero')
    
    
end
    
    
    
function 3dVdPfn =3dVdP(t,x,epsilon,nu,a,b,c)
    3dVdPfn=[x(2)-x(1)^2-x(1)^3; epsilon*(x(3)-x(1)) ; epsilon*(-nu-a*x(1)-b*x(2)-c*x(3))];
end 

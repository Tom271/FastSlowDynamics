function vdp =vdp(t,x,epsilon,lambda)
    vdp=[-x(2)-x(1).^3/3+x(1).^2 ;epsilon*(-lambda+x(1))];
end 


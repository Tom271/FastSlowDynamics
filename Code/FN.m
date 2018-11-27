function FN=FN(t,x,epsilon,a,b,g)
    FN=[x(1)-x(1).^3+x(2) ; epsilon*(a-b*x(2)-g*x(2))];
end 


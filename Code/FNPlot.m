function FNPlot = FNPlot(epsilon,a,b,g,tSpan,initialValue)
% FNPLOT plots solutions to the FitzHugh-Nagumo model
% on the interval [0 tSpan] in the x-y plane
    assert(epsilon>=0 & tSpan>0)
    
    [t,x]=ode45(@(t,x) FN(t,x,epsilon,a,b,g), [0,tSpan], initialValue);
    %NEXT: write own ode solver, add noise
    
    ffun=@(x,y) x-x.^3+y;
    gfun=@(x,y) a-b*x-g*y;
    
    fdot=@(x) x^3-x;
    
    fold1=[1/sqrt(3),-2/(3*sqrt(3))];
    fold2=-fold1;
    equil=[a/b,fdot(a/b)];
    %%%%%%PLOTS%%%%%%%%
        fig=figure();
        set(fig,'color','white')    

        [quivx,quivy]=meshgrid(-1.5:0.1:1.5);
        dquivx=quivx-quivx.^3+quivy;
        dquivy=epsilon*(a-b*quivx-g*quivy);
        
        hold on
        quiver(quivx,quivy,dquivx,dquivy,'Color','b')
        plot(x(:,1),x(:,2),'-','color','r')
        plot(fold1(1),fold1(2),'g-s','MarkerFaceColor','g','MarkerSize',10)
        plot(fold2(1),fold2(2),'g-s','MarkerFaceColor','g','MarkerSize',10)
        plot(equil(1),equil(2),'b-s','MarkerFaceColor','b','MarkerSize',10)

        nullx=linspace(-1.5,1.5);
        nully=nullx;
        plot(nullx,nullx.^3-nullx,'--','LineWidth',1.5,'Color',1/255*[150,150,150]);
        plot((a-g*nully)/b,nully,'--','LineWidth',1.5,'Color',1/255*[150,150,150]);
    %%%%%%%END PLOTS%%%%%%%
    FNPlot=x;
end
        

function FN=FN(t,x,epsilon,a,b,g)
    FN=[(x(1)-x(1).^3+x(2)) ;epsilon*(a-b*x(1)-g*x(2))];
end 
function vdpPlot= vdpPlot(epsilon,lambda,tSpan,initialValue,xyPlot,tPlot)
% VDPPLOT Plot solutions to the van der Pol equation
%Plot solutions to the vdP equation with mu=m over the interval [0 
% tSpan] from the point initialValue in the x-y plane.
close all
    assert(epsilon>=0, 'm must be greater than zero')
    tolerance=1;
    if(epsilon<tolerance)
        [t,x]=ode15s(@(t,x) vdp(t,x,epsilon,lambda),[0 tSpan],initialValue);
    end
    
    if(epsilon>=tolerance)
        [t,x]=ode45(@(t,x) vdp(t,x,epsilon,lambda),[0 tSpan],initialValue);
    end
    
    fold1=[0 0];
    fold2=[2,4/3];
    equil=[1,2/3]; %%Change if canard
    if(xyPlot==1)
        nullx=linspace(-1.5,3.1);
        nully=-nullx.^3/3.+nullx.^2;
        null2y=nullx;
        fig=figure(1);
        set(gcf,'color','white')    
        %'units','normalized','outerposition',[0 0 1 1],
        
        [quivx,quivy]=meshgrid(-1.5:0.1:3.1);
        dquivx=-quivy-quivx.^3/3+quivx.^2;
        dquivy=epsilon*(-lambda+dquivx);
        
        hold on
        %title(sprintf('Epsilon= %.3f, Initial point =(%d,%d)',epsilon,initialValue))
        axis( [-1.51,3.1, -1.5,3.1] )
        quiver(quivx,quivy,dquivx,dquivy,'Color','b')
        plot(nullx,nully,'color','black','LineWidth',1.5)
        %plot(fold1(1),fold1(2),'g-s','MarkerFaceColor','g','MarkerSize',10)
        %plot(fold2(1),fold2(2),'g-s','MarkerFaceColor','g','MarkerSize',10)
        plot(equil(1),equil(2),'b-s','MarkerFaceColor','b','MarkerSize',10)
        plot(zeros(1,length(null2y)),null2y,'--','LineWidth',1.5,'Color',1/255*[150,150,150])
        plot(x(:,1),x(:,2),'Color','r');
        
        hold off

%          for j = 1:length(x(:,1))
%             hold on
%             title(sprintf('Epsilon= %.3f, Initial point =(%d,%d)',epsilon,initialValue))
%             axis( [-1.5,3.1, -1.5,3.1] )
%             quiver(quivx,quivy,dquivx,dquivy,'Color','b')
%             plot(nullx,nully,'color','black','LineWidth',1.5)
%             plot(fold1(1),fold1(2),'g-s','MarkerFaceColor','g','MarkerSize',10)
%             plot(fold2(1),fold2(2),'g-s','MarkerFaceColor','g','MarkerSize',10)
%             plot(equil(1),equil(2),'b-s','MarkerFaceColor','b','MarkerSize',10)
%             plot(ones(1,length(null2y)),null2y,'--','LineWidth',1.5,'Color',1/255*[150,150,150]) %change to zero in canard
%             plot(x(1:j,1),x(1:j,2),'-o','Color','r','MarkerIndices',1:(j-1):j);
%             hold off
%             Mv(j) = getframe(fig);
%             children = get(fig, 'children');
%             
%             if(j~=length(x(:,1)))
%                 delete(children(1));
%             end 
%         
%         end
%         movie(Mv,1);
%         v = VideoWriter('vdP.mp4','MPEG-4');
%         v.Quality=100;
%         v.FrameRate=30;
% 
%         open(v)
%         writeVideo(v,Mv)
%         close(v)
%         
    end
    if(tPlot==1)
        figure();
        set(gcf,'color','white')
        plot(t,x(:,1),t,x(:,2))
        title('Time Plot of the vdP Oscillator')
    end
    
end

function vdp =vdp(t,x,epsilon,lambda)
    vdp=[-x(2)-x(1).^3/3+x(1).^2;epsilon*(-lambda+x(1))];
end 



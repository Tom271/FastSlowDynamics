function LVplot= LVplot(a,b,g,d,tSpan,initialValue,xyPlot)
% LVPLOT Plot solutions to the van der Pol equation
%Plot solutions to the vdP equation with mu=m over the interval [0 
% tSpan] from the point initialValue in the x-y plane.
    LV=@(t,x) [x(1).*(a - b*x(2)); -x(2).*(g-d*x(1))];
    
    [t,sol]=ode45(LV,[0 tSpan],initialValue);

    equil1=[0 0];
    equil2=[a/b,g/d];
    if(xyPlot==1)

    fig=figure(1);
    set(gcf,'color','white')
    %'units','normalized','outerposition',[0 0 1 1],

     [quivx,quivy]=meshgrid(-1:0.1:(max(max(sol))+0.1));
     dquivx=quivx.*(a - b.*quivy);
     dquivy=-quivy.*(g-d.*quivx);
     nullx=linspace(-1,(max(max(sol))+0.1));
     nully=ones(length(nullx),1)*a/b;
     null3y=zeros(length(nullx),1);
     null2y=nullx;
     null2x=ones(length(null2y),1)*g/d;
     null3x=zeros(length(null2y),1);
     
        for j = 1:length(sol(:,1))
            hold on
            title(sprintf('a=%.1f,b=%.1f,g=%.1f,d=%.1f,IV=(%.2f,%.2f)',a,b,g,d,initialValue))
            axis( [-1, (max(max(sol))+0.1), -1, (max(max(sol))+0.1)] )
            quiver(quivx,quivy,dquivx,dquivy,'Color','b')
            
            plot(nullx,nully,'--','LineWidth',1.5,'Color',1/255*[200,200,200])
            plot(null2x,null2y,'--','LineWidth',1.5,'Color',1/255*[150,150,150])
            plot(null3x,nullx,'--','LineWidth',1.5,'Color',1/255*[200,200,200]);
            plot(nullx,null3y,'--','LineWidth',1.5,'Color',1/255*[150,150,150]);
            
            plot(equil1(1),equil1(2),'g-s','MarkerFaceColor','g','MarkerSize',10)
            plot(equil2(1),equil2(2),'b-s','MarkerFaceColor','b','MarkerSize',10)
            plot(sol(1:j,1),sol(1:j,2),'-o','Color','r','MarkerIndices',1:(j-1):j);
            hold off
            Mv(j) = getframe(fig);
            children = get(fig, 'children');
            if(j~=length(sol(:,1)))
                delete(children(1));
            end 
        end
        %movie(Mv,1);
        v = VideoWriter('LV.mp4','MPEG-4');
        v.Quality=100;
        v.FrameRate=30;

        open(v)
        writeVideo(v,Mv)
        close(v)
    end
end

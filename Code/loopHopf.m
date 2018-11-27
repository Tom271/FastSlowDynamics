function loop=loopHopf(loops)
    amplitude=hopfAmp;
    dat(1,:)=amplitude(1,:);
    dat(2,:)=amplitude(2,:);
    parfor i=(2:loops)
        amplitude=hopfAmp;
        dat((i+2),:)=amplitude(2,:);
    end
    loop=dat;
    scatter(loop(1,:),mean(loop,1))
end

    
function amplitude=hopfAmp
%Find max amplitude for given alpha%
    count=0;
    maxamp=zeros(1,700);
    bifPlot=zeros(2,700);
    epsilon=0.01;
    b=1;
    g=0;
    tSpan=1000;
    initialValue=[0,0.0];
    for a=linspace(0.5755,0.578,750)
        count=count+1;
        run=FNPlot(epsilon,a,b,g,tSpan,initialValue);
        maxamp(count)=max(run(:,2));
        bifPlot(:,count)=[a,maxamp(count)];
    end
    amplitude=bifPlot;
    %figure();
    %plot(bifPlot(1,:),bifPlot(2,:))
end

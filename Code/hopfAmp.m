function amplitude=hopfAmp
%Find max amplitude for given alpha%
    count=0;
    
    epsilon=0.01;
    b=1;
    g=0;
    tSpan=5000;
    initialValue=[0,0.0];
    for a=linspace(0.57,0.58,5000)
        count=count+1;
        run=FNPlot(epsilon,a,b,g,tSpan,initialValue);
        maxamp(count)=max(run(:,2));
        bifPlot(:,count)=[a,maxamp(count)];
    end
    amplitude=bifPlot;
    figure();
    plot(bifPlot(1,:),bifPlot(2,:))
end

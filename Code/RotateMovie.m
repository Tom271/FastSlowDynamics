%Set elevation to height of rotation%
% Set n to number of rotations in movie%


elevation=6;
n=1;

%%%%%PUT PLOT HERE %%%%%%
peaks(25);
grid off
%%%%%%%%%%%%%%%%%%%%%%%%%
fig=figure(1);
frame=1;
for theta = linspace(0,360*n)
    view(theta,elevation)
    Mv(frame) = getframe(fig);
    children = get(fig, 'children');
    frame=frame+1;
end

movie(Mv,1);
%Change videotitle to the filename for output%
v = VideoWriter('videotitle','MPEG-4');
v.Quality=100;
v.FrameRate=30;

open(v)
writeVideo(v,Mv)
close(v)

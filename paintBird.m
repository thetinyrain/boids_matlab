function [  ] = paintBird( pos,vels)

bodyr=3
headr=1
[x,y]=size(pos)
for i=1:y
    vels(:,i)=vels(:,i)/norm(vels(:,i))
end
headpos=pos+(bodyr+headr)*vels
circle(pos(1,1),pos(2,1),bodyr)
circle(headpos(1,1),headpos(2,1),headr)
end


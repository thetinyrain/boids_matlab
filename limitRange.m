function [pos,vels ] = limitRange( pos,vels,width,height)

buffer=2.0
[x,y]=size(pos)
for i=1:y
    if pos(1,i)>width/2
        pos(1,i)=-width/2
    end
    if pos(1,i)<-width/2
        pos(1,i)=width/2
    end
    if pos(2,i)>height/2
        pos(2,i)=-height/2
    end
    if pos(2,i)<-height/2
        pos(2,i)=height/2
    end
end
end


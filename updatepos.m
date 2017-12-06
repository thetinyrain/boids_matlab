function [pos,vels ] = updatepos( pos,vels,dist,n ,maxV,minV,stdV)

vels=forrules(pos,dist,vels,n,stdV)
buffer=zeros(2,n)
is=eye(n)
for i=1:n
    if norm(vels(:,i))<minV
        vels(:,i)=vels(:,i)*minV/norm(vels(:,i))
    end
end
for i=1:n
     buffer(:,i)=pos(:,i)+vels(:,i)
     j=1
     k=1
    while j<i
        if k==25
            is(i,i)=0
            break
        end
        if norm(buffer(:,i)-buffer(:,j))<10 && k<25
            vels(:,i)=[cos(pi/12),-sin(pi/12);sin(pi/12),cos(pi/12)]*vels(:,i)
            buffer(:,i)=vels(:,i)+pos(:,i)
            k=k+1
            j=1
        else
            j=j+1
        end
    end
    buffer(:,i)=vels(:,i)*is(i,i)+pos(:,i)
end
vels=limitvel(vels,n,maxV)
pos=buffer
end


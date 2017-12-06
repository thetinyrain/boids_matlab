function [vels] = forrules( pos,dist,vels,n,stdV)

range=40
isin=eye(n)
vels1=zeros(2,n)
vels2=zeros(2,n)
vels3=zeros(2,n)
f=zeros(n)

for i=1:n
    temp=[0,0]'
    for j=1:n
        if dist(i,j)<2*norm(vels(:,i))+10
            if i~=j
                if dist(i,j)-10>0
                    f(i,j)=exp(1/(dist(i,j)-10+0.01))
                else
                    f(i,j)=8
                end
                if dist(i,j)~=0
                    temp=temp+(pos(:,i)-pos(:,j))/dist(i,j)
                end
            end
        end 
        if dist(i,j)<range
            isin(i,j)=1
        end
    end
    vels1(:,i)=temp*f(i,:)*ones(n,1)
end
vels1=limitvel(vels1,n,2*exp(1))
vels3=(pos*isin./(ones(2,n)*isin)-pos)

for i=1:n
    if norm(vels3(:,i))>0
         vels3(:,i)=vels3(:,i)*stdV/norm(vels3(:,i))
    end
end
vels2=((vels)*isin)./(ones(2,n)*isin)
vels=vels+vels1+vels2+vels3
end


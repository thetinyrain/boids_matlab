function [vels ] = limitvel( vels,n,maxvel)

for i=1:n
    if norm(vels(:,i)) > maxvel
         vels(:,i)=vels(:,i)*maxvel/norm(vels(:,i))
    end
end
end


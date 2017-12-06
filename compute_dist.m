function [ dist ] = compute_dist( pos,n)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
dist=zeros(n)
for i=1:n
    for j=1:n
        dist(i,j)=sqrt((pos(1,i)-pos(1,j))^2+(pos(2,i)-pos(2,j))^2)
    end
end


end


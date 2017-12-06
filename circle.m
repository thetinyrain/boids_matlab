function [  ] = circle( x,y,r )

xlim([-100,100])
ylim([-100,100])
rectangle('Position',[x-r,y-r,2*r,2*r],'Curvature',[1,1])
axis equal
end


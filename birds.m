width=200
height=200
N=40

maxV=6.0
minV=1.0
stdV=exp(1)
h=figure

pos=200*rand(2,N)-100*ones(2,N)
vels=repmat(2*pi.*rand(1,N),2,1)
vels(1,:)=4*cos(vels(1,:))
vels(2,:)=4*sin(vels(2,:))
x=[-104,-104,104,104]
y=[-104,104,104,-104]

for j=1:50
    dist=compute_dist(pos,N)
    [pos,vels]=updatepos(pos,vels,dist,N ,maxV,minV,stdV)
    [pos,vels]=limitRange( pos,vels,width,height)
    clf
    plot(x,y)
    axis manual
    for i=1:N
        paintBird(pos(:,i),vels(:,i))
    end
    drawnow
    saveas(h,num2str(j),'jpg')
end
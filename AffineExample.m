x=[0 1 1 0 0];
y=[0 0 1 1 0];
one=ones(1,5);

trans=[1,0,2;0,1,2;0,0,1];
rotat=[cos(pi/3),sin(pi/3),0;-sin(pi/3),cos(pi/3),0;0,0,1];
tr_xy1=zeros(3,5);
rt_xy1=zeros(3,5);

tr_xy1=trans*rotat*[x;y;one];
rt_xy1=rotat*trans*[x;y;one];
tr_x=tr_xy1(1,:);
tr_y=tr_xy1(2,:);
rt_x=rt_xy1(1,:);
rt_y=rt_xy1(2,:);

plot(x,y,'-')
hold on
plot(tr_x,tr_y,'-g')
hold on
plot(rt_x,rt_y,'-r')
axis equal
axis([-2 2 -2 2])
hold on
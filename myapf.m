figure(1);
axis([0 15 0 15]);
begin=[1;1];
over=[14;14];
hold on;
plot(begin(1),begin(2),'*b','MarkerSize',10);
plot(over(1),over(2),'*b','MarkerSize',10);
obstacle=[5 8 10 7 10 5 ;5 6 9 9 13 10];
plot(obstacle(1,:),obstacle(2,:),'ob');
 for i=1:size(obstacle,2)
    rectangle('Position',[obstacle(1,i)-0.5,obstacle(2,i)-0.5,1,1],'Curvature',[1,1],'FaceColor','r');
 end
 
point= path_plan(begin,over,obstacle);

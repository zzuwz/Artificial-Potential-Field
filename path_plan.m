function [ point ] = path_plan(begin,over,obstacle)
%PATH_PLAN 此处显示有关此函数的摘要
%   此处显示详细说明
iters=1; %迭代次数
curr=begin;
testR=0.2;   %测试8点的圆的半径为0.5
while (norm(curr-over)>0.2) &&  (iters<=2000)
    point(:,iters)=curr;
%     attr=attractive(curr,over);
%     repu=repulsion(curr,obstacle);
    %curoutput=computP(curr,over,obstacle);
    %计算当前点附近半径为0.2的8个点的势能，然后让当前点的势能减去8个点的势能取差值最大的，确定这个
    %方向，就是下一步迭代的点
    
    %先求这八个点的坐标
    for i=1:8
        testPoint(:,i)=[testR*sin((i-1)*pi/4)+curr(1);testR*cos((i-1)*pi/4)+curr(2)];
        testOut(:,i)=computP(testPoint(:,i),over,obstacle);
        %找出来最小的就可以了
    end
    [temp num]=min(testOut);
    
    %迭代的距离为0.1
    curr=(curr+testPoint(:,num))/2;
    plot(curr(1),curr(2),'og');
    pause(0.01);
    iters=iters+1;
end
end


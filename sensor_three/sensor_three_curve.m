figure(100);
xt=0:1:100;
yt=1-xt./((M./(RC./2)+1).^3-IS_num);
%yt=1-0.05.*xt;

stem(xt,yt,'o');
hold on;
title('所需节点数△i与连通度f2关系');
xlabel('所需节点数△i');
ylabel('连通度f2');
 curve(1,:)=xt;
 curve(2,:)=yt;
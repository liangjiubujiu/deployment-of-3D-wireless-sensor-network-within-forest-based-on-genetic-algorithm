figure(100);
xt=0:1:100;
yt=1-xt./((M./(RC./2)+1).^3-IS_num);
%yt=1-0.05.*xt;

stem(xt,yt,'o');
hold on;
title('����ڵ�����i����ͨ��f2��ϵ');
xlabel('����ڵ�����i');
ylabel('��ͨ��f2');
 curve(1,:)=xt;
 curve(2,:)=yt;
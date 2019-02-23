[x_s,y_s,z_s]=sphere(20);
j=1;
dot=0.1;
for i=1:IS_num
X=b{j}(i,1)+dot./2.*x_s;
Y=b{j}(i,2)+dot./2.*y_s;
Z=b{j}(i,3)+dot./2.*z_s;
surf(X,Y,Z)
hold on;
end
axis([0 4 0 4 0 4])
%axis([-0.2 2.2 -0.2 2.2 -0.2 2.2])
% %画主视图
% figure(2)
% for i=1:IS_num
% X=b{j}(i,1)+RS./2.*x;
% Y=b{j}(i,2)+RS./2.*y;
% Z=b{j}(i,3)+RS./2.*z;
% surf(X,Y,Z)
% hold on;
% end
% view([0 0]);
% axis([ 0 4 0 4])
% % ttl={'主视图','左视图','俯视图','三维图'};
% % angle={[0,0],[-90,0],[0 90],[-37.5,30]};
% % for i=1:4
%   view(angle{i});
%   title(ttl{i});
% end
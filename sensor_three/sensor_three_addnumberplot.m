%画出原始的图,如果需要使得效果明显，请减少初始传感器的数量
%选择画图的sample
pm=15
%开始画图
figure(2)
sensor_plot_sphere
hold on;
addnumberplot=zeros(IS_num,IS_num)
h=1;
o=1;
who=0
last=0
for h=1:IS_num
       for o=1:IS_num
           if c1(h,o)~=0
               num_add=floor(c1(h,o)/(RC/2))
               who=who+num_add
               deta_x=abs(b{pm}(h,1)-b{pm}(o,1))/num_add
               deta_y=abs(b{pm}(h,2)-b{pm}(o,2))/num_add
               deta_z=abs(b{pm}(h,3)-b{pm}(o,3))/num_add
               new_node=zeros(num_add,3)
               for i=(1+last):who
                   new_x=b{pm}(h,1)+deta_x*i;
                   new_y=b{pm}(h,2)+deta_y*i;
                   new_z=b{pm}(h,3)+deta_z*i;
                   new_node(i,:)=[new_x,new_y,new_z];
               end
               last=num_add
           end
       end
end


%将新增的节点用其他颜色表示
re=[1,0,0]
colormap(re)
shading flat
hold on;
[x_s,y_s,z_s]=sphere(20);
j=1;
dot=0.1;

for i=1:who
X= new_node(i,1)+dot./2.*x_s;
Y=new_node(i,2)+dot./2.*y_s;
Z=new_node(i,3)+dot./2.*z_s;
surf(X,Y,Z)
hold on;
end
axis([0 4 0 4 0 4])

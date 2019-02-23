[x_s,y_s,z_s]=sphere(20);
j=1;
dot=1;
for i=1:IS_num
X=b{j}(i,1)+dot./2.*x_s;
Y=b{j}(i,2)+dot./2.*y_s;
Z=b{j}(i,3)+dot./2.*z_s;
surf(X,Y,Z)
hold on;
end
axis([0 4 0 4 0 4])

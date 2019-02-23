go
tic
%覆盖参数
%常量
RS=1;%假设每个节点的检测半径为1/2
M=4;%区域的长度
N=4;%区域的宽度
H=4;%区域的高度
T=21;%初始解的个数
D=5;%迭代次数100-500
O=9;%确定检测点是半径的O等分点
IS_num=100;%初始化传感器数量%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%记录连通度和覆盖率
%P=1; 

part=2;%交换的节点分数
%变量

step=RS/O;%监测点步长
num=(O.*M+1).*(O.*N+1).*(O.*H+1);%监测点个数
c=cell(T,num);%存放样本网格点被覆盖传感器个数
ch=cell(T,num);
%c1=cell(1,num);%T个列向量存放节点的纵坐标

W_COV_copy=zeros(1,T);%存放所有样本中被选中的样本的覆盖率
label_father=zeros(1,T);%存放被选中的亲本的标号
picked__select_father=cell(1,T);%存放被选中的亲本
cover_average=zeros(1,T);%存放每次迭代的每个样本目标函数值，初步定义为覆盖率
%sum_cover=cell(1,D);
d=cell(1,T);%单点交叉时存放元胞被选中数据
e=cell(1,T);%单点交叉时存放元胞未被选中数据
f=cell(1,T);
s2=cell(1,T);%存放没有被覆盖网格点集合
p_test=cell(1,T);%存放每个样本中，每个节点的空白覆盖点数量
%w11=cell(1,T);
%z1=cell(1,T);
c11=cell(1,num);%当前传感器放置位置覆盖的空白网格点个数
p_test_min=cell(1,T);%找到空白区域(等价于覆盖了一次的面积最小)最小的传感器节点
p_test=cell(1,T);%被覆盖1次的网格点坐标
delete=cell(1,T);%统计重复覆盖的节点

%连通参数
ConnectMatrix=zeros(IS_num);
sensor_allneighbor=zeros(IS_num);
boss=1;
qq=5/8;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%记录连通度和覆盖率
pp=1-qq;
para=1.5%0.8~2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%记录连通度和覆盖率
RC=para*RS;
%sensor_three_altitude;%生成地形
sensor_three_curve;%生成4次连通函数
sensor_three_initial;%初始化#####################################这里或者最后结果处提供一张图
figure(1)
sensor_plot_sphere_big;
for w=1:D
      sensor_three_adaptation;%计算覆盖率
addnumber=zeros(1,T);%每T个样本算一次，使用一次就清零
    for pm=1:T%这个循环内必须设置断点，保证一次求解一个样本的信息，且不会被覆盖。
        sensor_three_all_neighbor;
        sensor_three_kruscal;
        sensor_three_addnumber;
        %sensor_three_addnumberplot;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%z这里提供一张图
    end
   sensor_three_rank;
    sensor_three_cross;%交叉
    sensor_three_variation;%变异
end
t=toc
% load chirp
% sound(y,Fs)
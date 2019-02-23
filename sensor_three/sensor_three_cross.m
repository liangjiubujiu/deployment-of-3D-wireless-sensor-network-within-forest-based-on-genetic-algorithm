%找到样本覆盖率编号的从大到小排序
%boss 是判决函数排序的类别
%boss=6, 用拟合函数值+覆盖率的排序从大到小
%boss=3 用所需连通传感器的节点数从小到大
%boss=1 用覆盖率从大到小
u=1;
for u=1:T
    picked__select_father{u}=b{W_COV_copy(boss,u)};
end
%把最后一个样本换成覆盖率最好的样本,使得最好的样本能够进入遗传变异的循环中
   picked__select_father{T}= picked__select_father{1};
%将除了局部最优的之外的20个样本配对
idex=randperm(T-1);
idex=idex+1;%将2-21 随机配对
%计算两个父本之间的相似度如果过于相似则需要更换配对
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%需要改进增加样本多样性的策略
%for k=1:2
% for g=1:2:T-3
%     %增加亲本多样性
%     if abs(W_COV_copy(idex(g))-W_COV_copy(idex(g+1)))>0.005
%         continue;
%     else
%         h=idex(g);
%         idex(g)=idex(g+2);
%         idex(g+2)=h;
%     end
% end
%
%end
t=1;
for t=1:2:T-1
    x1=1;
    y2=1;
    x2=1;
    y1=1;
    IS_num1=length(picked__select_father{idex(t)});
    IS_num2=length(picked__select_father{idex(t+1)});
    v=1;
    for v=1:IS_num1
        if find(picked__select_father{idex(t)}==picked__select_father{idex(t)}(v,1))<fix(IS_num./part)
            d{idex(t)}(y1,:)=picked__select_father{idex(t)}(v,:);
            y1=y1+1;
        else
            e{idex(t)}(y2,:)=picked__select_father{idex(t)}(v,:);
            y2=y2+1;
            
        end
        
    end
    v2=1;
    for v2=1:IS_num2
        if find(picked__select_father{idex(t+1)}==picked__select_father{idex(t+1)}(v2,1))<fix(IS_num./part)%picked__select_father{idex(t+1)}(v,1)<=2
            d{idex(t+1)}(x1,:)=picked__select_father{idex(t+1)}(v2,:);%单点交叉时存放元胞被选中数据
            x1=x1+1;
        else
            e{idex(t+1)}(x2,:)=picked__select_father{idex(t+1)}(v2,:);;%单点交叉时存放元胞未被选中数据
            x2=x2+1;
        end
    end
    %将每个图中前fix(IS_num./part)个节点的传感器布局交换
    y3=size(e{idex(t)},1);
    x3=size(e{idex(t+1)},1);%>2的数据个数
    y4=size(d{idex(t)},1);
    x4=size(d{idex(t+1)},1);%<=2的数据个数
    
    for y5=1:y3
        d{idex(t)}(y1-1+y5,:)= e{idex(t)}(y5,:);
    end
    for x5=1:x3
        d{idex(t+1)}(x1-1+x5,:)= e{idex(t+1)}(x5,:);
    end
    for y6=1:y4
        d{idex(t+1)}(IS_num2+y6,:)= d{idex(t)}(y6,:);
        f{idex(t)}(y6,:)=d{idex(t)}(y6,:);%将需要交换的点存下来
    end
    for x6=1:x4
        d{idex(t)}(IS_num1+x6,:)= d{idex(t+1)}(x6,:);
        f{idex(t+1)}(x6,:)=d{idex(t+1)}(x6,:);
    end
    for y7=1:y4
        d{idex(t)}(1,:)=[];%!清除一个元胞中矩阵的前<=2行的数据，要清除第一行！！！
    end
    
    for x7=1:x4
        d{idex(t+1)}(1,:)=[];
    end
    
end

%将交叉的亲本传给子代
i3=2;
for i3=2:T
    b{i3}=[];
    b{i3}=d{i3};
end
%将局部最优直接复制到下一代
b{1}=picked__select_father{1};



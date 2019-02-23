W_COV_copy=zeros(6,T);

W_COV_copy(1,:)=1:T;
W_COV_copy(3,:)=1:T;
W_COV_copy(6,:)=1:T;

%按顺序记录样本覆盖率
W_COV_copy(2,:)=cover_average(1,:);
if boss==1
%对产生的覆盖率进行冒泡排序
for l=1:T-1
    for m=l+1:T
        if W_COV_copy(2,l)<W_COV_copy(2,m)
            nnn=W_COV_copy([1 2],l); 
            W_COV_copy([1 2],l)=W_COV_copy([1 2],m);
            W_COV_copy([1 2],m)=nnn;
        end
    end
end 
end



if boss==3
%对产生的连通度进行冒泡排序
l=1;
m=1; 
for l=1:T-1
    for m=l+1:T
        if W_COV_copy(4,l)>W_COV_copy(4,m)
           nnnn=W_COV_copy([3 4],l); 
            W_COV_copy([3 4],l)=W_COV_copy([3 4],m);
            W_COV_copy([3 4],m)=nnnn;
        end
    end
end 
end



if boss==6
%对判决函数的值进行样本排序
h=1;
%按顺序记录样本连通所需节点数
for h=1:T
W_COV_copy(4,h)=addnumber(h);
end
%给每一个所需的连通节点数赋值
h=1;
for h=1:T
 hh=curve(2,find(curve(1,:)==W_COV_copy(4,h)));
W_COV_copy(5,h)=hh;
end
W_COV_copy(7,:)=pp.*W_COV_copy(5,:)+qq.*W_COV_copy(2,:);
find(W_COV_copy(7,:)==max(W_COV_copy(7,:)));

l=1;
m=1;
for l=1:T-1
    for m=l+1:T
        if W_COV_copy(7,l)<W_COV_copy(7,m)
            nnnnn=W_COV_copy([6 7],l); 
            W_COV_copy([6 7],l)=W_COV_copy([6 7],m);
            W_COV_copy([6 7],m)=nnnnn;
        end
    end
end
end


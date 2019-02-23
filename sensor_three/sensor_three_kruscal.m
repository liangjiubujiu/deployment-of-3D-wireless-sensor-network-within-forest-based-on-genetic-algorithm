%最小生成树kruskal源程序
%c:原图的邻接矩阵
%v0:根节点
%c1:最小生成树的邻接矩阵
p=1;
%for p=1:T
cui=sensor_allneighbor;
v0=IS_num;
[X,Y]=size(cui);
if X~=Y
error('输入必须为方阵')
end
if v0>length(cui(1,:))
error('不存在该顶点')
end
nn=length(cui(:,1));
con=0;
cui(find(cui==0))=inf;
c1=zeros(nn,nn);
comp=zeros(nn,nn);
comp(:,1)=[1:nn]';
while con<nn-1
clear min0;
min0=min(min(cui));
[x,y]=find(cui==min0);
X=x(1);
Y=y(1);
cui(X,Y)=inf;
[i1,j1]=find(comp==X);
[i2,j2]=find(comp==Y);
if i1==i2
continue
%elseif %在陷阱里
continue
else
l1=length(find(comp(i1,:)~=0));
l2=length(find(comp(i2,:)~=0));
comp(i1,[l1+1:l1+l2])=comp(i2,[1:l2]);%没看懂
comp(i2,:)=0;
c1(X,Y)=min0;
con=con+1;
end
end
c1=c1';%找到最小生成树
%end
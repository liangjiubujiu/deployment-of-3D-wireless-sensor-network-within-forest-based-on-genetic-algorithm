%��С������kruskalԴ����
%c:ԭͼ���ڽӾ���
%v0:���ڵ�
%c1:��С���������ڽӾ���
p=1;
%for p=1:T
cui=sensor_allneighbor;
v0=IS_num;
[X,Y]=size(cui);
if X~=Y
error('�������Ϊ����')
end
if v0>length(cui(1,:))
error('�����ڸö���')
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
%elseif %��������
continue
else
l1=length(find(comp(i1,:)~=0));
l2=length(find(comp(i2,:)~=0));
comp(i1,[l1+1:l1+l2])=comp(i2,[1:l2]);%û����
comp(i2,:)=0;
c1(X,Y)=min0;
con=con+1;
end
end
c1=c1';%�ҵ���С������
%end
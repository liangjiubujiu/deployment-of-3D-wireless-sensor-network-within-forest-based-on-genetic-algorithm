z=zeros(1,T);%存放所有样本区域内每个监测点是否被覆盖的信息
P=1;%监测点的计数
p=1;
for p=1:T
  P1=1;
  P2=1;
  P=1;

  for o=0:step:M
      for k=0:step:N
          for h=0:step:H
              
              ch{p,P}= b{p}(find(abs(sqrt((o-b{p}(:,1)).^2+(k-b{p}(:,2)).^2+(h-b{p}(:,3)).^2))<=RS./2),[1 2 3]);%确定01模型中能够检测到待测点的节点坐标
              
              if size(ch{p,P},1)~=0%计算监测点是否被覆盖，多个节点算一次
                  z(p,P)=1;
              else z(p,P)=0;
              end
              
              P=P+1;
          end
      end 
  end
end

for p=1:T
 cover_average(1,p)=sum( z(p,:),2)./num;
end




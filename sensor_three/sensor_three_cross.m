%�ҵ����������ʱ�ŵĴӴ�С����
%boss ���о�������������
%boss=6, ����Ϻ���ֵ+�����ʵ�����Ӵ�С
%boss=3 ��������ͨ�������Ľڵ�����С����
%boss=1 �ø����ʴӴ�С
u=1;
for u=1:T
    picked__select_father{u}=b{W_COV_copy(boss,u)};
end
%�����һ���������ɸ�������õ�����,ʹ����õ������ܹ������Ŵ������ѭ����
   picked__select_father{T}= picked__select_father{1};
%�����˾ֲ����ŵ�֮���20���������
idex=randperm(T-1);
idex=idex+1;%��2-21 ������
%������������֮������ƶ����������������Ҫ�������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��Ҫ�Ľ��������������ԵĲ���
%for k=1:2
% for g=1:2:T-3
%     %�����ױ�������
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
            d{idex(t+1)}(x1,:)=picked__select_father{idex(t+1)}(v2,:);%���㽻��ʱ���Ԫ����ѡ������
            x1=x1+1;
        else
            e{idex(t+1)}(x2,:)=picked__select_father{idex(t+1)}(v2,:);;%���㽻��ʱ���Ԫ��δ��ѡ������
            x2=x2+1;
        end
    end
    %��ÿ��ͼ��ǰfix(IS_num./part)���ڵ�Ĵ��������ֽ���
    y3=size(e{idex(t)},1);
    x3=size(e{idex(t+1)},1);%>2�����ݸ���
    y4=size(d{idex(t)},1);
    x4=size(d{idex(t+1)},1);%<=2�����ݸ���
    
    for y5=1:y3
        d{idex(t)}(y1-1+y5,:)= e{idex(t)}(y5,:);
    end
    for x5=1:x3
        d{idex(t+1)}(x1-1+x5,:)= e{idex(t+1)}(x5,:);
    end
    for y6=1:y4
        d{idex(t+1)}(IS_num2+y6,:)= d{idex(t)}(y6,:);
        f{idex(t)}(y6,:)=d{idex(t)}(y6,:);%����Ҫ�����ĵ������
    end
    for x6=1:x4
        d{idex(t)}(IS_num1+x6,:)= d{idex(t+1)}(x6,:);
        f{idex(t+1)}(x6,:)=d{idex(t+1)}(x6,:);
    end
    for y7=1:y4
        d{idex(t)}(1,:)=[];%!���һ��Ԫ���о����ǰ<=2�е����ݣ�Ҫ�����һ�У�����
    end
    
    for x7=1:x4
        d{idex(t+1)}(1,:)=[];
    end
    
end

%��������ױ������Ӵ�
i3=2;
for i3=2:T
    b{i3}=[];
    b{i3}=d{i3};
end
%���ֲ�����ֱ�Ӹ��Ƶ���һ��
b{1}=picked__select_father{1};




w1=1;
p=2;
s2=cell(1,T);
%�Ա��Ϊ2-21���������б������
for p=2:T
    P1=1;
    P2=1;
    P22=1;
    m=0;
    s2{p}(P22,:)=[0,0,0];
    k1=0;
    for h11=1:IS_num
        
        p_test{p}(1,h11)=0;
        
    end
    % P=num+1;%��Ϊ�ӵڶ���ͼ��ʼ����
    P=1;
    for o=0:step:M
        for k=0:step:N
            for h=0:step:H
%                 if P==size(c,2)+1
%                     break;%���c��û��Ԫ������
%                 end
 c{p,P}= b{p}(find(abs(sqrt((o-b{p}(:,1)).^2+(k-b{p}(:,2)).^2+(h-b{p}(:,3)).^2))<=RS./2),[1 2 3]);
                if (size(c{p,P},1)==0) %û�б����ǵ�����
                    s2{p}(P2,:)=[o,k,h];
                    P2=P2+1;
                elseif  size(c{p,P},1)==1%������1�ε����������
                    %                  g1{P}=find(b{p}(:,1)==c{p,P}(1,1));
                    %                  g2{P}= find(b{p}(:,1)==c{p,P}(1,2));
                    %                  g3{P}= find(b{p}(:,1)==c{p,P}(1,3));
                    %                  g4{P}=[g1{P} g2{P} g3{P}];
                    %                  for
                    p_test{p}(1,  find(b{p}(:,1)==c{p,P}(1,1)))= p_test{p}(1,  find(b{p}(:,1)==c{p,P}(1,1)))+1;%������ÿ��������ͶƱ��������һ�εĽڵ����ͶһƱ
                end
                P=P+1;
            end
        end
    end
    
    %�ҵ��հ�����(�ȼ��ڸ�����һ�ε������С)��С�Ĵ������ڵ�,ɾ��
    %     p_test_min{p}= find( p_test{p}==min( p_test{p}));
    %     bbb= b{p}(p_test_min{p}(1),:) ;
    p_test{p}(2,1:IS_num)=1:IS_num;
    for l=1:2
        for m=l+1:IS_num
            if p_test{p}(1,l)>p_test{p}(1,m)
                nnn=p_test{p}([1 2],l);
                p_test{p}([1 2],l)=p_test{p}([1 2],m);
                p_test{p}([1 2],m)=nnn;
            end
        end
    end
    bbb(1,1)= b{p}(p_test{p}(2,1),1);
     bbb(1,2)= b{p}(p_test{p}(2,2),1);
    
    
    %ö��ÿ���հ׽ڵ���Ϊ�½ڵ�ĸ���Ч�����ҵ����������Ľڵ����λ��
    P1=1;
    c11=[];
    m3=[];
    for m2=1:size(s2{ p},1)
        c11{P1}=s2{ p}(find (abs(sqrt((s2{ p}(:,1)-s2{p}(m2,1)).^2+ ( s2{p}(:,2)-s2{ p}(m2,2)).^2+ ( s2{p}(:,3)-s2{ p}(m2,3)).^2))<RS./2),[1 2 3]);
        m3(1,P1)= size(c11{P1},1);
        P1=P1+1;
    end
    
    %     a11=find(m3(p,:)==max(m3(p,:)));
    %     ccc=s2{p}( a11(1),:);
    nnn=0;
    m3(2,1:length(m3(1,:)))=1:length(m3(1,:));
    for l=1:2
        for m=l+1:length( m3(1,:))
            if m3(1,l)<m3(1,m)
                nnn=m3([1 2],m);
                m3([1 2],m)=m3([1 2],1);
                m3([1 2],1)=nnn;
            end
        end
    end
    
    
    %�������
    %     if  ~isempty(a11)
    %         b{p}(IS_num+1,:)=s2{p}( a11(1),:);
    %         ddd=find(b{p}(:,1)==bbb(1));
    %         b{p}(ddd(1),:)=[];
    %
    %     end
    b{p}([IS_num+1 IS_num+2],:)=s2{p}(m3([1 2]),:);

    b{p}(find(b{p}(:,1)==bbb(1)),:)=[];
    b{p}(find(b{p}(:,1)==bbb(2)),:)=[];
    
    
    
    
end
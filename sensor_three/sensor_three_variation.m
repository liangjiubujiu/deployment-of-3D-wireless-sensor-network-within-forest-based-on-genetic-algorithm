
w1=1;
p=2;
s2=cell(1,T);
%对编号为2-21的样本进行变异操作
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
    % P=num+1;%因为从第二张图开始计算
    P=1;
    for o=0:step:M
        for k=0:step:N
            for h=0:step:H
%                 if P==size(c,2)+1
%                     break;%如果c中没有元素跳出
%                 end
 c{p,P}= b{p}(find(abs(sqrt((o-b{p}(:,1)).^2+(k-b{p}(:,2)).^2+(h-b{p}(:,3)).^2))<=RS./2),[1 2 3]);
                if (size(c{p,P},1)==0) %没有被覆盖点坐标
                    s2{p}(P2,:)=[o,k,h];
                    P2=P2+1;
                elseif  size(c{p,P},1)==1%被覆盖1次的网格点坐标
                    %                  g1{P}=find(b{p}(:,1)==c{p,P}(1,1));
                    %                  g2{P}= find(b{p}(:,1)==c{p,P}(1,2));
                    %                  g3{P}= find(b{p}(:,1)==c{p,P}(1,3));
                    %                  g4{P}=[g1{P} g2{P} g3{P}];
                    %                  for
                    p_test{p}(1,  find(b{p}(:,1)==c{p,P}(1,1)))= p_test{p}(1,  find(b{p}(:,1)==c{p,P}(1,1)))+1;%样本中每个传感器投票，被覆盖一次的节点可以投一票
                end
                P=P+1;
            end
        end
    end
    
    %找到空白区域(等价于覆盖了一次的面积最小)最小的传感器节点,删除
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
    
    
    %枚举每个空白节点作为新节点的覆盖效果，找到覆盖率最大的节点放置位置
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
    
    
    %变异操作
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
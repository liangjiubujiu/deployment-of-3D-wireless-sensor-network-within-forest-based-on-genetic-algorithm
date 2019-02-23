b=cell(1,T);

for j=1:T
    b{j}(:,1)=M.*rand(IS_num,1);
    b{j}(:,2)= N.*rand(IS_num,1);
    b{j}(:,3)= H.*rand(IS_num,1);
%     b{j}(:,1)=( M-(3/2)*RS/2).*rand(IS_num,1)+3/4.*RS/2;
%     b{j}(:,2)= (N-(3/2)*RS/2).*rand(IS_num,1)+3/4.*RS/2;
%     b{j}(:,3)= (H-(3/2)*RS/2).*rand(IS_num,1)+3/4.*RS/2;
end


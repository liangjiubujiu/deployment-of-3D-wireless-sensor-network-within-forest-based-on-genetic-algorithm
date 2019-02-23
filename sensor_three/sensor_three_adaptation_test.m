c=cell(T,IS_num);
for p=1:T
for i=1:IS_num
    ff=zeros(3,O.*RS);%放传感附近监测点标号
    ffl1=0;
    ffl2=0;
    ffl3=0;
    fff1=find(abs((table(1,:)-b{p}(i,1)))<=RS./2);
    ff(1,1:length(fff1))=table(1,fff1);
    ffl1=sum(ff(1,:)~=0,2);
    fff2=find(abs((table(1,:)-b{p}(i,2)))<=RS./2);
    ff(2,1:length(fff2))=table(1,fff2);
    ffl2=sum(ff(2,:)~=0,2);
    fff3=find(abs((table(1,:)-b{p}(i,3)))<=RS./2);
    ff(3,1:length(fff3))=table(1,fff3);
    ffl3=sum(ff(3,:)~=0,2);
    mm=0;
    for o=1:ffl1
        for k=1:ffl2
            for h=1:ffl3
                if  abs(((ff(1,o)-b{p}(i,1)).^2+(ff(2,k)-b{p}(i,2)).^2+(ff(3,h)-b{p}(i,3)).^2).^(1/3))<=RS./2
                    mm=mm+1;
                    c{p,i}(mm,1:3)=[ff(1,o) ff(2,k) ff(3,h)] ;
                end
            end
        end
    end
end

end
go;


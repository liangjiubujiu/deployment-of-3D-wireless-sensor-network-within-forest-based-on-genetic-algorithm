%pm=1:T
 sensor_allneighbor=zeros(IS_num,IS_num);
k=1;
o=1;
for k=1:IS_num
    for o=1:IS_num
        
        if k~=o
            sensor_allneighbor(k,o)=abs(sqrt((b{pm}(k,1)-b{pm}(o,1)).^2+(b{pm}(k,2)-b{pm}(o,2)).^2+(b{pm}(k,3)-b{pm}(o,3)).^2));
        end
        
    end
end%用于计算任意两点之间的距离

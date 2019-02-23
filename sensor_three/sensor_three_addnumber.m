
h=1;
o=1;
for h=1:IS_num
       for o=1:IS_num
           if c1(h,o)~=0

               addnumber(pm)=addnumber(pm)+floor(c1(h,o)/(RC/2));
               
           end
       end
end

%end
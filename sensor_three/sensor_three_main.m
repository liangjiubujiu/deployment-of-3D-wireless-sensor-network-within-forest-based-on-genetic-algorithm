go
tic
%���ǲ���
%����
RS=1;%����ÿ���ڵ�ļ��뾶Ϊ1/2
M=4;%����ĳ���
N=4;%����Ŀ��
H=4;%����ĸ߶�
T=21;%��ʼ��ĸ���
D=5;%��������100-500
O=9;%ȷ�������ǰ뾶��O�ȷֵ�
IS_num=100;%��ʼ������������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��¼��ͨ�Ⱥ͸�����
%P=1; 

part=2;%�����Ľڵ����
%����

step=RS/O;%���㲽��
num=(O.*M+1).*(O.*N+1).*(O.*H+1);%�������
c=cell(T,num);%�����������㱻���Ǵ���������
ch=cell(T,num);
%c1=cell(1,num);%T����������Žڵ��������

W_COV_copy=zeros(1,T);%������������б�ѡ�е������ĸ�����
label_father=zeros(1,T);%��ű�ѡ�е��ױ��ı��
picked__select_father=cell(1,T);%��ű�ѡ�е��ױ�
cover_average=zeros(1,T);%���ÿ�ε�����ÿ������Ŀ�꺯��ֵ����������Ϊ������
%sum_cover=cell(1,D);
d=cell(1,T);%���㽻��ʱ���Ԫ����ѡ������
e=cell(1,T);%���㽻��ʱ���Ԫ��δ��ѡ������
f=cell(1,T);
s2=cell(1,T);%���û�б���������㼯��
p_test=cell(1,T);%���ÿ�������У�ÿ���ڵ�Ŀհ׸��ǵ�����
%w11=cell(1,T);
%z1=cell(1,T);
c11=cell(1,num);%��ǰ����������λ�ø��ǵĿհ���������
p_test_min=cell(1,T);%�ҵ��հ�����(�ȼ��ڸ�����һ�ε������С)��С�Ĵ������ڵ�
p_test=cell(1,T);%������1�ε����������
delete=cell(1,T);%ͳ���ظ����ǵĽڵ�

%��ͨ����
ConnectMatrix=zeros(IS_num);
sensor_allneighbor=zeros(IS_num);
boss=1;
qq=5/8;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��¼��ͨ�Ⱥ͸�����
pp=1-qq;
para=1.5%0.8~2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��¼��ͨ�Ⱥ͸�����
RC=para*RS;
%sensor_three_altitude;%���ɵ���
sensor_three_curve;%����4����ͨ����
sensor_three_initial;%��ʼ��#####################################���������������ṩһ��ͼ
figure(1)
sensor_plot_sphere_big;
for w=1:D
      sensor_three_adaptation;%���㸲����
addnumber=zeros(1,T);%ÿT��������һ�Σ�ʹ��һ�ξ�����
    for pm=1:T%���ѭ���ڱ������öϵ㣬��֤һ�����һ����������Ϣ���Ҳ��ᱻ���ǡ�
        sensor_three_all_neighbor;
        sensor_three_kruscal;
        sensor_three_addnumber;
        %sensor_three_addnumberplot;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%z�����ṩһ��ͼ
    end
   sensor_three_rank;
    sensor_three_cross;%����
    sensor_three_variation;%����
end
t=toc
% load chirp
% sound(y,Fs)
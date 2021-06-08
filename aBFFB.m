%水准仪数据处理程序V0.0.02
%powered by NICO.Guo
%根据work_list格式文件，生成aBFFB水准线路原始数据文件。
%用于双随机检查
%
% clc;
% clear;
% load work_list;
%***************数据输入***********************
working_line='';
file_name='181012.dat';
start_time='17:33:28';
jzd_H=work_list{1,3};
jzd_name=work_list{1,2};
num_of_set=0;
this_time=start_time;
go_type=0;
sum_HD_B=0;
sum_HD_F=0;
%***************建立文件头***********************
data_table{1,1}=['For M5|Adr     1|TO  ' file_name '                 |                      |                      |                      | '];
data_table{2,1}=['For M5|Adr     2|TO  Start-Line      aBFFB     1|                      |                      |                      | '];
data_table{3,1}=['For M5|Adr     3|KD1' full_some(jzd_name,1,9,' ') '                  1|                      |                      |Z        ' jzd_H ' m   | '];
data_num=4;
%--------循环工作列表--------------
for i=1:size(work_list,1)-1
%奇偶站转换
    if go_type==2
        go_type=1;
    elseif go_type==1
            go_type=2;
    elseif go_type==0
            go_type=1;
    end
    %赋前、后站名站点高程
    B_name=work_list{i,2};
    B_H=work_list{i,3};
    F_name=work_list{i+1,2};
    F_H=work_list{i+1,3};
    %计算测站数
    num_of_set=num_of_set+1;
    %运行输出数据
    [runout,this_time,HD_F,HD_B]=data_go(data_num,F_name ,F_H,B_name,B_H,this_time,go_type);
    %累加前后视距
    sum_HD_B=sum_HD_B+HD_B;
    sum_HD_F=sum_HD_F+HD_F;
    %接收运行数据
    for j=data_num:data_num+4
        data_table{j,1}=runout{j+1-data_num,1};
    end
    this_time=time_go(this_time,1); %时间步进
    data_num=data_num+5;            %行号步进
end
Sh=save_r_num(num2str(str2num(F_H)-str2num(jzd_H)),5);
data_table{data_num,1}=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      ' '            1|Sh'];
data_table{data_num,1}=[data_table{data_num,1} full_some(Sh,1,15,' ') ' m   |dz'];
data_table{data_num,1}=[data_table{data_num,1} full_some(num2str(str2num(Sh)*(-1)),1,15,' ') ' m   |Z        ' jzd_H ' m   | '];
data_table{data_num+1,1}=['For M5|Adr' full_some(num2str(data_num+1),1,6,' ') '|KD2' full_some(F_name,1,9,' ') '      ' full_some(num2str(num_of_set-1),1,3,' ')];
data_table{data_num+1,1}=[data_table{data_num+1,1} '         1|Db' full_some(save_r_num(num2str(sum_HD_B),2),1,15,' ')];
data_table{data_num+1,1}=[data_table{data_num+1,1} ' m   |Df' full_some(save_r_num(num2str(sum_HD_F),2),1,15,' ') ' m   |Z        ' F_H ' m   | '];
data_table{data_num+2,1}=['For M5|Adr' full_some(num2str(data_num+2),1,6,' ') '|TO  End-Line                  1|                      |                      |                      | '];

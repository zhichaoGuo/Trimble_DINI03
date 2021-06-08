%read Level data
%打开现有水准数据，提取站点高程与中间点高程，整理成为work_list格式。
%
%
%
% [FileName,PathName,FilterIndex] = uigetfile(FilterSpec,DialogTitle,DefaultName)
% FileName：返回的文件名
% PathName：返回的文件的路径名
% FilterIndex：选择的文件类型
% FilterSpec：文件类型设置
% DialogTitle：打开对话框的标题
% DefaultName：默认指向的文件名
%
%
 clc;
 clear;
 [FileName,PathName,FilterIndex] = uigetfile('*.DAT','打开水准路线文件','');
 file=[PathName FileName];
% file_path=['C:\Users\ASUS\Desktop\水准仪\数据文件\'];
% file=['C:\Users\ASUS\Desktop\水准仪\数据文件\191017.DAT'];
fid = fopen(file,'rt');

%变量声明
set_type=[];
set_name=[];
set_H=[];
work_list={};
list_num=0;
line = fgetl(fid);
while 1
    %-------循环判读每行内容---------------
    if (line(96)=='Z')
       list_num=list_num+1;
        if (line(51)==' ')
            f_s_type='1';
            set_type=[set_type;f_s_type];
            
            f_s_name=line(21:29);
            f_s_name(find(isspace(f_s_name)))=[];
            f_s_H=line(97:112);
            f_s_H(find(isspace(f_s_H)))=[];
        
            set_name{list_num,1}=f_s_name;
            set_H=[set_H;f_s_H];
        elseif (line(51)=='z')
            f_s_type='2';
            set_type=[set_type;f_s_type];
            
            f_s_name=line(21:29);
            f_s_name(find(isspace(f_s_name)))=[];
            f_s_H=line(97:112);
            f_s_H(find(isspace(f_s_H)))=[];
        
            set_name{list_num,1}=f_s_name;
            set_H=[set_H;f_s_H];
        end
    end
    
    %-------------------------------------
    if feof(fid)==1
        break
    end

    line=fgetl(fid);

end
%循环输入work_list
for i=1:size(set_type,1)
    work_list{i,1}=set_type(i,1);
    work_list{i,2}=cell2mat(set_name(i,1));
    work_list{i,3}=set_H(i,:);
end


% %---------------对读取的work_list 进行随机修改并保存----------------------
% for i=2:size(set_type,1)-1
%     work_list{i,3}=full_some(num2str(roundn((str2num(work_list{i,3})-rand(1)/1000),-5),7),2,8,'0');
% %     work_list{i,3}=save_r_num(num2str((str2num(work_list{i,3})*100000-fix(rand(1)*100))/100000),5);
% end
% save work_list.mat work_list;



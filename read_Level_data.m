%read Level data
%������ˮ׼���ݣ���ȡվ��߳����м��̣߳������Ϊwork_list��ʽ��
%
%
%
% [FileName,PathName,FilterIndex] = uigetfile(FilterSpec,DialogTitle,DefaultName)
% FileName�����ص��ļ���
% PathName�����ص��ļ���·����
% FilterIndex��ѡ����ļ�����
% FilterSpec���ļ���������
% DialogTitle���򿪶Ի���ı���
% DefaultName��Ĭ��ָ����ļ���
%
%
 clc;
 clear;
 [FileName,PathName,FilterIndex] = uigetfile('*.DAT','��ˮ׼·���ļ�','');
 file=[PathName FileName];
% file_path=['C:\Users\ASUS\Desktop\ˮ׼��\�����ļ�\'];
% file=['C:\Users\ASUS\Desktop\ˮ׼��\�����ļ�\191017.DAT'];
fid = fopen(file,'rt');

%��������
set_type=[];
set_name=[];
set_H=[];
work_list={};
list_num=0;
line = fgetl(fid);
while 1
    %-------ѭ���ж�ÿ������---------------
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
%ѭ������work_list
for i=1:size(set_type,1)
    work_list{i,1}=set_type(i,1);
    work_list{i,2}=cell2mat(set_name(i,1));
    work_list{i,3}=set_H(i,:);
end


% %---------------�Զ�ȡ��work_list ��������޸Ĳ�����----------------------
% for i=2:size(set_type,1)-1
%     work_list{i,3}=full_some(num2str(roundn((str2num(work_list{i,3})-rand(1)/1000),-5),7),2,8,'0');
% %     work_list{i,3}=save_r_num(num2str((str2num(work_list{i,3})*100000-fix(rand(1)*100))/100000),5);
% end
% save work_list.mat work_list;



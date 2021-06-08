function [data_table,this_time1,HD_F,HD_B] = data_go( Line_num,F_name ,F_H,B_name,B_H,this_time,go_type)
%input:
    %Line_num   �к�         int
    %F_name     ��һվվ��   str
    %F_H        ��һվ�߳�   str
    %B_name     ��һվվ��   str
    %B_H        ��һվ�߳�   str
    %this_time  ����ʱ��     str
    %go_type    תվ����   ����1��bffb
    %                         2��fbbf
%output:
    %data_table ԭʼ���ݸ�ʽ����    cell
    %this_time  �ɼ���ʹ�õ�ʱ��    str
    %HD_F       ���ڼ���ǰ���Ӿ�    num 
    %HD_B       ���ڼ���ǰ���Ӿ�    num

% Line_num=4;
% F_name= 'BM1';
% F_H='30.00000';
% B_name='B1';
% B_H='30.20041';
% this_time='13:12:11';
% go_type=1;
%-------------����ǰ���Ӹ߶�---------------
if abs(str2num(B_H)-str2num(F_H))<0.3
    Rb=roundn(1.5+(rand(1)-0.5)/5,-5);
else
Rb=roundn(round((2-(2-((str2num(B_H)+str2num(F_H)+2)/2+rand(1)*0.05-str2num(B_H)-0.025))*2*rand(1)*0.96)*100000)/100000,-5);
end
Rb_1=Rb+roundn((rand(1)-0.5)/10000,-5);
Rb_2=Rb*2-Rb_1;
Rf=str2num(B_H)+Rb-str2num(F_H);
Rf_1=Rf+roundn((rand(1)-0.5)/10000,-5);
Rf_2=Rf*2-Rf_1;
%-------------����ǰ���Ӿ���---------------
HD_B=roundn(rand(1)*20+10,-3);
HD_B1=HD_B+roundn((rand(1)-0.5)/100,-3);
HD_B2=HD_B*2-HD_B1;
HD_F=roundn(HD_B+rand(1)-0.5,-3);
HD_F1=HD_F+roundn((rand(1)-0.5)/100,-3);
HD_F2=HD_F*2-HD_F1;
%
working_line=[];
data_table=[];
if (go_type==1)
    %*****************   BFFB ��һ��    B  ***************
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(B_name,1,9,' ') ];
    working_line=[working_line '      ' this_time '2   1|Rb' ];
    working_line=[working_line full_some(full_some(num2str(Rb_1,6),2,7,'0'),1,15,' ') ];
    working_line=[working_line ' m   |HD' full_some(save_r_num(num2str(HD_B1),3),1,15,' ') ' m   |                      | '];
    data_table{1,1}=working_line;   %��BFFB��B���и�ֵ
    %*****************   BFFB �ڶ���    F  ***************
    this_time=time_go(this_time,4); %ʱ�䲽��
    Line_num=Line_num+1;            %�кŲ���
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') ];
    working_line=[working_line '      ' this_time '2   1|Rf' ];
    working_line=[working_line full_some(full_some(num2str(Rf_1,6),2,7,'0'),1,15,' ') ];
    working_line=[working_line ' m   |HD' full_some(save_r_num(num2str(HD_F1),3),1,15,' ') ' m   |                      | '];
    data_table{2,1}=working_line;   %��BFFB��F���и�ֵ
    %*****************   BFFB ������    F  ***************
    this_time=time_go(this_time,1); %ʱ�䲽��
    Line_num=Line_num+1;            %�кŲ���
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') ];
    working_line=[working_line '      ' this_time '2   1|Rf' ];
    working_line=[working_line full_some(full_some(num2str(Rf_2,6),2,7,'0'),1,15,' ') ];
    working_line=[working_line ' m   |HD' full_some(save_r_num(num2str(HD_F2),3),1,15,' ') ' m   |                      | '];
    data_table{3,1}=working_line;   %��BFFB��F���и�ֵ
    %*****************   BFFB ������    B  ***************
    this_time=time_go(this_time,1); %ʱ�䲽��
    Line_num=Line_num+1;            %�кŲ���
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(B_name,1,9,' ') ];
    working_line=[working_line '      ' this_time '2   1|Rb' ];
    working_line=[working_line full_some(full_some(num2str(Rb_2,6),2,7,'0'),1,15,' ') ];
    working_line=[working_line ' m   |HD' full_some(save_r_num(num2str(HD_B2),3),1,15,' ') ' m   |                      | '];
    data_table{4,1}=working_line;   %��BFFB��B���и�ֵ
    %*****************   BFFB ������    FH  ***************
    Line_num=Line_num+1;            %�кŲ���
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ')];
    working_line=[working_line  '      '  this_time '    1|                      |                      |Z' ];
    working_line=[working_line full_some(save_r_num(num2str(F_H),5),1,16,' ') ' m   | '];
    data_table{5,1}=working_line;   %��BFFB����һվ�߳̽��и�ֵ
    %*****************   BFFB ����  ***************
else if (go_type==2)
    %*****************   FBBF ��һ��    F  ***************
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') ];
    working_line=[working_line '      ' this_time '2   1|Rf' ];
    working_line=[working_line full_some(full_some(num2str(Rf_1,6),2,7,'0'),1,15,' ') ];
    working_line=[working_line ' m   |HD' full_some(save_r_num(num2str(HD_F1),3),1,15,' ') ' m   |                      | '];
    data_table{1,1}=working_line;   %��FBBF��F���и�ֵ
    %*****************   FBBF �ڶ���    B  ***************
    this_time=time_go(this_time,1); %ʱ�䲽��
    Line_num=Line_num+1;            %�кŲ���
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(B_name,1,9,' ') ];
    working_line=[working_line '      ' this_time '2   1|Rb' ];
    working_line=[working_line full_some(full_some(num2str(Rb_1,6),2,7,'0'),1,15,' ') ];
    working_line=[working_line ' m   |HD' full_some(save_r_num(num2str(HD_B1),3),1,15,' ') ' m   |                      | '];
    data_table{2,1}=working_line;   %��FBBF��B���и�ֵ    
    %*****************   FBBF ������    B  ***************
    this_time=time_go(this_time,1); %ʱ�䲽��
    Line_num=Line_num+1;            %�кŲ���
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(B_name,1,9,' ') ];
    working_line=[working_line '      ' this_time '2   1|Rb' ];
    working_line=[working_line full_some(full_some(num2str(Rb_2,6),2,7,'0'),1,15,' ') ];
    working_line=[working_line ' m   |HD' full_some(save_r_num(num2str(HD_B2),3),1,15,' ') ' m   |                      | '];
    data_table{3,1}=working_line;   %��FBBF��B���и�ֵ    
    %*****************   FBBF ������    F  ***************
    this_time=time_go(this_time,1); %ʱ�䲽��
    Line_num=Line_num+1;            %�кŲ���
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') ];
    working_line=[working_line '      ' this_time '2   1|Rf' ];
    working_line=[working_line full_some(full_some(num2str(Rf_2,6),2,7,'0'),1,15,' ') ];
    working_line=[working_line ' m   |HD' full_some(save_r_num(num2str(HD_F2),3),1,15,' ') ' m   |                      | '];
    data_table{4,1}=working_line;   %��FBBF��F���и�ֵ    
    %*****************   FBBF ������    FH  ***************
    Line_num=Line_num+1;            %�кŲ���
    working_line=['For M5|Adr' full_some(num2str(Line_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ')];
    working_line=[working_line  '      '  this_time '    1|                      |                      |Z' ];
    working_line=[working_line full_some(save_r_num(num2str(F_H),5),1,16,' ') ' m   | '];
    data_table{5,1}=working_line;   %��BFFB����һվ�߳̽��и�ֵ
    %*****************   FBBF ����  ***************
    end
end
this_time=time_go(this_time,1); %ʱ�䲽��
this_time1=this_time;           %ʱ�䴫��
   this_time='12:02:01';     
        
        
    
    
    

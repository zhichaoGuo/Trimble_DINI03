%水准仪数据处理程序V0.0.01
%powered by NICO.Guo
%根据work_list格式文件，生成水准原始数据文件。
%
%
% clc;
% clear;
% load work_list;
working_line='';
file_name='201222.dat';
start_time='12:50:34';
jzd_H=work_list{1,3};
jzd_name=work_list{1,2};
num_of_set=0;
Db=0;
Df=0;
this_time=start_time;
%--------建立文件头------------
data_table{1,1}=['For M5|Adr     1|TO  ' file_name '                 |                      |                      |                      | '];
data_table{2,1}=['For M5|Adr     2|TO  Start-Line       BBFF     1|                      |                      |                      | '];
data_table{3,1}=['For M5|Adr     3|KD1' full_some(jzd_name,1,9,' ') '                  1|                      |                      |Z        ' jzd_H ' m   | '];
data_num=4;
%--------循环工作列表--------------
for i=1:size(work_list,1)-1
    B_type=work_list{i,1};
    F_type=work_list{i+1,1};
%---------站转站部分----------------
    if (str2num(B_type)==1 && str2num(F_type)==1)
        B_name=work_list{i,2};
        F_name=work_list{i+1,2};
        B_H=work_list{i,3};
        F_H=work_list{i+1,3};

             Rb=round((2-(2-((str2num(B_H)+str2num(F_H)+2)/2+rand(1)*0.05-str2num(B_H)-0.025))*2*rand(1)*0.96)*100000)/100000;
       
            
%         Rb=roundn(rand(1),-5)+1;
        Rf=str2num(B_H)+Rb-str2num(F_H);
        HD_B=roundn(rand(1)*20+10,-3);
        HD_F=roundn(HD_B+rand(1),-3);
        Db=Db+HD_B;
        Df=Df+HD_F;
        this_time=time_go(this_time,1);
        %-----转站第一行---------------------
        working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(B_name,1,9,' ') '      ' this_time '2   1|Rb' ];
        HD_B1=HD_B+ roundn(rand(1)/400,-3);
        Rb_1=roundn(Rb+0.00001,-5);
        working_line=[working_line full_some(full_some(num2str(Rb_1,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_B1),3),1,15,' ') ' m   |                      | '];
        data_table{data_num,1}=working_line;
        data_num=data_num+1;
        this_time=time_go(this_time,1);
        working_line='';
        %-------------转站第二行------------
        working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(B_name,1,9,' ') '      ' this_time '2   1|Rb' ];
        HD_B2=(HD_B*2)-HD_B1;
        Rb_2=Rb*2-Rb_1;
        working_line=[working_line full_some(full_some(num2str(Rb_2,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_B2),3),1,15,' ') ' m   |                      | '];
        data_table{data_num,1}=working_line;
        data_num=data_num+1;
        this_time=time_go(this_time,1);
        working_line='';
        %----------转站第三行-----------
        working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      ' this_time '2   1|Rf' ];
        HD_F1=HD_F+ roundn(rand(1)/350,-3);
        Rf_1=roundn(Rf+0.00001,-5);
        working_line=[working_line full_some(full_some(num2str(Rf_1,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_F1),3),1,15,' ') ' m   |                      | '];
        data_table{data_num,1}=working_line;
        data_num=data_num+1;
        this_time=time_go(this_time,1);
        working_line='';
        %-------------转站第四行------------
        working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      ' this_time '2   1|Rf' ];
        HD_F2=(HD_F*2)-HD_F1;
        Rf_2=Rf*2-Rf_1;
        working_line=[working_line full_some(full_some(num2str(Rf_2,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_F2),3),1,15,' ') ' m   |                      | '];
        data_table{data_num,1}=working_line;
        data_num=data_num+1;
%         this_time=time_go(this_time);
        working_line='';
        %-------------转站第五行------------
        working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      '  this_time '    1|                      |                      |Z' full_some(save_r_num(num2str(F_H),5),1,16,' ') ' m   | '];
        data_table{data_num,1}=working_line;
        data_num=data_num+1;
        this_time=time_go(this_time,1);
        working_line='';
        num_of_set=num_of_set+1;
    %-----------站转中部分-----------------
    else if (str2num(B_type)==1 && str2num(F_type)==2)
        B_name=work_list{i,2};
        F_name=work_list{i+1,2};
        B_H=work_list{i,3};
        F_H=work_list{i+1,3};
        %*********************寻找下一站高程，以计算合适Rb*******************
        for k=i+1:size(work_list,1)
            next_set=str2num(work_list{k,1});
            if next_set==1
                next_set_H=work_list{k,3};
                break
            end
        end
         %*********************寻到下一站高程，计算合适Rb*******************
%         寻找合适的Rb计算方法 使得BH FH NSH 同时可算。
            boxx=[str2num(B_H) str2num(F_H) str2num(next_set_H)];
            Rb=round(((min(boxx)+max(boxx)+2)/2-str2num(B_H)+rand(1)*0.05-0.025)*100000)/100000;
%         Rb=roundn(rand(1),-5)+0.5;
        Rf=round((str2num(B_H)+Rb-str2num(F_H))*100000)/100000;
        HD_B=roundn(rand(1)*40+10,-3);
        Db=Db+HD_B;

        HD_F=roundn(rand(1)*10+10,-3);
        this_time=time_go(this_time,4);
        %-----------站转中第一行---------
        working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(B_name,1,9,' ') '      ' this_time '2   1|Rb' ];
        HD_B1=HD_B+ roundn(rand(1)/350,-3);
        Rb_1=roundn(Rb+0.00001,-5);
        working_line=[working_line full_some(full_some(num2str(Rb_1,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_B1),3),1,15,' ') ' m   |                      | '];
        data_table{data_num,1}=working_line;
        data_num=data_num+1;
        this_time=time_go(this_time,1);
        working_line='';
        %-------------站转中第二行------------
        working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(B_name,1,9,' ') '      ' this_time '2   1|Rb' ];
        HD_B2=(HD_B*2)-HD_B1;
        Rb_2=Rb*2-Rb_1;
        working_line=[working_line full_some(full_some(num2str(Rb_2,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_B2),3),1,15,' ') ' m   |                      | '];
        data_table{data_num,1}=working_line;
        data_num=data_num+1;
        this_time=time_go(this_time,4);
        working_line='';
        %-------------站转中第三行----------
        working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|TO  Intermediate sight.       1|                      |                      |                      | '];
        data_table{data_num,1}=working_line;
        data_num=data_num+1;
        working_line='';
        %---------站转中第四行-----------
        working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      ' this_time '2   1|Rz' ];
        working_line=[working_line full_some(full_some(num2str(Rf,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_F),3),1,15,' ') ' m   |Z' full_some(save_r_num(num2str(F_H),5),1,16,' ') ' m   | '];
        data_table{data_num,1}=working_line;
        data_num=data_num+1;
        this_time=time_go(this_time,4);
        working_line='';
        
        %-----------中间点到中间点部分-----------------
    else if (str2num(B_type)==2 && str2num(F_type)==2)
            %B_name
            F_name=work_list{i+1,2};
            %B_H
            F_H=work_list{i+1,3};
            
            %Rb=roundn(rand(1),-5)+0.5;
            Rf=str2num(B_H)+Rb-str2num(F_H);
            %HD_B=roundn(rand(1)*50+10,-3);
            HD_F=roundn(rand(1)*30+10,-3);
            this_time=time_go(this_time,1);
            %-----------中到中第一行----------
            working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      ' this_time '2   1|Rz' ];
            working_line=[working_line full_some(full_some(num2str(Rf,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_F),3),1,15,' ') ' m   |Z' full_some(save_r_num(num2str(F_H),5),1,16,' ') ' m   | '];
            data_table{data_num,1}=working_line;
            data_num=data_num+1;
            this_time=time_go(this_time,1);
            working_line='';
            %----------中间点到转站-----------
        else if (str2num(B_type)==2 && str2num(F_type)==1)
                %B_name
                F_name=work_list{i+1,2};
                %B_H
                F_H=work_list{i+1,3};
            
                %Rb=roundn(rand(1),-5)+0.5;
                Rf=roundn(str2num(B_H)+Rb-str2num(F_H),-5);
                %HD_B=roundn(rand(1)*50+10,-3);
                HD_F=roundn(HD_B+rand(1),-3);
%                 HD_F=roundn(rand(1)*30+10,-3);
                Df=Df+HD_F;
                this_time=time_go(this_time,1);
                %-------中转站第一行--------------
                working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|TO  End of interm. sight.     1|                      |                      |                      | '];
                data_table{data_num,1}=working_line;
                data_num=data_num+1;
                this_time=time_go(this_time,1);
                working_line='';
                %------中转站第二行-----------------
                working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      ' this_time '2   1|Rf' ];
                HD_F1=HD_F+ roundn(rand(1)/400,-3);
                Rf_1=roundn(Rf+0.00001,-5);
                working_line=[working_line full_some(full_some(num2str(Rf_1,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_F1),3),1,15,' ') ' m   |                      | '];
                data_table{data_num,1}=working_line;
               
                data_num=data_num+1;
                this_time=time_go(this_time,1);
                working_line='';
                %--------中转站第三行------------
                working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      ' this_time '2   1|Rf' ];
                HD_F2=(HD_F*2)-HD_F1;
                Rf_2=Rf*2-Rf_1;
                working_line=[working_line full_some(full_some(num2str(Rf_2,6),2,7,'0'),1,15,' ') ' m   |HD' full_some(save_r_num(num2str(HD_F2),3),1,15,' ') ' m   |                      | '];
                data_table{data_num,1}=working_line;
                data_num=data_num+1;
%                 this_time=time_go(this_time);
                working_line='';
                %------中转站第四行-------------
                working_line=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      ' this_time '    1|                      |                      |Z' full_some(save_r_num(num2str(F_H),5),1,16,' ') ' m   | '];
                data_table{data_num,1}=working_line;
                data_num=data_num+1;
                this_time=time_go(this_time,1);
                working_line='';
                num_of_set=num_of_set+1;
            end
        end
                

    end
    end
end
Sh=save_r_num(num2str(str2num(F_H)-str2num(jzd_H)),5);
data_table{data_num,1}=['For M5|Adr' full_some(num2str(data_num),1,6,' ') '|KD1' full_some(F_name,1,9,' ') '      ' '            1|Sh'];
data_table{data_num,1}=[data_table{data_num,1} full_some(Sh,1,15,' ') ' m   |dz'];
data_table{data_num,1}=[data_table{data_num,1} full_some(num2str(str2num(Sh)*(-1)),1,15,' ') ' m   |Z        ' jzd_H ' m   | '];
data_table{data_num+1,1}=['For M5|Adr' full_some(num2str(data_num+1),1,6,' ') '|KD2' full_some(F_name,1,9,' ') '      ' full_some(num2str(num_of_set-1),1,3,' ')];
data_table{data_num+1,1}=[data_table{data_num+1,1} '         1|Db' full_some(save_r_num(num2str(Db),2),1,15,' ')];
data_table{data_num+1,1}=[data_table{data_num+1,1} ' m   |Df' full_some(save_r_num(num2str(Df),2),1,15,' ') ' m   |Z        ' F_H ' m   | '];
data_table{data_num+2,1}=['For M5|Adr' full_some(num2str(data_num+2),1,6,' ') '|TO  End-Line                  1|                      |                      |                      | '];
        

    
    
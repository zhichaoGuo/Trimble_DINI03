function [output_num] = save_r_num( input_num,save_num )
%UNTITLED 00:00:00
%input:     input_num:��������      str
%           save_num:  ����λ��     num
%output:    output_num:�������     str
%   ��ȡ���֣�������λ�����������
%-------------TEXT1-----------------
%  input_num='1.11';
%  save_num=3;
% this_hour=str2num(this_time(1:2));
% this_min=str2num(this_time(4:5));
% this_sec=str2num(this_time(7:8));
%-------------------------
all=size(input_num,2);
int=length(num2str(fix(str2num(input_num))));
if (all<save_num+int+1)&&(all>int)
    output_num=full_some(input_num,2,save_num+int+1,'0');
elseif (all==int)
        output_num=full_some([input_num '.'],2,save_num+int+1,'0');
elseif (all>save_num+int+1)
            output_num=num2str(roundn(str2num(input_num),save_num*(-1)));
elseif (all==save_num+int+1)
    output_num=input_num;
   end
end


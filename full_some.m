function [output_str] = full_some( input_str,full_lr,full_to,full_itme )
%UNTITLED 00:00:00
%input:     input_str:������ֶ�              str
%           full_lr:��䷽��1Ϊ��2Ϊ��        num
%           full_to ������ֽ���              num
%           full_itme:�������                str
%output:    output_str�������ֶ�            str
%   ���������ֶ�����䷽��������ݼ�������ֽ������������Ρ�
%-------------TEXT1-----------------
% input_str='6';
% full_lr=2;
% full_to=5;
% full_itme=' ';
%-------------------------
output_str=input_str;
if length(input_str)<full_to
    if full_lr==1
        for i=1:(full_to-length(output_str))
            output_str=[full_itme output_str];
        end
    else if full_lr==2
            for i=1:(full_to-length(output_str))
            output_str=[output_str full_itme ];
            end
        end
    end
end
end
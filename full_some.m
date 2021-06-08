function [output_str] = full_some( input_str,full_lr,full_to,full_itme )
%UNTITLED 00:00:00
%input:     input_str:待填充字段              str
%           full_lr:填充方向1为左2为右        num
%           full_to 填充至字节数              num
%           full_itme:填充内容                str
%output:    output_str：填充后字段            str
%   输入待填充字段与填充方向填充内容及填充至字节数，输出填充后段。
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
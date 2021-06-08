% function [next_time] = time_go( this_time )
function [next_time] = time_go( this_time ,go_type)
%UNTITLED 00:00:00
%input:     this_time:����ʱ��      str
%            go_type:ǰ����ʽ��  1.b-b ��f-f     ��10-20s��
%                               2.bb-ff         ��300-500s��
%                               3.set-bb        ��600-1000s��
%                               4.z-z ��b-z     ��100-400s��
%                               5.
%output:    next_time:���ʱ��      str
%   ��ȡ��λʱ�䣬��������������м��50s��תվ300s�� ���������һʱ�䡣
%-------------TEXT1-----------------
% this_time='08:06:59';
% go_type=4;
this_hour=str2num(this_time(1:2));
this_min=str2num(this_time(4:5));
this_sec=str2num(this_time(7:8));
%--------------ѡ��ʱ��ӳ���-----------
if go_type==1
    add_time=fix(rand(1)*10)+10;
elseif go_type==2
    add_time=fix(rand(1)*200)+300;
elseif go_type==3
    add_time=fix(rand(1)*1000)+600;
elseif go_type==4
    add_time=fix(rand(1)*400)+100;
else
    add_time=fix(rand(1)*200);
end


%--------------------------------------

% add_time=fix(rand(1)*200);
if (this_sec+add_time)>60
    next_sec=(this_sec+add_time)-fix((this_sec+add_time)/60)*60;
    next_min=(this_min+fix((this_sec+add_time)/60))-fix((this_min+fix((this_sec+add_time)/60))/60)*60;
    next_hour=this_hour+fix((this_min+fix((this_sec+add_time)/60))/60);
else
    next_sec=this_sec+add_time;
    next_min=this_min;
    next_hour=this_hour;
end
%-------------------------------------------
next_time=[full_some( num2str(next_hour),1,2,'0' ) ':' full_some(  num2str(next_min),1,2,'0' ) ':' full_some(  num2str(next_sec),1,2,'0' )];


end


% function [next_time] = time_go( this_time )
function [next_time] = time_go( this_time ,go_type)
%UNTITLED 00:00:00
%input:     this_time:输入时间      str
%            go_type:前进方式，  1.b-b 或f-f     （10-20s）
%                               2.bb-ff         （300-500s）
%                               3.set-bb        （600-1000s）
%                               4.z-z 或b-z     （100-400s）
%                               5.
%output:    next_time:输出时间      str
%   读取两位时间，加上随机秒数（中间点50s，转站300s） 整理输出下一时间。
%-------------TEXT1-----------------
% this_time='08:06:59';
% go_type=4;
this_hour=str2num(this_time(1:2));
this_min=str2num(this_time(4:5));
this_sec=str2num(this_time(7:8));
%--------------选择时间加常数-----------
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


function [coeff1,coeff2]=pearson(i,j)
%PEARSON 求皮尔森相关系数


% 读取第i时新郑机场每小时航班到达比，获取xi
flight=xlsread('新郑机场每小时航班到达比.xlsx');
x=flight(i+1,3);
parameter1=flight(:,3);
parameter1=reshape(parameter1,1,24);


% 读取j月份平均每天全国客运量
passenger=xlsread('2019年我国民航月客运量.xlsx');
y=passenger(j,2)*(2912.93/58565.4)*10000;
parameter2=passenger(:,2)*(2912.93/58565.4)*10000;
parameter2=reshape(parameter2,1,12);


% 读取第i时司机平均收入
income=xlsread('出租车每小时收益.xlsx');
omiga=income(i+1,2)/60;
parameter3=income(:,2)/60;
parameter3=reshape(parameter3,1,24);

Omiga=1.417;


res=(1:24);
time=(1:24);
for t=1:24
    n=parameter1(1,t)*y;
    miu=0.15;
    lamuda=1/1.5;
    
    res(1,t)=45*Omiga*miu*lamuda*n/(60*parameter3(1,t));
    figure(1);
    scatter(time(1,t),res(1,t));
    hold on;
end

fenzi=sum(time.*res)-(sum(time)*sum(res))/length(time);  
fenmu=sqrt((sum(time.^2)-sum(time)^2/length(time))*(sum(res.^2)-sum(res)^2/length(time)));  
coeff1=fenzi/fenmu;  





res2=(1:12);
month=(1:12);
for t=1:12
    n=x*parameter2(1,t);
    miu=0.15;
    lamuda=1/1.5;
    
    res2(1,t)=45*Omiga*miu*lamuda*n/(60*omiga);
    figure(2);
    scatter(month(1,t),res2(1,t));
    hold on;
end
fenzi=sum(month.*res2)-(sum(month)*sum(res2))/length(month);  
fenmu=sqrt((sum(month.^2)-sum(month)^2/length(month))*(sum(res2.^2)-sum(res2)^2/length(month)));  
coeff2=fenzi/fenmu;  



end


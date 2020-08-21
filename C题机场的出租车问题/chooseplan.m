function chooseplan(m,i,j)
%CHOOSEPLAN 该函数用于计算在j月第i时，当出租车到达航站楼，蓄车池内有m辆车时，对两种方案进行决策

% 读取第i时新郑机场每小时航班到达比，获取xi
flight=xlsread('新郑机场每小时航班到达比.xlsx');
x=flight(i+1,3);


% 读取j月份平均每天全国客运量
passenger=xlsread('2019年我国民航月客运量.xlsx');
y=passenger(j,2)*(2912.93/58565.4)*10000;


% 读取第i时司机平均收入
income=xlsread('出租车每小时收益.xlsx');
omiga=income(i+1,2)/60;
Omiga=max(income(:,2))/60;




n=x*y;
miu=0.15;
lamuda=1/1.5;


% 获取可以接受的最大m0
m0=45*Omiga*miu*lamuda*n/(60*omiga);
disp('m0=');
disp(m0);

if m<m0
    disp('应选择方案一');
    W=45*Omiga;
    disp(W);
else
    disp('应选择方案二');
    W=60*m/(miu*lamuda*n)*omiga;
    disp(W);
end
    
end


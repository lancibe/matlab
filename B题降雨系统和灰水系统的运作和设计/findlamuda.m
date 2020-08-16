syms lamuda m
syms p n EY
p=input('请输入平均下雨天数');
EY=input('请输入平均降雨量');
m=EY*lamuda/p;
d1=input('请输入10%分位数');
d5=input('请输入50%分位数');
d9=input('请输入90%分位数');

data=zeros(10);

syms x;
for i=1:1:10
    lamuda=i;
    m=EY*lamuda/p;
    Fd1=int(lamuda^m*x^(m-1)*exp(-lamuda*x)/gamma(m),x,0,d1);
    Fd5=int(lamuda^m*x^(m-1)*exp(-lamuda*x)/gamma(m),x,0,d5);
    Fd9=int(lamuda^m*x^(m-1)*exp(-lamuda*x)/gamma(m),x,0,d9);
    
    t=i;
    data(t)=(Fd1-0.1)^2/0.09 + (Fd5-0.5)^2/0.25 + (Fd9-0.9)^2/0.09;
end
data=data(:,1);
data=reshape(data,1,10);
M=min(data);


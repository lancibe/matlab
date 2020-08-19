syms lamuda m
syms p n EY
p=input('请输入平均下雨天数');
EY=input('请输入平均降雨量');
n=input('请输入该月天数');
m=(EY/n)*lamuda/p;
d1=input('请输入10%分位数');
d5=input('请输入50%分位数');
d9=input('请输入90%分位数');

data1=zeros(10);




syms x;
for i=1:1:10
    lamuda=i;
    m=(EY/n)*lamuda/p;
    Fd1=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d1);
    Fd5=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d5);
    Fd9=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d9);
    
    data1(i)=((Fd1-0.1)^2)/0.09 + ((Fd5-0.5)^2)/0.25 + ((Fd9-0.9)^2)/0.09;
end
data1=data1(:,1);
data1=reshape(data1,1,10);
[M1,N1]=min(data1);

data2=zeros(20);
for i=10*(N1-1+0.1):1:10*(N1+1)
    lamuda=i/10;
    m=(EY/n)*lamuda/p;
    Fd1=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d1);
    Fd5=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d5);
    Fd9=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d9);
    
    t=i-(N1-1)*10;
    data2(t)=((Fd1-0.1)^2)/0.09 + ((Fd5-0.5)^2)/0.25 + ((Fd9-0.9)^2)/0.09;
end
data2=data2(:,1);
data2=reshape(data2,1,20);
[M2,N2]=min(data2);

data3=zeros(20);
for i=100*(  (N2-1)/10 + 0.01  )  :  1  :  100*(  (N2+1)/10  )
    lamuda=i/100;
    m=(EY/n)*lamuda/p;
    Fd1=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d1);
    Fd5=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d5);
    Fd9=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d9);
    
    t=i-(N2-1)*10;
    data3(t)=((Fd1-0.1)^2)/0.09 + ((Fd5-0.5)^2)/0.25 + ((Fd9-0.9)^2)/0.09;
end
data3=data3(:,1);
data3=reshape(data3,1,20);
[M3,N3]=min(data3);

data4=zeros(20);
for i=1000*(  (N3-1)/100 + 0.001  )  :  1  :  1000*(  (N3+1)/100  )
    lamuda=i/1000;
    m=(EY/n)*lamuda/p;
    Fd1=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d1);
    Fd5=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d5);
    Fd9=int(((lamuda^m)/gamma(m))*x^(m-1)*exp(-lamuda*x),x,0,d9);
    
    t=i-(N3-1)*10;
    t=int8(t);
    data4(t)=((Fd1-0.1)^2)/0.09 + ((Fd5-0.5)^2)/0.25 + ((Fd9-0.9)^2)/0.09;
end
data4=data4(:,1);
data4=reshape(data4,1,20);
[M4,N4]=min(data4);
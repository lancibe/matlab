function chooseplan(m,i,j)
%CHOOSEPLAN �ú������ڼ�����j�µ�iʱ�������⳵���ﺽվ¥���������m����ʱ�������ַ������о���

% ��ȡ��iʱ��֣����ÿСʱ���ൽ��ȣ���ȡxi
flight=xlsread('��֣����ÿСʱ���ൽ���.xlsx');
x=flight(i+1,3);


% ��ȡj�·�ƽ��ÿ��ȫ��������
passenger=xlsread('2019���ҹ����¿�����.xlsx');
y=passenger(j,2)*(2912.93/58565.4)*10000;


% ��ȡ��iʱ˾��ƽ������
income=xlsread('���⳵ÿСʱ����.xlsx');
omiga=income(i+1,2)/60;
Omiga=max(income(:,2))/60;




n=x*y;
miu=0.15;
lamuda=1/1.5;


% ��ȡ���Խ��ܵ����m0
m0=45*Omiga*miu*lamuda*n/(60*omiga);
disp('m0=');
disp(m0);

if m<m0
    disp('Ӧѡ�񷽰�һ');
    W=45*Omiga;
    disp(W);
else
    disp('Ӧѡ�񷽰���');
    W=60*m/(miu*lamuda*n)*omiga;
    disp(W);
end
    
end


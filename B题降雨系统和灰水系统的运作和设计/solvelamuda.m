syms m x lamuda

eq1=int((lamuda^m)*x^(m-1)*exp(-lamuda*x)/gamma(m),x,0,10);
eq2=int((lamuda^m)*x^(m-1)*exp(-lamuda*x)/gamma(m),x,0,50);
eq3=int((lamuda^m)*x^(m-1)*exp(-lamuda*x)/gamma(m),x,0,90);

[beta,theta]=vpasolve('eq1=1,eq2=5,eq3=9','lamuda,lamuda,lamuda')
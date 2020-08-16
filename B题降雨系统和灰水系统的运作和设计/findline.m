x=[10.9,36.9,99.2];
y=[0.1,0.5,0.9];
scatter(10.9,0.1);
hold on
scatter(36.9,0.5);
hold on
scatter(99.2,0.9);
p = polyfit(x,y,1);

ti=0:0.5:100;
yi=polyval(p,ti);
plot(x,y,':o',ti,yi)
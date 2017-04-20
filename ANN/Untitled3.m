T=zeros(1,6000);

for k=1:6000
 T(1,k)=a(8+k);    
end
[p1,minp,maxp,t1,mint,maxt]=premnmx(P,T);
%创建网络
net=newff(minmax(P),[784,500,10],{'tansig','tansig','purelin'},'trainlm');
%设置训练次数
net.trainParam.epochs = 5000;
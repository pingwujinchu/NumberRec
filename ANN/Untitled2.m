clear all;
clc;
% directoryname = uigetdir;
 %temp1=dir([directoryname,'*.bmp']);
 %num_temp1=length(temp1);

 [pname,adrname]=uigetfile('*.bmp');
 if exist(strcat(adrname,pname))
 temp=imread(strcat(adrname,pname));
 end

P=temp;
T=[0,0,0,0,0,1,0,0,0,0];

m=max(max(P));
n=max(max(T));
P=P'/m;
T=T'/n;
%-------------------------------------------------------------------------%
pr(0:9,1)=0; %输入矢量的取值范围矩阵
pr(0:9,2)=1;
bpnet=newff(pr,[12 10],{'logsig', 'logsig'}, 'traingdx', 'learngdm');
%建立BP神经网络， 12个隐层神经元，4个输出神经元
%tranferFcn属性 'logsig' 隐层采用Sigmoid传输函数
%tranferFcn属性 'logsig' 输出层采用Sigmoid传输函数
%trainFcn属性 'traingdx' 自适应调整学习速率附加动量因子梯度下降反向传播算法训练函数
%learn属性 'learngdm' 附加动量因子的梯度下降学习函数 
net.trainParam.epochs=1000;%允许最大训练步数2000步
net.trainParam.goal=0.001; %训练目标最小误差0.001
net.trainParam.show=10; %每间隔100步显示一次训练结果
net.trainParam.lr=0.05; %学习速率0.05
bpnet=train(bpnet,P,T);
%-------------------------------------------------------------------------
p=[110 1.318 300 0.1 15 2 18 1 2];
p=p'/m;

r=sim(bpnet,p);
R=r'*n;
display(R);
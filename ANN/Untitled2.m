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
pr(0:9,1)=0; %����ʸ����ȡֵ��Χ����
pr(0:9,2)=1;
bpnet=newff(pr,[12 10],{'logsig', 'logsig'}, 'traingdx', 'learngdm');
%����BP�����磬 12��������Ԫ��4�������Ԫ
%tranferFcn���� 'logsig' �������Sigmoid���亯��
%tranferFcn���� 'logsig' ��������Sigmoid���亯��
%trainFcn���� 'traingdx' ����Ӧ����ѧϰ���ʸ��Ӷ��������ݶ��½����򴫲��㷨ѵ������
%learn���� 'learngdm' ���Ӷ������ӵ��ݶ��½�ѧϰ���� 
net.trainParam.epochs=1000;%�������ѵ������2000��
net.trainParam.goal=0.001; %ѵ��Ŀ����С���0.001
net.trainParam.show=10; %ÿ���100����ʾһ��ѵ�����
net.trainParam.lr=0.05; %ѧϰ����0.05
bpnet=train(bpnet,P,T);
%-------------------------------------------------------------------------
p=[110 1.318 300 0.1 15 2 18 1 2];
p=p'/m;

r=sim(bpnet,p);
R=r'*n;
display(R);
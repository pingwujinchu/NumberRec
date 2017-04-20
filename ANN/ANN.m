input = 'F:\\AI\\train_idx3\\';
label ='F:\\人工智能实验\\train-labels-idx1-ubyte\\train-labels.idx1-ubyte';

testInput='F:\\AI\\t_idx3\\';
testLabel='F:\\人工智能实验\\t10k-labels-idx1-ubyte\\t10k-labels.idx1-ubyte';

mydir = dir([input,'*.bmp']);

testdir = dir([testInput,'*.bmp']);

trainInstance=zeros(784,60000);
trainLabelO=zeros(1,60000);
trainLabelF=zeros(4,60000);
trainLabelT=zeros(10,60000);

testInstance=zeros(784,10000);
testLabelO=zeros(1,10000);
testLabelF=zeros(4,10000);
testLabelT=zeros(10,10000);


%此处读入训练数据
for i = 1:60000
   filename=[input,mydir(i).name];
   tem = imread(filename);
   data = reshape(tem,1,28*28);
   for j=1:784
      trainInstance(j,i)=data(j); 
   end
end
   fid= fopen(label);
   [a,count] = fread(fid,inf);
    fclose(fid);
    
 for k=1:60000
 trainLabelT(a(8+k)+1,k)=1;    
 trainLabelF(4,k)=floor(a(8+k)/8);
 trainLabelF(3,k)=floor(mod(a(8+k),8)/4);
 trainLabelF(2,k)=floor(mod(a(8+k),4)/2);
 trainLabelF(1,k)=mod(a(8+k),2);
 
 trainLabelO(k)=a(8+k);
 end
 
 
 %此处读入测试数据
 for i = 1:10000
   testFilename=[testInput,testdir(i).name];
   tem = imread(testFilename);
   data = reshape(tem,1,28*28);
   for j=1:784
      testInstance(j,i)=data(j); 
   end
end
   fid= fopen(testLabel);
   [b,count] = fread(fid,inf);
    fclose(fid);
    
 for k=1:10000
 testLabelT(b(8+k)+1,k)=1;    
 testLabelF(4,k)=floor(b(8+k)/8);
 testLabelF(3,k)=floor(mod(b(8+k),8)/4);
 testLabelF(2,k)=floor(mod(b(8+k),4)/2);
 testLabelF(1,k)=mod(b(8+k),2);
 
 testLabelO(k)=b(8+k);
 end
 
%for h=1:10000
%   for n=1:784
%      if P(n,h) ==255
%         P(n,h)=0;
%      else
%         P(n,h)=1;
%      end
%   end
%end
%创建网络
   net=newff(minmax(trainInstance),[784,200,1],{'tansig','tansig','purelin'},'trainscg');
%设置训练次数
   net.trainParam.epochs = 5000;

   %net=newff(minmax(data),[784,500,10],{'tansig','tansig','purelin'},'trainlm');
   %net.trainParam.epochs = 5000;
   net.trainParam.goal=0.05;
   [net,tr]=train(net,trainInstance,testLabelO);

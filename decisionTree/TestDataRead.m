input = 'F:\\AI\\t_idx3\\';
label ='F:\\人工智能实验\\t10k-labels-idx1-ubyte\\t10k-labels.idx1-ubyte';

mydir = dir([input,'*.bmp']);
num = length(mydir);
TI=zeros(num,784);
TL=zeros(num,1);

for i = 1:num
   filename=[input,mydir(i).name];
   tem = imread(filename);
   data = reshape(tem,1,28*28);
   B= num2cell(data);
   fid= fopen(label);
   [a,count] = fread(fid,inf);
   for j=1:784
      TI(i,j)=data(j); 
   end
   fclose(fid);
end
 for k=1:num
 TL(k)=a(k+8);    
 end
 save mnist_test TI TL;
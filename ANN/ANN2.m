

input = 'F:\\�˹�����ʵ��\\train-images-idx3-ubyte\\train-images.idx3-ubyte';
label ='F:\\�˹�����ʵ��\\train-labels-idx1-ubyte\\train-labels.idx1-ubyte';


num = length(mydir);


  
   fid1 = fopen(input);
   [b,ct]=fread(fid1,inf);
  % data = reshape(tem,1,28*28);
   fid= fopen(label);
   [a,count] = fread(fid,inf);
    
   %imshow(tem);
   break;
    
    

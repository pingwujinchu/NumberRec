s=menu('ID3 decision tree','Decision Tree','Decisiontreepaint','10-fold cross graph','Express gratitude','Exit');
switch s
    case 1,delta=0.1;  
        input = 'F:\\AI\\train_idx3\\';
label ='F:\\人工智能实验\\train-labels-idx1-ubyte\\train-labels.idx1-ubyte';

mydir = dir([input,'*.bmp']);
num = length(mydir);
P=zeros(60000,784);
T=zeros(60000,1);

for i = 1:60000
   filename=[input,mydir(i).name];
   tem = imread(filename);
   data = reshape(tem,1,28*28);
   B= num2cell(data);
   fid= fopen(label);
   [a,count] = fread(fid,inf);
   for j=1:784
      P(i,j)=data(j); 
   end
   fclose(fid);
end
 for k=1:60000
 T(k)=a(k+8);    
 end
 save mnist P T;
 propertyName = cell(784,1);
 for l=1:784
     row = l/28+1;
     col = mod(l,28);
     propertyName{l}=num2str(l);
 end
     %decisionTreeModel=classregtree(P,T,'names',propertyName);  
    % [yfit,nodes,cnums]=eval(decisionTreeModel,TI);
     break;
    case 2,view(decisionTreeModel);
        break;
    case 3,
%    for h=1:60000
%       for n=1:784
%          if P(h,n) ==255
%             P(h,n)=0;
%          else
%             P(h,n)=1;
%          end
%      end
%    end
   
%       for h=1:10000
%         for n=1:784
%            if TI(h,n) ==255
%               TI(h,n)=0;
%            else
%               TI(h,n)=1;
%            end
%         end
%       end
     decisionTreeModel=classregtree(P,T,'names',propertyName,'prune','impurity');  
    t3 =  prune(decisionTreeModel,'criterion','error');
     [yfit2,nodes2,cnums2]=eval(decisionTreeModel,TI);
      break;
    case 4,
    
        view(t3);
end
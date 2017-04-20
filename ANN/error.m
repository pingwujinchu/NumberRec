count=0;
for i=1:10000
       
       if abs(network7_errors(1,i))>0.5
          count = count+1; 
       end
   
end

acc=1-count/10000;
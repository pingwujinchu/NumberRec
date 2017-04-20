for i = 1:10000
   for j=1: 784
      if testInstance(j,i)==255
          testInstance(j,i)=0;
      else
          testInstance(j,i)=1;
      end
   end
end
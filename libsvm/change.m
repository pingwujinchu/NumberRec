for i=1:10000
   for j=1:784
       if TI(i,j)==255
          TI(i,j)=0;
       else
          TI(i,j)=1;
       end
   end    
end
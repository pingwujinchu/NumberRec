TS=zeros(10000,4);
for k=1:10000
 TS(4,k)=floor(TL(k)/8);
 TS(3,k)=floor(mod(TL(k),8)/4);
 TS(2,k)=floor(mod(TL(k),4)/2);
 TS(1,k)=mod(TL(k),2);
 end
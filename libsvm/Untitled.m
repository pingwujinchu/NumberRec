F=zeros(60000,4);
TS=zeros(60000,10);
FT=zeros(10000,4);
TSL = zeros(10000,10);

for i=1:60000
 TS(i,T(i)+1)=1;
 F(i,4)=floor(T(i)/8);
 F(i,3)=floor(mod(T(i),8)/4);
 F(i,2)=floor(mod(T(i),4)/2);
 F(i,1)=mod(T(i),2);
end

for i=1:10000
 TSL(i,TL(i)+1)=1;
 FT(i,4)=floor(TL(i)/8);
 FT(i,3)=floor(mod(TL(i),8)/4);
 FT(i,2)=floor(mod(TL(i),4)/2);
 FT(i,1)=mod(TL(i),2);
    
end
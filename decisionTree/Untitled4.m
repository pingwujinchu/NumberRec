trueNumber =0;
falseNumber = 0;
result=TL-yfit2;
for k=1:10000
    if abs(result(k))>=0.5
        falseNumber = falseNumber+1;
    else
         trueNumber = trueNumber+1;
    end
end
Accuracy = trueNumber/10000;

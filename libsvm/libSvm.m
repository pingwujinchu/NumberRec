model = svmtrain(T, P);
[predict_label, accuracy, dec_values] = svmpredict(TL, TI, model);
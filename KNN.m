function resultLabel = KNN(inx,data,labels,k)
%inx Ϊ ����������ݣ�dataΪ�������ݣ�labelsΪ������ǩ


[datarow , ~] = size(data);
%�������������������ŷ�Ͼ���
diffMat = repmat(inx,[datarow,1]) - data ; 
distanceMat = sqrt(sum(diffMat.^2,2)); 
%�Ծ�����������
[B , IX] = sort(distanceMat,'ascend');
len = min(k,length(B));
%modeѡȡk������ϵ����������г���Ƶ����ߵ�
resultLabel = mode(labels(IX(1:len)));%IX�Ƕ�Ӧ�����������е�λ��

end
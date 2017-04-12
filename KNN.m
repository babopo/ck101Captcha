function resultLabel = KNN(inx,data,labels,k)
%inx 为 输入测试数据，data为样本数据，labels为样本标签


[datarow , ~] = size(data);
%计算测试数据与样本的欧氏距离
diffMat = repmat(inx,[datarow,1]) - data ; 
distanceMat = sqrt(sum(diffMat.^2,2)); 
%对距离升序排序
[B , IX] = sort(distanceMat,'ascend');
len = min(k,length(B));
%mode选取k个最符合的样本数据中出现频率最高的
resultLabel = mode(labels(IX(1:len)));%IX是对应距离在数组中的位置

end
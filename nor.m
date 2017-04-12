%%数值归一化
function newdataMat = nor(dataMat)
len = size(dataMat,1);
maxV = max(dataMat);
minV = min(dataMat);
range = maxV-minV;
newdataMat = (dataMat-repmat(minV,[len,1]))./(repmat(range,[len,1]));
end
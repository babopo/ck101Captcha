%仅用于测试


%读取分离好的字符，提取特征存入xls文档
file = dir('*.jpg');
for i = 1:length(file)
    filename = file(i).name;
    I = imread(filename);
    imshow(I);
    %提取4*4粗网格特征
    %统计每个网格黑点数目
    [x,y] = size(I);
    numB = zeros(4,4);
    for a = 1:x
        for b  = 1:y
            r = ceil(a/7);
            c = ceil(b/7);
            if I(a,b) == 0
                numB(r,c) = numB(r,c) + 1;
            end
        end
    end
    fea = reshape(numB,1,16);%变形为一维数组
    loc = strcat('A',num2str(i));
    xlswrite('feature.xls',fea,1,loc);%%改！！！！！！
end
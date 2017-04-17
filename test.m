%用于单幅验证码的测试

I = imread('0.png');

%转为lab色彩空间
lab = rgb2lab(I);

%k-means颜色聚类,背景杂色较多，因此K取值较大
K=45;

[m,n]=size(I(:,:,1));

% 将图像进行分解
A = reshape(lab(:, :, 1), m*n, 1);    % 将LAB分量各转为kmeans使用的数据格式n行，一样一样本
B = reshape(lab(:, :, 2), m*n, 1);
C = reshape(lab(:, :, 3), m*n, 1);
dat = [A B C];  % L A B分量组成样本的特征，每个样本有三个属性值，共width*height个样本
cLAB = kmeans(double(dat), K,'distance','sqEuclidean','Replicates',3);    % 使用聚类算法分为K类
rLAB = reshape(cLAB, m, n);     % 转化为图片的格式


%将点数较少和较多的区域设为背景
for K_L = 1:K
    LAB_BW = zeros(m,n); %获得反色图方便连通域去噪
    for i = 1:m
        for j  = 1:n
            if rLAB(i,j) == K_L
                LAB_BW(i,j) = 1;
            end
        end
    end
    %%
    %连通域去噪
    LAB_BW = bwareaopen(LAB_BW,70,4);%删除面积小于90的连通域，4邻域
    %反回正常颜色
    for i = 1:m
        for j  = 1:n
            LAB_BW(i,j) = 1 - LAB_BW(i,j);
        end
    end
    %figure,imshow(LAB_BW);
    %%
    %遍历数组统计类图黑点数
    Z = 0;
    for i = 1:m
        for j  = 1:n
            Z = Z + 1 - LAB_BW(i,j);
        end
    end
    %统计单类图像左右像素点宽度以将字母图像分离
    %竖直投影黑点个数
    ver_num = zeros(1,n);
    for i = 1:m
        for j  = 1:n
            ver_num(j) = ver_num(j) + 1 - LAB_BW(i,j);
        end
    end
    %水平方向投影黑点个数
    lel_num = zeros(1,m);
    for i = 1:m
        for j  = 1:n
            lel_num(i) = lel_num(i) + 1 - LAB_BW(i,j);
        end
    end
    %字符位置
    %可以通过width(1)的位置来判断该字符在整幅验证码中的位置
    [~,width] = find(ver_num ~= 0);
    [~,high] = find(lel_num ~= 0);
    if ~isempty(width) && ~isempty(high)  %防止类图为空
        w = width(end) - width(1);
        h = high(end) - high(1);
        if w < 25 && h < 28 && w > 7 && h >8 && Z<500 && Z>70 %像素点数和像素块的长宽是否符合要求
            %字符分割
            c_row = h;
            c_col = w;
            cut = zeros(c_row,c_col);
            for frow = 1:c_row
                for wcol = 1:c_col
                    cut(frow,wcol) = LAB_BW(high(1)-1+frow,width(1)-1+wcol);
                end
            end
            %归一化至28*28
            cut = normal(cut);
            save = strcat(num2str(width(1)/120),'.jpg'); %保存至其他文件夹
            imwrite(cut,save);
        end
    end
end
%%%可能得到的字符数量小于四个 ，，调整！！


%%%%

%读取分离好的字符，提取特征存入xls文档
file1 = dir('*.jpg');
for i = 1:length(file1)
    filename = file1(i).name;
    I = imread(filename);
    I = imbinarize(I); %将读取的jpg格式二值化，解决像素值改变的问题
    %提取4*4粗网格特征
    %统计每个网格黑点数目
    [m,n] = size(I);
    numB = zeros(4,4);
    for a = 1:m
        for b  = 1:n
            r = ceil(a/7);
            c = ceil(b/7);
            if I(a,b) == 0
                numB(r,c) = numB(r,c) + 1;
            end
        end
    end
    fea = reshape(numB,1,16);%变形为一维数组
    loc = strcat('A',num2str(i));
    xlswrite('feature.xls',fea,1,loc);
end

%delete('*.jpg')%删除字符图片方便批量处理

%读取字符特征数据并识别


%KNN
%rawdata = nor(xlsread('feature.xls'));%归一化处理
rawdata = xlsread('feature.xls');%未归一化
xlswrite('feature.xls',' ','Sheet1','A1:Q10');%清空工作表
%train;%读取样本数据
%samples = nor(xdata');%样本数据
samples = xdata';%样本数据 未归一化
labels = b2d(ydata');%样本标签
%分类
[m,n] = size(rawdata);
K1 = 4;%KNN中的K值
res = '';
for i = 1:m
    resultlabel = KNN(rawdata(i,:),samples,labels,K1);
    temp = classis(resultlabel);%获得对应的字符
    res = strcat(res,temp);
end

disp(res) %显示结果


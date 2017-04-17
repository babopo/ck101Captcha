%���ڵ�����֤��Ĳ���

I = imread('0.png');

%תΪlabɫ�ʿռ�
lab = rgb2lab(I);

%k-means��ɫ����,������ɫ�϶࣬���Kȡֵ�ϴ�
K=45;

[m,n]=size(I(:,:,1));

% ��ͼ����зֽ�
A = reshape(lab(:, :, 1), m*n, 1);    % ��LAB������תΪkmeansʹ�õ����ݸ�ʽn�У�һ��һ����
B = reshape(lab(:, :, 2), m*n, 1);
C = reshape(lab(:, :, 3), m*n, 1);
dat = [A B C];  % L A B�������������������ÿ����������������ֵ����width*height������
cLAB = kmeans(double(dat), K,'distance','sqEuclidean','Replicates',3);    % ʹ�þ����㷨��ΪK��
rLAB = reshape(cLAB, m, n);     % ת��ΪͼƬ�ĸ�ʽ


%���������ٺͽ϶��������Ϊ����
for K_L = 1:K
    LAB_BW = zeros(m,n); %��÷�ɫͼ������ͨ��ȥ��
    for i = 1:m
        for j  = 1:n
            if rLAB(i,j) == K_L
                LAB_BW(i,j) = 1;
            end
        end
    end
    %%
    %��ͨ��ȥ��
    LAB_BW = bwareaopen(LAB_BW,70,4);%ɾ�����С��90����ͨ��4����
    %����������ɫ
    for i = 1:m
        for j  = 1:n
            LAB_BW(i,j) = 1 - LAB_BW(i,j);
        end
    end
    %figure,imshow(LAB_BW);
    %%
    %��������ͳ����ͼ�ڵ���
    Z = 0;
    for i = 1:m
        for j  = 1:n
            Z = Z + 1 - LAB_BW(i,j);
        end
    end
    %ͳ�Ƶ���ͼ���������ص����Խ���ĸͼ�����
    %��ֱͶӰ�ڵ����
    ver_num = zeros(1,n);
    for i = 1:m
        for j  = 1:n
            ver_num(j) = ver_num(j) + 1 - LAB_BW(i,j);
        end
    end
    %ˮƽ����ͶӰ�ڵ����
    lel_num = zeros(1,m);
    for i = 1:m
        for j  = 1:n
            lel_num(i) = lel_num(i) + 1 - LAB_BW(i,j);
        end
    end
    %�ַ�λ��
    %����ͨ��width(1)��λ�����жϸ��ַ���������֤���е�λ��
    [~,width] = find(ver_num ~= 0);
    [~,high] = find(lel_num ~= 0);
    if ~isempty(width) && ~isempty(high)  %��ֹ��ͼΪ��
        w = width(end) - width(1);
        h = high(end) - high(1);
        if w < 25 && h < 28 && w > 7 && h >8 && Z<500 && Z>70 %���ص��������ؿ�ĳ����Ƿ����Ҫ��
            %�ַ��ָ�
            c_row = h;
            c_col = w;
            cut = zeros(c_row,c_col);
            for frow = 1:c_row
                for wcol = 1:c_col
                    cut(frow,wcol) = LAB_BW(high(1)-1+frow,width(1)-1+wcol);
                end
            end
            %��һ����28*28
            cut = normal(cut);
            save = strcat(num2str(width(1)/120),'.jpg'); %�����������ļ���
            imwrite(cut,save);
        end
    end
end
%%%���ܵõ����ַ�����С���ĸ� ������������


%%%%

%��ȡ����õ��ַ�����ȡ��������xls�ĵ�
file1 = dir('*.jpg');
for i = 1:length(file1)
    filename = file1(i).name;
    I = imread(filename);
    I = imbinarize(I); %����ȡ��jpg��ʽ��ֵ�����������ֵ�ı������
    %��ȡ4*4����������
    %ͳ��ÿ������ڵ���Ŀ
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
    fea = reshape(numB,1,16);%����Ϊһά����
    loc = strcat('A',num2str(i));
    xlswrite('feature.xls',fea,1,loc);
end

%delete('*.jpg')%ɾ���ַ�ͼƬ������������

%��ȡ�ַ��������ݲ�ʶ��


%KNN
%rawdata = nor(xlsread('feature.xls'));%��һ������
rawdata = xlsread('feature.xls');%δ��һ��
xlswrite('feature.xls',' ','Sheet1','A1:Q10');%��չ�����
%train;%��ȡ��������
%samples = nor(xdata');%��������
samples = xdata';%�������� δ��һ��
labels = b2d(ydata');%������ǩ
%����
[m,n] = size(rawdata);
K1 = 4;%KNN�е�Kֵ
res = '';
for i = 1:m
    resultlabel = KNN(rawdata(i,:),samples,labels,K1);
    temp = classis(resultlabel);%��ö�Ӧ���ַ�
    res = strcat(res,temp);
end

disp(res) %��ʾ���


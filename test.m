%�����ڲ���


%��ȡ����õ��ַ�����ȡ��������xls�ĵ�
file = dir('*.jpg');
for i = 1:length(file)
    filename = file(i).name;
    I = imread(filename);
    imshow(I);
    %��ȡ4*4����������
    %ͳ��ÿ������ڵ���Ŀ
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
    fea = reshape(numB,1,16);%����Ϊһά����
    loc = strcat('A',num2str(i));
    xlswrite('feature.xls',fea,1,loc);%%�ģ�����������
end
I = imread('0187.png');
[m,n] = size(I(:,:,1));
G = rgb2gray(I);%ԭ��Ҳ�����þ��鹫ʽ
temp = bwareaopen(G,70);

% fun = @(x) locbw(x(:));
% %%��������
% temp = nlfilter(G1,[5 5],fun);
figure;imshow(temp)
figure;imshow(G)
figure;imshow(I(:,:,3))

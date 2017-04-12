I = imread('0187.png');
[m,n] = size(I(:,:,1));
G = rgb2gray(I);%原理也是利用经验公式
temp = bwareaopen(G,70);

% fun = @(x) locbw(x(:));
% %%滑动邻域
% temp = nlfilter(G1,[5 5],fun);
figure;imshow(temp)
figure;imshow(G)
figure;imshow(I(:,:,3))

I = imread('1.png');
[m,n] = size(I(:,:,1));
G = rgb2gray(I);%原理也是利用经验公式
%转为灰度图
% %经验公式怎么用？
% for i = 1:m
%     for j = 1:n
%还应有一个循环
%         G(i,j) = (299*I(i,j,1) + 587*I(i,j,2) + 144*I(i,j,3) + 500)/1000;
%     end
% end
figure;imshow(G)
figure;imshow(histeq(G))

%%
%复制边界
emp = zeros(m,n);
temp1 = [emp(:,1),G,emp(:,end)];
[i,j] = size(temp1);
emp = zeros(i,j);
temp2 = [emp(1,:);temp1;emp(end,:)];

%有明显分块，不可行
% % %分块处理
% % fun = @(block_struct) locbw(block_struct.data);
% % bw = blockproc(temp2,[45 9],fun);

fun = @(x) locbw(x(:));
%%滑动邻域
temp = nlfilter(temp2,[3 3],fun);
% temp = nlfilter(temp2,[5,5],fun);
bw = zeros(m,n);
for i = 2:(m+1)
    for j  = 2:(n+1)
        bw(i-1,j-1) = temp(i,j);
    end
end
%otsu二值化
%bw = otsu(G);
% level = graythresh(G);
% bw = im2bw(G,level);
figure;imshow(bw)
%%

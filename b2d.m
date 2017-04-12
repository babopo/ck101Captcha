%将label的二进制矩阵转化为十进制数
function y = b2d(x)
%先将矩阵结果转化为十进制数
[m,n] = size(x);%m为逐句个数
y = zeros(m,1);
for i = 1:m
    for j = 1:n
    y(i) = y(i) + x(i,j) * (2^(n-j));
    end
end
end
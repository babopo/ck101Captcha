%��label�Ķ����ƾ���ת��Ϊʮ������
function y = b2d(x)
%�Ƚ�������ת��Ϊʮ������
[m,n] = size(x);%mΪ������
y = zeros(m,1);
for i = 1:m
    for j = 1:n
    y(i) = y(i) + x(i,j) * (2^(n-j));
    end
end
end
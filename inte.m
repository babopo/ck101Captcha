%使神经网络输出整数化
function y = inte(x)
[m,n] = size(x);
y = zeros(m,n);
for i = 1:m
    for j = 1:n
        if x(i,j) > 0.1
            y(i,j) = 1;
        else
            y(i,j) = 0;
        end
    end
end

end
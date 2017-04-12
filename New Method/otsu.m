%otsu二值化
function bw = otsu(I)
[m,n] = size(I);
Tm = 0;%记录T的值
DT = 0;%记录ostu公式的值
for T = 0:255   %设阈值为T，小于T的为A类，大于的为B类
    %求平均阈值
    u = 0;
    for i = 1:m
        for j = 1:n
            u = u + I(i,j);
        end
    end
    u = u / (m*n);
    %A类和B类平均阈值及比率
    wa = 0;
    wb = 0;
    ua = 0;
    ub = 0;
    for i = 1:m
        for j = 1:n
            if I(i,j) < T
                ua = ua + I(i,j);
                wa = wa + 1;
            else
                ub = ub + I(i,j);
                wb = wb + 1;
            end
        end
    end
    ua = ua / wa;
    ub = ub / wb;
    if (wa*(ua-u)^2 + wb*(ub-u)^2) > DT
        Tm = T;
        DT = wa*(ua-u)^2 + wb*(ub-u)^2;
    end
end
bw = Tm;
% %确定阈值后将灰度图转为二值图
% bw = ones(m,n);
% for i = 1:m
%     for j = 1:n
%         if I(i,j) < Tm
%             bw(i,j) = 0;
%         end
%     end
% end
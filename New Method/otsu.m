%otsu��ֵ��
function bw = otsu(I)
[m,n] = size(I);
Tm = 0;%��¼T��ֵ
DT = 0;%��¼ostu��ʽ��ֵ
for T = 0:255   %����ֵΪT��С��T��ΪA�࣬���ڵ�ΪB��
    %��ƽ����ֵ
    u = 0;
    for i = 1:m
        for j = 1:n
            u = u + I(i,j);
        end
    end
    u = u / (m*n);
    %A���B��ƽ����ֵ������
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
% %ȷ����ֵ�󽫻Ҷ�ͼתΪ��ֵͼ
% bw = ones(m,n);
% for i = 1:m
%     for j = 1:n
%         if I(i,j) < Tm
%             bw(i,j) = 0;
%         end
%     end
% end